package com.kosmo.springapp.analyze.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.analyze.model.HealthIssueDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;
import com.kosmo.springapp.analyze.service.AnalyzeMapper;
import com.kosmo.springapp.analyze.service.AnalyzeService;
import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public class AnalyzeServiceImpl implements AnalyzeService {

	@Autowired
	AnalyzeMapper mapper;
	
	public NutrientDTO findNutrientByName(String str) {
		return mapper.findNutrientByName(str);
	}
	
	public HealthIssueDTO findHealthIssueByNo(int hno) {
		return mapper.findHealthIssueByNo(hno);
	}

	public List<String> nutrientList() {
		return mapper.nutrientList();
	}

	@Override
	public FunctionalFoodListDTO selectFoodOneByName(String str) {
		return mapper.selectFoodOneByName(str);
	}
	
}
