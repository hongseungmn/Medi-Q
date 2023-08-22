package com.kosmo.springapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.google.api.Http;
import com.kosmo.springapp.analyze.model.AnalyzeResultListDTO;
import com.kosmo.springapp.model.AnalyzeReportDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ProfileImageDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.model.TotalReviewDTO;
import com.kosmo.springapp.nutrient.service.impl.NutrientSelectMapper;
import com.kosmo.springapp.service.HeartCountMapper;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.AnalyzeMyReportServiceImpl;
import com.kosmo.springapp.service.impl.HeartCountServiceImpl;
import com.kosmo.springapp.service.impl.LoginServiceImpl;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;
import com.kosmo.springapp.service.impl.ReviewServiceImpl;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;

import org.springframework.http.HttpStatus;


@Controller
public class FoodDetailController {
	
	 @Autowired
	 MainPageServiceImpl mainPageServiceImpl;
	 
	 @Autowired
	 ReviewServiceImpl reviewServiceImpl;
	 
	 @Autowired
	 private NutrientSelectMapper nutrietnSelectMapper;
	 
	 @Autowired
	 HeartCountServiceImpl HeartCountService;
	 
	 @Autowired
	 SelectFoodServiceImpl selectfoodservice;
	 
	 @Autowired
	 private JWTokensService jwTokensService;
	 @Value("${token-name}")
	 private String tokenName;
	 @Value("${secret-key}")
	 private String secretKey;
	 
	 @GetMapping("/Heart.do")
	 @ResponseBody
	 @ResponseStatus(HttpStatus.OK)
	 public Map<String, Object> heartCount(HttpServletRequest req, @RequestParam String foodname) {
	     Map<String, Object> response = new HashMap<>();
	     
	     String token = jwTokensService.getToken(req, tokenName);
	     Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
	     String id = payloads.get("sub").toString();
	     foodname = foodname.replace("%20", " ");
	     String heart = HeartCountService.HeartCount(id, foodname);

	     // 서버에서 현재 좋아요 상태를 확인하여 response에 추가
	     response.put("heart", heart);
	     
	     if (heart.equals("0")) {
	         HeartCountService.insertHeart(id, foodname);
	     } else {
	         HeartCountService.deleteHeart(id, foodname);
	     }
	     
	     return response;
	 }
	
	 @GetMapping("/detail.do")
	 public String detailPage(HttpServletRequest req,Model model, Map map, @RequestParam String no) {
			map.put("no",Integer.parseInt(no));
		    FunctionalFoodListDTO listOne = mainPageServiceImpl.selectFoodOneByNo(map);
		    
		    //총 리뷰 수 가져오기
		    int totalReview = reviewServiceImpl.selectReviewByNo(Integer.parseInt(no));
		    model.addAttribute("totalReview", totalReview);
		    
		 	String token = jwTokensService.getToken(req, tokenName);
			Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
			if(payloads.get("sub")==null) {}
			else {
			String id = payloads.get("sub").toString();
			System.out.println(HeartCountService.HeartCount(id, listOne.getProductName()));
			model.addAttribute("heartcount", HeartCountService.HeartCount(id,listOne.getProductName()));
			}
		   	// 영양제의 조회수 가져오기
		    nutrietnSelectMapper.increaseF_VIEW(listOne.getProductName());
		    int f_view = nutrietnSelectMapper.getF_VIEW(listOne.getProductName());
		    model.addAttribute("fview", f_view);
		    TotalReviewDTO totalReviewDto = reviewServiceImpl.selectTotalReviewInfo(Integer.parseInt(no));
		    if(listOne.getStandard() != null) {
			   if(listOne.getStandard().contains("1)")) {
				   if(listOne.getStandard().contains("(1)")) {
					   String input = listOne.getStandard();
					   String pattern = "\\(\\d+\\).*?(?=\\(\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Sgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Sgroups.add(item);
				        }
				        model.addAttribute("Sgroups", Sgroups);
				   }
				   else {
					   String input = listOne.getStandard();
					   String pattern = "\\d+\\)\\s.*?(?=\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Sgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Sgroups.add(item);
				        }
				        model.addAttribute("Sgroups", Sgroups);
				   }
			   }
			   if(listOne.getStandard().contains("①")) {
				   String input = listOne.getStandard();
				   String pattern = "①|②|③|④|⑤|⑥|⑦|⑧|⑨|⑩";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Sgroups = new ArrayList<>();
			        
			        int start = 0;
			        while (matcher.find()) {
			            String item = input.substring(start, matcher.start()).trim();
			            Sgroups.add(item);
			            start = matcher.start();
			        }
			        String lastGroup = input.substring(start).trim();
			        Sgroups.add(lastGroup);
			        
			        model.addAttribute("Sgroups", Sgroups);
			   }
			   
