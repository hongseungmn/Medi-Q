package com.kosmo.springapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SpringappApplication /* extends SpringBootServletInitializer */ {

	public static void main(String[] args) {
		
		/*
		 스프링 컨텍스트를 초기화.
		 구성 파일을 로드하여 애플리케이션을 시작.
		 
		 내장된 웹 서버를 시작하고 필요한 빈을 생성 및 주입
		 애플리케이션을 실행하는 데 필요한 다른 초기화 작업을 수행한다
		 */
		
		SpringApplication.run(SpringappApplication.class, args);
		
	}//////////main

}
