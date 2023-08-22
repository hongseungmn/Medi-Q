package com.kosmo.springapp.model;

import org.apache.ibatis.type.Alias;
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
@Alias("MemoDto")
public class HealthMemoDTO {
	
	private String mm_Date;
	private String mm_Id;
	private String mm_Condition;
	private String mm_Head;
	private String mm_Resp;
	private String mm_Stomach;
	private String mm_Mental;
	private String mm_Chest;
	private String mm_Body;
	private String mm_Nutrients;
	private String mm_Allergy;
	private String mm_Height;
	private String mm_Weight;
	private String mm_Content;
}
