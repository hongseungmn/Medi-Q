package com.kosmo.springapp.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthenticationInterceptor implements HandlerInterceptor{
/*
	@Value("${token-name}")
	private String tokenName;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Cookie[] cookies = request.getCookies();
		String token = "";
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(!tokenName.equals(cookie.getName())){//로그인 안된 경우
					return false;
				}
			}
		}
		return true;
	}
	*/
}
