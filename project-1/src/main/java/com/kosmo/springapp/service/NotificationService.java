package com.kosmo.springapp.service;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.NotificationRequest;
import com.kosmo.springapp.service.impl.TakeFoodAlarmServiceImpl;

@Service
public class NotificationService {

	@Autowired
	private JWTokensService jwTokensService;
	@Autowired 
	private FCMService fcmService;
	@Autowired
	private TakeFoodAlarmServiceImpl takeFoodAlarmServiceImpl;
	
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	
	private final Map<String, Object> tokenMap = new HashMap<>();
	private final List<Map<String, Object>> tokenList = new Vector<>();
 
    //사용자의 Id값을 Key, 토큰 값을 Value로 갖는 Map을 사용해서 토큰 값을 관리한다.
    public void register(final String userId, final String fcmtoken, HttpServletRequest req, HttpServletResponse resp) {
        String loginToken = jwTokensService.getToken(req, tokenName);
    	boolean isLogin = jwTokensService.verifyToken(loginToken, tokenName, secretKey, req, resp);
    	List<Map> alarms = takeFoodAlarmServiceImpl.selectById(userId);
    	//System.out.println("alarms: "+alarms);
    	tokenList.clear();
    	for(Map alarm : alarms) {
    		String foodname = alarm.get("FOODNAME").toString();
    		String foodtime = alarm.get("ALARM_TIME").toString();
    		String weekly = alarm.get("WEEKLY").toString();
    		String foodcount = alarm.get("TAKE_PILL").toString();
    		
    		Map<String, Object> map = new HashMap<>();
    		map.put("foodname", foodname);
    		map.put("foodtime", foodtime);
    		map.put("weekly", weekly);
    		map.put("foodcount", foodcount);
    		
    		tokenList.add(map);
    	}
    	//System.out.println("아이디당 저장된 알람정보(register): "+tokenList);
    	tokenMap.put(userId, fcmtoken);
    	//System.out.println("fcm토큰정보: "+tokenMap.get(userId));
    	tokenMap.put("loginToken", loginToken);
    	tokenMap.put("isLogin", isLogin);
    }
    
    public void sendNotification(final NotificationRequest request) {
        try {
            fcmService.send(request);
        } catch (InterruptedException | ExecutionException e) {
            System.out.println(e.getMessage());
        }
    }
    
    @Scheduled(cron = "0 * * * * *")
    public void scheduled() {
    	LocalDateTime date = LocalDateTime.now();
    	DayOfWeek dayOfWeek = date.getDayOfWeek();
    	
    	String weekly = dayOfWeek.getDisplayName(TextStyle.SHORT,Locale.KOREAN); //현재 요일
    	String hour = Integer.toString(date.getHour()).length()==1 ? "0"+date.getHour() : Integer.toString(date.getHour());
    	String minute = Integer.toString(date.getMinute()).length()==1 ? "0"+date.getMinute() : Integer.toString(date.getMinute());
    	String current = hour+":"+minute; //현재 시간
    	System.out.println("아이디당 저장된 알람정보(scheduled): "+tokenList);
    	System.out.println("현재시간: "+current);
    	
    	for(Map map : tokenList) {
    		System.out.println("weekly: "+map.get("weekly"));
    		System.out.println("foodtime: "+map.get("foodtime"));
    		if(map.get("weekly").toString().contains(weekly) && map.get("foodtime").equals(current)) {
    			System.out.println("알림 떠야함!!!!!!");
        		createReceiveNotification(map.get("foodname").toString(),map.get("foodcount").toString());//보낼 때 정보 보내야함(복용 약,정 수)
        	}
    	}
	}
    
    private void createReceiveNotification(String foodname, String foodcount) {
        if ("true".equals(tokenMap.get("isLogin").toString())) {
        	String id = jwTokensService.getTokenPayloads(tokenMap.get("loginToken").toString(),secretKey).get("sub").toString();

        	NotificationRequest notificationRequest = NotificationRequest.builder()
                    .title("MEDI-Q")
                    .token(tokenMap.get(id).toString())
                    .message(String.format("%s님\r\n%s\r\n%s정 복용시간입니다",id,foodname,foodcount))
                    .icon("../images/mainicon-bg.png")
                    .build();
            sendNotification(notificationRequest);
        }
    }
    
    public ResponseEntity deleteToken() {
    	tokenMap.clear();
    	tokenList.clear();
    	
    	return ResponseEntity.ok().build();
    }
}
