package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;

@Mapper
public interface AndroidMapper {

	List<FunctionalFoodListDTO> selectFoodList();

	List<FunctionalFoodListDTO> selectFoodListByNutrient(String nutrient);

	List<FunctionalFoodListDTO> selectFoodListByPurpose(String purpose);

	FunctionalFoodListDTO selectFood(String no);

	List<FunctionalFoodListDTO> selectFoodListByKeyWord(String keyword);

	String getFoodNameByNo(String no);

	FunctionalFoodListDTO selectFoodByName(String foodName);


}
