package com.kosmo.springapp.model;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("allFoodDto")
public class AllFoodDTO {
	private String no;
	private String foodname;
	private String company;
	private String oneprovide;
	private String capacity;
	private String calorie;
	private String protein;
	private String fat;
	private String carbohydrate;
	private String sugar;
	private String dietaryfiber;
	private String saturatedfat;
	private String unsaturatedfat;
	private String cholesterol;
	private String sodium;
	private String transfat;
}