			   if(listOne.getStandard().contains("1. ")) {
				   String input = listOne.getStandard();
				   String pattern = "\\d+\\.\\s?.*?(?=\\d+\\.|$)";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Sgroups = new ArrayList<>();
			        
			        while (matcher.find()) {
			            String item = matcher.group().trim();
			            Sgroups.add(item);
			        }
			        model.addAttribute("Sgroups", Sgroups);
			   }
			   
		   }
		   
		   if(listOne.getCaution() != null) {
			   if(listOne.getStandard().contains("1)")) {  
				   if(listOne.getCaution().contains("(1)")) {
					   String input = listOne.getCaution();
					   String pattern = "\\(\\d+\\)\\s.*?(?=\\(\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Cgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Cgroups.add(item);
				        }
				        model.addAttribute("Cgroups", Cgroups);
				   }
				   else {
					   String input = listOne.getCaution();
					   String pattern = "\\d+\\)\\s.*?(?=\\d+\\)|$)";
				        Pattern regex = Pattern.compile(pattern);
				        Matcher matcher = regex.matcher(input);
				        
				        List<String> Cgroups = new ArrayList<>();
				        
				        while (matcher.find()) {
				            String item = matcher.group().trim();
				            Cgroups.add(item);
				        }
				        model.addAttribute("Cgroups", Cgroups);
				   }
			   }
			   if(listOne.getCaution().contains("①")) {
				   String input = listOne.getCaution();
				   String pattern = "①|②|③|④|⑤|⑥|⑦|⑧|⑨|⑩";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Cgroups = new ArrayList<>();
			        
			        int start = 0;
			        while (matcher.find()) {
			            String item = input.substring(start, matcher.start()).trim();
			            Cgroups.add(item);
			            start = matcher.start();
			        }
			        String lastGroup = input.substring(start).trim();
			        Cgroups.add(lastGroup);
			        
			        model.addAttribute("Cgroups", Cgroups);
			   }
			   
			   if(listOne.getCaution().contains("1. ")) {
				   String input = listOne.getCaution();
				   String pattern = "\\d+\\.\\s?.*?(?=\\d+\\.|$)";
			        Pattern regex = Pattern.compile(pattern);
			        Matcher matcher = regex.matcher(input);
			        
			        List<String> Cgroups = new ArrayList<>();
			        
			        while (matcher.find()) {
			            String item = matcher.group().trim();
			            Cgroups.add(item);
			        }
			        model.addAttribute("Cgroups", Cgroups);
			   }
		   }
		   
		   model.addAttribute("listOne",listOne);
		   model.addAttribute("totalReviewDto",totalReviewDto);
		   return "Detail";
	 }
	 
	 
	 @GetMapping("/Review.do")
	 public String reviewPage(HttpServletRequest req,@RequestParam String no) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		String id = payloads.get("sub").toString();
		FunctionalFoodListDTO listOne = reviewServiceImpl.selectFoodOneByNo(Integer.parseInt(no));
		req.setAttribute("listOne", listOne);
		req.setAttribute("id", id);
		return "Review";
	 }
	 
	 
	 @Autowired
	 private LoginServiceImpl loginService;
	 
	 @GetMapping("/analyzeMyFood.do")
	 public String analyzeMyFood(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		 String userName;
		 ProfileImageDTO profImg;
		 try {
			 MemberDTO member = loginService.selectOne(req);
			 //System.out.println("member.getId() :"+member.getId());
			 profImg = loginService.selectProfImg(member.getId());
			 model.addAttribute("analyzeReport",analyzeMyReportServiceImpl.selectAnalyzeReport(member.getId()));
			 model.addAttribute("analzeReportAll",analyzeMyReportServiceImpl.selectAnalyzeReportAll(member.getId()));
			 System.out.println("analyzeMyReportServiceImpl.selectAnalyzeReportAll(member.getId()) : "+analyzeMyReportServiceImpl.selectAnalyzeReportAll(member.getId()).size());
			 userName = member.getName();
		 }
		 catch(NullPointerException e) {
			 resp.setContentType("text/html; charset=UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 out.println("<script>alert('회원정보가 필요한 서비스입니다\\r로그인 후 이용해 주세요');location.href=\'/project/Login.do\';</script>");
			 out.flush();
			 return null;
		 }
		 model.addAttribute("UserName" , userName);
		 model.addAttribute("profImg", profImg);
		 return "Analyze";
	 }
	 
	 @GetMapping("/AnalyzeNewReport.do")
	 public String analyzeNewReport(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		 String userName;
		 try {
			 MemberDTO member = loginService.selectOne(req);
			 userName = member.getName();
		 }
		 catch(NullPointerException e) {
			 resp.setContentType("text/html; charset=UTF-8");
			 resp.setCharacterEncoding("UTF-8");
			 PrintWriter out = resp.getWriter();
			 out.println("<script>alert('로그인 후 이용해 주세요');history.back();</script>");
			 out.flush();
			 return null;
		 }
		 model.addAttribute("UserName" , userName);
		 return "AnalyzeNewReport";
	 }
	 
	 @Autowired
	 AnalyzeMyReportServiceImpl analyzeMyReportServiceImpl; 
	 
	 @CrossOrigin
	 @PostMapping("/analyzeMyReport.do")
	 public String analyzeMyReport(@RequestParam Map<String,String> map,Model model,HttpServletRequest req,HttpServletResponse resp) {
		 
		 List<String> takeList = Arrays.asList(map.get("takePurpose").split(","));
		 List<String> foodList = Arrays.asList(map.get("takeFood").replaceAll("amp;","").split(","));
    	 Map<String,List<FunctionalFoodListDTO>> takelistfood = new HashMap<>();
         for (int i = 0; i < takeList.size(); i++) {
             takeList.set(i, takeList.get(i).trim());
         }
         for (int i = 0; i < foodList.size(); i++) {
        	 foodList.set(i, foodList.get(i).trim());
         }
         
         for(String helthissue:takeList) {
     		String Hissuecous = selectfoodservice.healthIssueCou(helthissue);
  			String[] Hissuecou = Hissuecous.split("\\$");
         	takelistfood.put(helthissue, selectfoodservice.healthissuetakefood(Hissuecou[0]));
            System.out.println(Hissuecous);
          }
         model.addAttribute("takelistfood", takelistfood);
		 Map<String,List<String>> userMap = new HashMap<>();
		 userMap.put("takePurpose", takeList);
		 System.out.println("userMap: takePurpose : "+userMap.get("takePurpose"));
		 userMap.put("takeFood", foodList);
		 System.out.println("userMap: takeFood : "+userMap.get("takeFood"));
		 MemberDTO memberDto = loginService.selectOne(req);
		 if(memberDto.getGender().equals("M")) {
			 AnalyzeResultListDTO resultListDto = analyzeMyReportServiceImpl.analyzeMyReportM(userMap);
			 analyzeMyReportServiceImpl.saveAnalyzeReport(memberDto.getId(),takeList,foodList,resultListDto.getResultScore());
			 model.addAttribute("memberDto",memberDto);
			 model.addAttribute("resultListDto",resultListDto);
		 }
		 else if(memberDto.getGender().equals("F")) {
			 AnalyzeResultListDTO resultListDto = analyzeMyReportServiceImpl.analyzeMyReportF(userMap);
			 analyzeMyReportServiceImpl.saveAnalyzeReport(memberDto.getId(),takeList,foodList,resultListDto.getResultScore());
			 model.addAttribute("memberDto",memberDto);
			 model.addAttribute("resultListDto",resultListDto);
		 }
		 return "AnalyzeReportResult";
	 }
	 @PostMapping("/analyzeMyReportReLoad.do")
	 public String analyzeMyReportReLoad(@RequestParam Map<String,String> map,Model model,HttpServletRequest req,HttpServletResponse resp) {
		 Map<String,List<FunctionalFoodListDTO>> takelistfood = new HashMap<>();
		 List<String> takeList = Arrays.asList(map.get("takePurpose").split(","));
         for (int i = 0; i < takeList.size(); i++) {
             takeList.set(i, takeList.get(i).trim());
         }
		 List<String> foodList = Arrays.asList(map.get("takeFood").replaceAll("amp;","").split(","));
         for (int i = 0; i < foodList.size(); i++) {
        	 foodList.set(i, foodList.get(i).trim());
         }
         for(String helthissue:takeList) {
     		String Hissuecous = selectfoodservice.healthIssueCou(helthissue);
  			String[] Hissuecou = Hissuecous.split("\\$");
         	takelistfood.put(helthissue, selectfoodservice.healthissuetakefood(Hissuecou[0]));
            System.out.println(Hissuecous);
          }
         model.addAttribute("takelistfood", takelistfood);
		 Map<String,List<String>> userMap = new HashMap<>();
		 userMap.put("takePurpose", takeList);
		 System.out.println("userMap: takePurpose : "+userMap.get("takePurpose"));
		 userMap.put("takeFood", foodList);
		 System.out.println("userMap: takeFood : "+userMap.get("takeFood"));
		 MemberDTO memberDto = loginService.selectOne(req);
		 if(memberDto.getGender().equals("M")) {
			 AnalyzeResultListDTO resultListDto = analyzeMyReportServiceImpl.analyzeMyReportM(userMap);
			 model.addAttribute("memberDto",memberDto);
			 model.addAttribute("resultListDto",resultListDto);
		 }
		 else if(memberDto.getGender().equals("F")) {
			 AnalyzeResultListDTO resultListDto = analyzeMyReportServiceImpl.analyzeMyReportF(userMap);
			 model.addAttribute("memberDto",memberDto);
			 model.addAttribute("resultListDto",resultListDto);
		 }
		 return "AnalyzeReportResult";
	 }
	 
	 @GetMapping("/searchMyFood.do")
	 @ResponseBody
	 public List searchMyFood(@RequestParam String searchWord) {
		 List<Map> nameList = mainPageServiceImpl.selectFoodNameList(searchWord);
		 return nameList;
	 }
	 
	 @GetMapping("/deleteAnalyzeReport.do")
	 @ResponseBody
	 public int deleteAnalyzeReport(@RequestParam String analyzeno) {
		 return analyzeMyReportServiceImpl.deleteAnalyzeReport(Integer.parseInt(analyzeno));
	 }
	 
	 @CrossOrigin
	 @GetMapping("/Android3DGraph")
	 public String anroid3DGraph(Model model,@RequestParam String no) {
		 model.addAttribute("no",no);
		 System.out.println("요청 들어옴");
		 return "Anroid3dGraph";
	 }
	 
}
