package com.kosmo.springapp.analyze.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.analyze.model.HealthIssueDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Mapper
public interface AnalyzeMapper {
	
	NutrientDTO findNutrientByName(String str);
	HealthIssueDTO findHealthIssueByNo(int hno);
	FunctionalFoodListDTO selectFoodOneByName(String str);
	List<String> nutrientList();
}
