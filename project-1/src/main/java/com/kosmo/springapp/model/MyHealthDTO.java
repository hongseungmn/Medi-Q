package com.kosmo.springapp.model;

import org.springframework.stereotype.Component;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyHealthDTO {

	private String id;
	private String worry; //나의 건강 고민
	private String disease; //기저질환
	private String allergy; //알러지
	private String foodname; //영양제
	private String special; //건강 특수 상태
}
