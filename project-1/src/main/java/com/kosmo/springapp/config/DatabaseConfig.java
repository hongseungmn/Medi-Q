package com.kosmo.springapp.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration //설정파일을 만들기 위한 어노테이션 or Bean을 등록하기 위한 어노테이션
public class DatabaseConfig {
	
	//데이타 베이스 연결정보
	@Value("${driver-class-name}")
	private String driver;
	
	@Value("${oracle-url}")
	private String url;
	
	@Value("${user}")
	private String user;
	
	@Value("${password}")
	private String password;
	
	@Bean
	public DataSource dataSource() {//싱글톤
		//HikariConfig 객체 생성 후에 데이타베이스 연결 및 커넥션 풀 정보 설정
		HikariConfig hikariConfig = new HikariConfig();
		
		hikariConfig.setDriverClassName(driver);
		hikariConfig.setJdbcUrl(url);
		hikariConfig.setUsername(user);
		hikariConfig.setPassword(password);
		
		//히카리 커넥션 풀 관련 설정 추가
		//자동 커밋 설정(기본값 true)
		hikariConfig.setAutoCommit(true);
		
		//IDLE상태에 있는 커넥션이 없을 때. 즉 모든 커넥션이 사용 중 일 때
		//connection-timeout이 지날 때까지 getConnection() 호출은 블록킹된다
		hikariConfig.setConnectionTimeout(30000);
		
		//커넥션 풀에 최대 커넥션 수. (기본값: 10)
		hikariConfig.setMaximumPoolSize(10);
		
		//DataSource를 상속받은 HikariDataSource 객체 반환
		/*
		 위의 HikariConfig 객체로 설정 후 
		 다른 빈에서 DatabaseConfig 객체를 주입받아서
		 dataSource()를 계속 호출하더라도 동일한 하나의 dataSource 객체이다
		 싱글톤 이므로
		*/
		return new HikariDataSource(hikariConfig);
	}
	
	//트랜잭션 처리를 위한 빈 등록 -트랜잭션 처리할 때 마이바티스 사용
	//트랜잭션 관리자(매니저) 객체
	//@Bean 어노테이션은 @Configuration 어노테이션이 붙은 클래스 내에서 메소드 위에 붙여 사용
	//					해당 메소드가 반환하는 객체를 스프링 컨테이너의 빈으로 등록한다
	@Bean //타입기반 
	public DataSourceTransactionManager transactionManager(DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}
	
	//트랜잭션 관리자(매니저) 객체를 TransactionTemplate의 트랜잭션 관리자로 설정
	//TransactionTemplate으로 서비스단에서 트랜잭션 처리한다
	@Bean
	public TransactionTemplate transactionTemplate(DataSourceTransactionManager transactionManager) {
		TransactionTemplate transactionTemplate = new TransactionTemplate();
		transactionTemplate.setTransactionManager(transactionManager);
		
		return transactionTemplate;
	}
}
