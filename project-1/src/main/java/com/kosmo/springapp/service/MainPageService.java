package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Service
public interface MainPageService {
	List<FunctionalFoodListDTO> selectFoodList();
	FunctionalFoodListDTO selectFoodOneByNo(Map map);
	List selectFoodNameList(String searchWord);
}
