package com.kosmo.springapp.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;

public class Common {
	
	//JWT토큰 검증용 메소드
	public static boolean isValid(String token, String secretKey, HttpServletRequest req, HttpServletResponse resp) {
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
			JWTokens.removeToken(req, resp);
				
			return false;
		}
		return true;
	}//////////verifyJWToken
	
	public static Map<String, Object> getTokenPayloads(String token, String secretKey) {			
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

}
