package com.kosmo.springapp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //@Configuration 를 붙여야 생성됨(설정파일을 생성하는 어노테이션)
public class WebConfiguration implements WebMvcConfigurer{
	//기존 리소스 핸들러는 그대로 유지되며 원하는 리소스 핸들러만 추가 가능
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//리소스 등록 및 핸들러를 관리하는 객체인 ResourceHandlerRegistry를 통해 
		//리소스 위치와 이 리소스와 매칭될 url을 등록하는 메소드
		//registry.addResourceHandler("/json/**").addResourceLocations("classpath:/json/");
		//registry.addResourceHandler("/config/**").addResourceLocations("classpath:/config/");
		//registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
	}
}
