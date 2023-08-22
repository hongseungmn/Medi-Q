package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.FunctionalFoodListDTO;

@Mapper
public interface MainPageMapper {

	List<FunctionalFoodListDTO> selectFoodList();

	FunctionalFoodListDTO selectFoodOneByNo(Map map);

	List selectFoodNameList(String searchWord);

	
}
