package com.kosmo.springapp.magazine.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MagazineSelectMapper {

	List<String> getTitleCommonSense();

	List<String> getTitleNutrient();

	List<String> getTitleRecipe();

	List<String> getTitleTrue();

	List<String> getTitleHealth();
	
	
	// 조회수로 Top6 가져오기
	List<String> getTop6();



	
	

}/////////////////////////////////
