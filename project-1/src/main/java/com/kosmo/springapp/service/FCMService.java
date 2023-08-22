package com.kosmo.springapp.service;

import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.google.firebase.messaging.WebpushFcmOptions.Builder;
import com.google.api.client.util.Key;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushFcmOptions;
import com.google.firebase.messaging.WebpushNotification;
import com.kosmo.springapp.model.NotificationRequest;



@Service
public class FCMService {
	/*
	메세지를 보낼 때 필요한 요소는 두가지이다.
	누가한테 보낼지 (토큰) - 토큰과 토픽 방식으로 보낼 수 있는데, 토큰을 사용했다.
	어떤 정보를 보낼지
	(FCM 메세지 참조 : https://firebase.google.com/docs/reference/fcm/rest/v1/projects.messages)
	
	아래와 같이 Message를 보내는 별도의 서비스를 만들었다. 
	NotificationRequest에는 받을 상대의 토큰값, 푸시될 알림 메세지와 제목을 가지고 있고, 
	사용은 하지 않았지만 이미지도 지정해서 넣어줄 수 있다.
	*/

    private static final Logger logger = LoggerFactory.getLogger(FCMService.class);
    
    @Autowired
	private JWTokensService jwTokensService;
    @Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;

    public void send(final NotificationRequest notificationRequest) throws InterruptedException, ExecutionException {
    	Message message = Message.builder()
                .setToken(notificationRequest.getToken())
                .setWebpushConfig(WebpushConfig.builder().putHeader("ttl", "300")
                        .setNotification(WebpushNotification.builder()
                        		.setTitle(notificationRequest.getTitle())
                        		.setBody(notificationRequest.getMessage())
                        		.setIcon(notificationRequest.getIcon())
                        		.build())
                        .build())
                .build();

        //Message Builder를 통해 만들어진 메세지를 정상적으로 보낸다면 
        //response에는 projects/woowa-turkey/messages/0:1568180254610207%cc9b4facf9fd7ecd 과 같은 
        //message의 값을 리턴받는다.
        FirebaseMessaging.getInstance().sendAsync(message);
        //String response = FirebaseMessaging.getInstance().sendAsync(message).get();
        //System.out.println("response: "+response);
        //logger.info("Send message: " + response);
    }

}
