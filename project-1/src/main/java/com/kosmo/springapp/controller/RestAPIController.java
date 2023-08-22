package com.kosmo.springapp.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.springapp.analyze.model.AnalyzeResultDTO;
import com.kosmo.springapp.analyze.model.AnalyzeResultListDTO;
import com.kosmo.springapp.model.AnalyzeReportDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.NutIntakeDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.model.TotalReviewDTO;
import com.kosmo.springapp.service.impl.AnalyzeMyReportServiceImpl;
import com.kosmo.springapp.service.impl.AndroidServiceImpl;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;
import com.kosmo.springapp.service.impl.ReviewServiceImpl;

@RestController
@RestControllerAdvice
public class RestAPIController {
	
	@Autowired
	RestTemplate restTemplate;
	@PostMapping("/loadHealthInfoByOCR.do")
	public Map ocr(@RequestParam String base64) {
		restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
	    restTemplate.setErrorHandler(new DefaultResponseErrorHandler() {
	      @Override
	      public boolean hasError(ClientHttpResponse response) throws IOException {
	        HttpStatus status = response.getStatusCode();
	        return status.series() == HttpStatus.Series.SERVER_ERROR;
	      }
	    });

	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Authorization", "Bearer ya29.a0AfB_byAqyZRd0y1-p5Nfd3urSbNM2y-qYdUFNopeguCYRoBMwzeiW5iI3vHph-SM3RU1fCgMfLEzGjYDTNNJmpmPEs0h5KsB7g0ZgV0AFOIbCQiAZoVLxzLA-caalxFgVNs3xpoCQ7GOL6gO67umnDp9pKnEqN92hKNRo4NPWe1E5sojeDVdqSNJji2TE_az4M0JYjDt5EfaxNc_mQzZs5AaJwKjmwPzRh6_HgOhxzTSPq1JGmKow8wPYppDno_PhLKdzs3oA_-DYFgX1tWosn2SW8PppKOylScOrDl3PCft4kpxnGOiEgHY_MCsLWhcSSIAz_tDmwn5MB41LTPogKYzQMcxCJ1U4XABSwiHz37C87iD9oaAJtntqwFVP_S8Behy8fjdditv3PhiVQWMljS5FQaCgYKAYcSARASFQHsvYls4SCEp3ZpcuMNfLLok7fafA0417");
	    headers.add("x-goog-user-project", "sonic-trail-391102");
	    headers.add("Content-Type", "application/json;charset=utf-8");
	    headers.add("Accept-Language","ko-KR");


	    Map<String, List> requestBody = new HashMap<>();
	    List value = new Vector<>();

	    Map map = new HashMap<>();
	    Map imageValue = new HashMap<>();
	    imageValue.put("content", base64);
	    map.put("image", imageValue);

	    List featureValue = new Vector<>();
	    Map featureMap = new HashMap<>();
	    featureMap.put("type", "TEXT_DETECTION");
	    featureValue.add(featureMap);

	    map.put("features", featureValue);
	    value.add(map);
	    requestBody.put("requests",value);

	    HttpEntity entity = new HttpEntity(requestBody,headers);

	    String url = "https://vision.googleapis.com/v1/images:annotate";

	    //외부 OPEN API(구글) 서버로부터 받은 데이터 타입이 {} 인 경우 Map 혹은 DTO, [{},{},{},..]인 경우 List<Map 혹은 DTO>

	    ResponseEntity<Map> responseEntity = restTemplate.exchange(
	            url,//요청 URL
	            HttpMethod.POST, //요청 메소드
	            entity,//HttpEntity(요청 바디와 요청 헤더
	            Map.class //응답 데이터가 {} 일 때
	    );
	    return responseEntity.getBody();
	}
	
	
	
	
	@Autowired
	private AndroidServiceImpl androidServiceImpl;
	@GetMapping("/androidSelectAll.do")
	public List<FunctionalFoodListDTO> androidSelectAll() {
		return androidServiceImpl.selectFoodList();
	}
	@GetMapping("/androidSelectByNutrient.do/{nutrient}")
	public List<FunctionalFoodListDTO> androidSelectByNutrient(@PathVariable(name = "nutrient") String nutrient) {
		return androidServiceImpl.selectFoodListByNutrient(nutrient);
	}
	@GetMapping("/androidSelectByPurpose.do/{purpose}")
	public List<FunctionalFoodListDTO> androidSelectByPurpose(@PathVariable(name = "purpose") String purpose) {
		return androidServiceImpl.selectFoodListByPurpose(purpose);
	}
	@GetMapping("/androidSelectFood.do/{no}")
	public FunctionalFoodListDTO androidSelectFood(@PathVariable(name = "no") String no) {
		return androidServiceImpl.selectFood(no);
	}
	@GetMapping("/androidSelectFoodByKeyWord.do/{keyword}")
	public List<FunctionalFoodListDTO> androidSelectFoodByKeyWord(@PathVariable(name = "keyword") String keyword) {
		return androidServiceImpl.selectFoodListByKeyWord(keyword);
	}
	
	
	@Autowired
	AnalyzeMyReportServiceImpl analyzeMyReportServiceImpl; 
	
