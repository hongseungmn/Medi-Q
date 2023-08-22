package com.kosmo.springapp.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

	@Bean
    public JavaMailSender javaMailService() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

        javaMailSender.setHost("smtp.gmail.com");
        javaMailSender.setUsername("hihello5018@gmail.com");
        javaMailSender.setPassword("gqhgobymhanlesgm");

        javaMailSender.setPort(465);// 메일 인증서버 포트

        javaMailSender.setJavaMailProperties(getMailProperties());// 메일 인증서버 정보 가져오기

        return javaMailSender;
    }

	
    private Properties getMailProperties() {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com"); 
        properties.put("mail.smtp.port", 465); 
        properties.put("mail.smtp.auth", "true"); 
        properties.put("mail.smtp.ssl.enable", "true"); 
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        return properties;
    }
}
