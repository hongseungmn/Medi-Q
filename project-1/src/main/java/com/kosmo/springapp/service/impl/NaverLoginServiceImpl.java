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
public class NaverLoginServiceImpl implements SocialLoginService{

	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token="";
		String refresh_Token="";
		String reqURL = "https://nid.naver.com/oauth2.0/token";
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
		          .append("m0_NavLMe3aWfFRsood6")
		          .append("&client_secret=")
		          .append("7hXSCXI8MY")
		          .append("&redirect_uri=")
		          .append("http://localhost:9090/project/naverLogin.do")
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
		String reqURL = "https://openapi.naver.com/v1/nid/me";

		try {
		  URL url = new URL(reqURL);
		  HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		  conn.setRequestMethod("GET");

		  //요청에 필요한 Header에 포함될 내용
		  conn.setRequestProperty("Authorization", "Bearer " + access_token);
		  int responseCode = conn.getResponseCode();
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

		    Map<String, Object> naver_account = (Map<String, Object>) jsonMap.get("response");
		    //System.out.println("naver_account: "+naver_account);
		    String email = naver_account.get("email").toString();
		    String gender = naver_account.get("gender").toString();
		    String name = naver_account.get("name").toString();
		    String birth = naver_account.get("birthyear").toString().substring(2)+"/"+naver_account.get("birthday").toString().replace("-","/");
		   
		    userInfo.put("email", email);//이메일
		    userInfo.put("gender", gender);//성별
		    userInfo.put("name", name);
		    userInfo.put("site", "naver"); // 소셜 사이트명
		    userInfo.put("birth", birth);
		    
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
