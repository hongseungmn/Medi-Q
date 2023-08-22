package com.kosmo.springapp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kosmo.springapp.interceptor.AuthenticationInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	public WebMvcConfig() {
		
	}

	//아래 메소드에서 인터셉터를 등록한다
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		//registry.addInterceptor(new AuthenticationInterceptor()).addPathPatterns("/**");
		//.excludePathPatterns("/onememo/auth/**"); //인터셉터 빼고 싶은 부분 추가하기
	}
	
}
