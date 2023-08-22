package com.kosmo.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.io.BufferedReader;
import java.io.IOException;

@Controller
public class DietController {

	@GetMapping("/diet.do")
	public String diet(@RequestParam String takefood,Model model) throws IOException {
			String servicekey="UBz%2FBpfIr4b16tRz6OfBcfY6SVxRbM6okMr5NNa4x3X3HaNKrpCxAKVVh0m%2BXyzPPRMb%2FudU%2FtGp2kwfJ1E26Q%3D%3D";
			List<Map<String,String>> fooddiet = new ArrayList<Map<String,String>>();
			Map<String,String> onefooddiet = new HashMap<>();
		 	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/FoodNtrIrdntInfoService1/getFoodNtrItdntList1"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+servicekey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("desc_kor","UTF-8") + "=" + URLEncoder.encode(takefood, "UTF-8")); /*식품이름*/
	        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	        //urlBuilder.append("&" + URLEncoder.encode("bgn_year","UTF-8") + "=" + URLEncoder.encode("2017", "UTF-8")); /*구축년도*/
	        //urlBuilder.append("&" + URLEncoder.encode("animal_plant","UTF-8") + "=" + URLEncoder.encode("(유)돌코리아", "UTF-8")); /*가공업체*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) Default: xml*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            System.out.println(rd);
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        String jsonData =sb.toString();
	        Gson gson = new Gson();
	        JsonObject jsonObject = gson.fromJson(jsonData, JsonObject.class);
	        
	        // Extracting the values
	        int totalCount = jsonObject.getAsJsonObject("body").get("totalCount").getAsInt();
	        if (totalCount == 0) {
	            System.out.println("해당음식을 찾지 못하였습니다.");
	        }
	        else {
	        //List에 Map으로 담아서 뿌리기
	        if(totalCount >100) totalCount=100;
	        for(int i=0;i<totalCount;i++) {
	        String descKor = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                              .get(i).getAsJsonObject().get("DESC_KOR").getAsString();
	        String servingWeight = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                   .get(i).getAsJsonObject().get("SERVING_WT").getAsString();
	        String nutrCont1 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT1").getAsString();
	        String nutrCont2 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT2").getAsString();
	        String nutrCont3 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT3").getAsString();
	        String nutrCont4 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT4").getAsString();
	        String nutrCont5 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT5").getAsString();
	        String nutrCont6 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT6").getAsString();
	        String nutrCont7 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT7").getAsString();
	        String nutrCont8 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT8").getAsString();
	        String nutrCont9 = jsonObject.getAsJsonObject("body").getAsJsonArray("items")
	                                .get(i).getAsJsonObject().get("NUTR_CONT9").getAsString();
	        onefooddiet.put("foodname", descKor);
	        onefooddiet.put("onetime", servingWeight);
	        onefooddiet.put("calory", nutrCont1);
	        onefooddiet.put("Carbohydrate", nutrCont2);
	        onefooddiet.put("Protein", nutrCont3);
	        onefooddiet.put("fat", nutrCont4);
	        onefooddiet.put("sugar", nutrCont5);
	        onefooddiet.put("Sodium", nutrCont6);
	        onefooddiet.put("Cholesterol", nutrCont7);
	        onefooddiet.put("saturated", nutrCont8);
	        onefooddiet.put("Trans ", nutrCont9);
	        fooddiet.add(onefooddiet);
	        // Printing the values
	        System.out.println("식품이름: " + descKor);
	        System.out.println("1회제공량 (g): " + servingWeight);
	        System.out.println("열량 (kcal): " + nutrCont1);
	        System.out.println("탄수화물 (g): " + nutrCont2);
	        System.out.println("단백질 (g): " + nutrCont3);
	        System.out.println("지방 (g): " + nutrCont4);
	        System.out.println("당류 (g): " + nutrCont5);
	        System.out.println("나트륨 (mg): " + nutrCont6);
	        System.out.println("콜레스테롤 (mg): " + nutrCont7);
	        System.out.println("포화지방산 (g): " + nutrCont8);
	        System.out.println("트랜스지방산 (g): " + nutrCont9);
	        System.out.println(i+"번쨰 반복중");
	        	}
	        }
	        
	        model.addAttribute("foodlist", fooddiet);
			return "test1";
		}
		
	}
