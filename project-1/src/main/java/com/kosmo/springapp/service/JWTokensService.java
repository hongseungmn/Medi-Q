package com.kosmo.springapp.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JWTokensService {

	/**
	 * JWT토큰을 생성해서 반환하는 메소드
	 * @param username 사용자 아이디
	 * @param keyPath 비밀키가 기록된 .properties파일의 경로(단,확장자 생략)
	 * @param key .properties파일의 주어진 키값. 예: 키= 비밀키일 때의 키값
	 * @param payloads 추가로 사용자 정보를 저장하기 위한 Claims
	 * @expirationTime 토큰 만료 시간(15분에서 몇 시간이 적당).단위는 천분의 1초
	 * @return
	 */
	public String createToken(String username, String secretKey , Map<String, Object> payloads, long expirationTime) {
		
		//String secretKey = getSecretKey(keyPath, key);//비밀키 가져오기
		
		//JWT 토큰의 만료 시간 설정
		long currentTimeMillis = System.currentTimeMillis();//토큰의 생성시간
		expirationTime = currentTimeMillis + expirationTime; //토큰의 만료시간
		
		//Header 부분 설정
		Map<String, Object> headers = new HashMap<>();
		headers.put("typ", "JWT");
		headers.put("alg", "HS256");
	
		//payload 부분 설정 및 임의의 키로 추가적인 데이타(정보) 설정
		JwtBuilder builder = Jwts.builder()
				.setHeader(headers)// Headers 설정
				.setClaims(payloads)// Claims 설정
				.setSubject(username)//사용자 ID(email-소셜로그인) 설정 - JSON으로 변환될 때 sub 키로 변환(앞 3글자)
				.setIssuedAt(new Date(currentTimeMillis))//생성 시간을 설정
				.setExpiration(new Date(expirationTime))//만료 시간 설정(필수로 설정하자.왜냐하면 토큰(문자열이라)은 세션처럼 제어가 안된다)
				.signWith(SignatureAlgorithm.HS256,secretKey.getBytes());//비밀 키로 JWT를 서명
		
		//JWT 생성
		String jwt = builder.compact();
		
		return jwt;
	}////////////////createJWToken
	
	/**
	 * 발급한 토큰의 payloads부분을 반환하는 메소드
	 * @param token 발급토큰
	 * @param keyPath 비밀키가 기록된 .properties파일의 경로(단,확장자 생략)
	 * @param key .properties파일의 주어진 키값. 예: 키= 비밀키일 때의 키값
	 * @return 토큰의 payloads부분을 반환
	 */
	//JWT토큰 검증용 메소드
	public Map<String, Object> getTokenPayloads(String token, String secretKey) {
		//String secretKey = getSecretKey(keyPath, key);//비밀키 가져오기
			
		Map<String, Object> claims = new HashMap<>();
		try {
				//JWT토큰 파싱 및 검증
			claims = Jwts.parser()
					.setSigningKey(secretKey.getBytes("UTF-8"))//서명한 비밀키 설정
					.parseClaimsJws(token)//주어진 JWT토큰과 비밀 키를 사용하여 JWT토큰을 검증하는 메소드로 실패시 예외를 발생시킨다
					.getBody();
					
			return claims;
		} 
		catch (ExpiredJwtException e) { // 토큰이 만료되었을 경우
			claims.put("invalid","Validity period has expire");
		}
		catch (Exception e) {
			claims.put("invalid","Invalid Token");
		}
		return claims;
	}//////////verifyJWToken
		
	/**
	* 유효한 토큰인지 검증하는 메소드
	* @param token 발급토큰
	* @param keyPath 비밀키가 기록된 .properties파일의 경로(단,확장자 생략)
	* @param key .properties파일의 주어진 키값. 예: 키= 비밀키일 때의 키값
	* @return 유효한 토큰이면 true, 만료가됬거나 변조된 토큰인 경우 false반환
	*/

	//JWT토큰 검증용 메소드
	public boolean verifyToken(String token, String tokenName, String secretKey, HttpServletRequest req, HttpServletResponse resp) {
		//String secretKey = getSecretKey(keyPath, key);//비밀키 가져오기
		Map<String, Object> claims = new HashMap<>();
		try {
			//JWT토큰 파싱 및 검증
			claims = Jwts.parser()
					.setSigningKey(secretKey.getBytes("UTF-8"))//서명한 비밀키 설정
					.parseClaimsJws(token)//주어진 JWT토큰과 비밀 키를 사용하여 JWT토큰을 검증하는 메소드로 실패시 예외를 발생시킨다
					.getBody();
		} 
		catch (Exception e) { //토큰이 만료되었을 경우
			//e.printStackTrace();
			
			//로그아웃 처리- 세션영역에 저장된 속성 삭제
			removeToken(req, resp, tokenName);
			
			return false;
		}
		return true;
	}//////////verifyJWToken
	
	/**
	 * 문자열인 발급된 토큰을 요청헤더의 쿠키에서 읽어오는 메소드 
	 * @param request 요청헤더에서 쿠키를 읽어오기위한 HttpServletRequest객체
	 * @param cookieName 토큰 발급시 설정한 쿠키명
	 * @return 발급된 토큰
	 */
	public String getToken(HttpServletRequest request, String cookieName) {
	//발급한 토큰 가져오기
		Cookie[] cookies = request.getCookies();
		String token = "";
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookieName.equals(cookie.getName())){
					token = cookie.getValue();
				}
			}
		}
		return token;
	}
	
	/**
	 * 토큰을 삭제하는 메소드
	 * @param request HttpServletRequest 객체
	 * @param response HttpServletResponse 객체
	 */
	public void removeToken(HttpServletRequest request, HttpServletResponse response, String tokenName) {
		//로그아웃 처리- 세션영역에 저장된 속성 삭제
		Cookie cookie = new Cookie(tokenName,"");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}

	//토큰 만료시간 연장메소드
	//expiration:현재시간+연장시간
	public String setTokenExpiration(String jwt,String secretKey, Date expiration) {
			
		//비밀키 가져오기
		//String secretKey = getSecretKey(keyPath, key);
			
		String newToken=null;
		try{
			Claims claims = Jwts.parser()
		                .setSigningKey(secretKey.getBytes("UTF-8"))
		                .parseClaimsJws(jwt).getBody();	
				
		    claims.setExpiration(expiration);
		
		    newToken = Jwts.builder()
		                .setClaims(claims)
		                .signWith(SignatureAlgorithm.HS256,secretKey.getBytes("UTF-8"))
		                .compact();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	    return newToken;
	}
}
