package com.kosmo.springapp.analyze.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.analyze.model.HealthIssueDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface AnalyzeService {
	
	NutrientDTO findNutrientByName(String str);
	HealthIssueDTO findHealthIssueByNo(int hno);
	FunctionalFoodListDTO selectFoodOneByName(String str);
	List<String> nutrientList();
}
