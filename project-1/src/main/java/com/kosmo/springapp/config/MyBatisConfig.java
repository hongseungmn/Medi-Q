package com.kosmo.springapp.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(value = {"com.kosmo.springapp.service", 
					"com.kosmo.springapp.nutrient.service",
					"com.kosmo.springapp.analyze.service",
					"com.kosmo.springapp.qnabbs.service",
					"com.kosmo.springapp.magazine.service",
          			"com.kosmo.springapp.admin.service"}, sqlSessionFactoryRef = "sqlSessionFactory")
public class MyBatisConfig {

	private final ApplicationContext applicationContext; //생성자 생성하므로 초기화 x
	
	public MyBatisConfig(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}

	@Autowired
	private DatabaseConfig databaseConfig;
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() {
	
		SqlSessionFactory factory = null;
		
		try {
			SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();

			factoryBean.setDataSource(databaseConfig.dataSource());
			factoryBean.setTypeAliasesPackage("com.kosmo.springapp");		
			factoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/**.xml"));
			factory = factoryBean.getObject();
		}
		catch (Exception e) {e.printStackTrace();}
		
		return factory;
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
