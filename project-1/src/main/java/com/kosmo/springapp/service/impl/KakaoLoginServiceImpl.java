package com.kosmo.springapp.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.springapp.service.SocialLoginService;

@Service
public class KakaoLoginServiceImpl implements SocialLoginService{

	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token="";
		String refresh_Token="";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
		  URL url = new URL(reqURL);
	
		  HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		  conn.setRequestMethod("POST");
		  //POST 요청을 위해서 필요
		  conn.setDoOutput(true);
		  BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		  StringBuilder sb = new StringBuilder();
		  sb.append("grant_type=authorization_code")
		          .append("&client_id=")
		          .append("16c1121d0de60f9066904fb3ffc57c36")
		          .append("&redirect_uri=")
		          .append("http://localhost:9090/project/kakaoLogin.do")
		          .append("&code=")
		          .append(authorize_code);
		  bw.write(sb.toString());
		  bw.flush();
		  //200OK
		  int respCode = conn.getResponseCode();
	
		  //JSON 메세지
		  BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		  String line = "";
		  StringBuilder result = new StringBuilder();
	
		  while((line = br.readLine()) != null) {
		    result.append(line);
		  }
	
		  //jackson objectMapper 생성
		  ObjectMapper objectMapper = new ObjectMapper();
		  //Json String -> Map
		  Map<String, Object> jsonMap = objectMapper
		          .readValue(result.toString(), new TypeReference<Map<String, Object>>() {});
	
		  access_Token = jsonMap.get("access_token").toString();
		  refresh_Token = jsonMap.get("refresh_token").toString();
	
		  br.close();
		  bw.close();
		} catch (IOException e) {
		  e.printStackTrace();
		}
		return access_Token;
	}
	
	@Override
	public Map<String, Object> getUserInfo(String access_token) {
		Map<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
		  URL url = new URL(reqURL);
		  HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		  conn.setRequestMethod("GET");

		  //요청에 필요한 Header에 포함될 내용
		  conn.setRequestProperty("Authorization", "Bearer " + access_token);
		  int responseCode = conn.getResponseCode();//응답코드 200
		  BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		  String line = "";
		  StringBuilder result = new StringBuilder();
		  while ((line = br.readLine()) != null) {
		    result.append(line);
		  }
		  try {
		    // jackson objectmapper 객체 생성
		    ObjectMapper objectMapper = new ObjectMapper();
		    // JSON String -> Map
		    Map<String, Object> jsonMap = objectMapper.readValue(result.toString(), new TypeReference<Map<String, Object>>() {
		    });

		    Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

		    String email = kakao_account.get("email").toString();
		    String gender = kakao_account.get("gender").toString();
		    userInfo.put("email", email);//이메일
		    userInfo.put("gender", gender.substring(0,1).toUpperCase());//성별
		    userInfo.put("site", "kakao"); // 소셜 사이트명
		    
		    br.close();
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		} catch (IOException e) {
		  e.printStackTrace();
		}
		return userInfo;
	}
}