	@PostMapping("/AndroidGetAnalyzeResultReport.do")
	public AnalyzeResultListDTO androidGetAnalyzeResultReport(@RequestParam Map<String,String> map) {
		Map<String,Object> resultMap = new HashMap<>();
		List<String> takeList = Arrays.asList(map.get("takePurpose").replace("[", "").replace("]", "").split(","));
        for (int i = 0; i < takeList.size(); i++) {
            takeList.set(i, takeList.get(i).trim());
        }
        String modifiedString = map.get("takeFood").replace("[", "").replace("]", "");
        List<String> foodListNo = Arrays.asList(modifiedString.split(","));
        List<String> foodList = new ArrayList<>();
        for(String no : foodListNo) {
        	try {
        		int intNo = Integer.parseInt(no);
        		foodList.add(androidServiceImpl.getFoodNameByNo(no));
        		System.out.println("no : "+no);
        	} catch (Exception e) {
        		System.out.println("no : "+no);
        		foodList.add(no);
			}
        }
        for (int i = 0; i < foodList.size(); i++) {
       	 	foodList.set(i, foodList.get(i).trim());
        }
        Map<String,List<String>> userMap = new HashMap<>();
		userMap.put("takePurpose", takeList);
		userMap.put("takeFood", foodList);
		
		AnalyzeResultListDTO resultListDto = analyzeMyReportServiceImpl.analyzeMyReportM(userMap);
		System.out.println("resultListDto.getResultScore() : "+resultListDto.getResultScore());
		return resultListDto;
	}
	
	@Autowired
	private ReviewServiceImpl reviewServiceImpl;
	@GetMapping("/androidGetTotalReview/{foodNo}")
	public TotalReviewDTO androidGetTotalReview(@PathVariable(name = "foodNo") String foodNo) {
		TotalReviewDTO totalReviewDTO = reviewServiceImpl.selectTotalReviewInfo(Integer.parseInt(foodNo));
		return totalReviewDTO;
	}
	
	@CrossOrigin
	@ResponseBody
	@GetMapping("/androidGetReviewList")
	public List<ReviewDTO> selectReview(@RequestParam Map<String,String> map) {
		System.out.println("요청 들어옴");
		List<ReviewDTO> listDto = reviewServiceImpl.androidSelectReviewByFoodNo(map);
		int current = Integer.parseInt(LocalDate.now().toString().split("-")[0]); //현재날짜 구하기
		for(ReviewDTO list : listDto) {
			int birtYear = list.getBirth()==null ? current : Integer.parseInt(list.getBirth().split("-")[0]);
			list.setBirth(Integer.toString((int)Math.floor((current-birtYear)/10)*10));
		}
		return listDto;
	}
	
	
	@GetMapping("/androidGetUserInfoByUserId/{userId}")
	public MemberDTO androidGetUserInfoByUserId(@PathVariable(name = "userId") String userId) {
		return androidServiceImpl.getUserInfoByUserId(userId);
	}
	
	

	@GetMapping("/androidSelectAnalyzeReportOne/{userId}")
	public AnalyzeReportDTO androidSelectAnalyzeReportOne(@PathVariable(name = "userId") String userId) {
		return analyzeMyReportServiceImpl.selectAnalyzeReport(userId);
	}
	
	@GetMapping("/androidSelectAllAnalyzeReport/{userId}")
	public List<AnalyzeReportDTO> androidSelectAllAnalyzeReport(@PathVariable(name = "userId") String userId) {
		return analyzeMyReportServiceImpl.selectAnalyzeReportAll(userId);
	}
	
	@GetMapping("/androidSelectFoodByName.do/{foodName}")
	public FunctionalFoodListDTO androidSelectFoodByName(@PathVariable(name = "foodName") String foodName) {
		System.out.println("요청 들어옴 : "+foodName);
		return androidServiceImpl.selectFoodByName(foodName.trim());
	}
	
}
