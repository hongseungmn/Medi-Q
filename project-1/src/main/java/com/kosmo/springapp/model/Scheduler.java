package com.kosmo.springapp.model;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	//@Scheduled(cron = "0 * * * * *")
	public void test() {
		//현재 시간 분단위로 뽑아서 등록된 복용시간이랑,id 일치할 때 알림 띄워야함
		//토큰도 필요함??????????????????????????
		String c =LocalDateTime.now().toString();
		String current = c.substring(0,c.lastIndexOf(":")); //현재 시간
		System.out.println("현재시간: "+current);
		
		//사용자 알람시간
		String alam = LocalDateTime.of(2023,7,24,00,27).toString().split("\\.")[0];
		System.out.println("test: "+alam);
		if(alam.equals(current)) {
			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}		
	}

}
