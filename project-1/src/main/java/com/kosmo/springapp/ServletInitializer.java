package com.kosmo.springapp;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//스프링부트도 서블릿 기반
public class ServletInitializer extends SpringBootServletInitializer {

	/*
	 스프링 부트 어플리케이션을 외부 서블릿 컨테이너(외부 톰캣)에서 실행하기 위한 클래스다
	 configure() 메서드는 외부 서블릿 컨테이너가 어플리케이션을 시작할 때 호출된다
	 이 파일은 프로젝트 생성 시 패키징을 .war로 선택 시 생성된다(.jar 에서는 생성 X)
	 */
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SpringappApplication.class);
	}

}
