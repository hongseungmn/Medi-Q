package com.kosmo.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.MainPageMapper;
import com.kosmo.springapp.service.MainPageService;

@Service
public class MainPageServiceImpl implements MainPageService{

	@Autowired
	MainPageMapper mapper;
	
	@Override
	public List<FunctionalFoodListDTO> selectFoodList() {
		return mapper.selectFoodList();
	}

	public FunctionalFoodListDTO selectFoodOneByNo(Map map) {
		return mapper.selectFoodOneByNo(map);
	}

	@Override
	public List selectFoodNameList(String searchWord) {
		return mapper.selectFoodNameList(searchWord);
	}

}
