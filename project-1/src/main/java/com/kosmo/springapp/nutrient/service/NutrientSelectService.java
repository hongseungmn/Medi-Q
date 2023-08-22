package com.kosmo.springapp.nutrient.service;

public interface NutrientSelectService {

	// 영양소 상세설명 줄바꿈
	String editN_DESCbyVitaminName(String name);
	
	// 영양소 주의사항 줄바꿈 및 수정
	String editN_CAUTIONbyVitaminName(String name);
	
	// 원료 상세설명 줄바꿈
	String editI_DESCbyIngredientName(String name);
	
	// 원료 주의사항 줄바꿈 및 수정
	String editI_CAUTIONbyIngredientName(String name);
	
	
}