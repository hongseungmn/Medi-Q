package com.kosmo.springapp.config;

import java.util.concurrent.TimeUnit;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTemplateConfig {

  @Bean
  public RestTemplate restTemplate() { // -> 컨테이너 빈에 등록됨
    //1.커넥션 풀 사용을 위한 HttpClient객체 생성
    CloseableHttpClient httpClient = HttpClientBuilder.create() // -> 커넥션 풀을 위한 HttpClient 객체가 생성됨
            .setMaxConnTotal(50)//연결을 유지할 최대 Http커넥션 수
            .setMaxConnPerRoute(50)//Route당(요청 URI주소당) 최대 Http커넥션 수
            .setConnectionTimeToLive(5,TimeUnit.SECONDS)//커넥션 연결 유지시간
            .build();
    //2.타임아웃 설정을 위한 객체 생성
    HttpComponentsClientHttpRequestFactory factory=new HttpComponentsClientHttpRequestFactory();
    factory.setConnectionRequestTimeout(3000);//요청 타임아웃 시간
    factory.setHttpClient(httpClient);

    return new RestTemplate(factory);
  }

}