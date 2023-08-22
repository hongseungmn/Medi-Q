package com.kosmo.springapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

@Configuration //컨테이너에 빈을 등록하기 위해
@PropertySource({"classpath:config/database.properties","classpath:config/tokens.properties","classpath:config/paging.properties"})
public class PlaceHolderConfig {
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer(); //컨테이너에 등록이 된다
	}
}
