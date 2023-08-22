package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.AnalyzeReportDTO;

@Mapper
public interface AnalyzeMyReportMapper {
	
	List<String> selectFoodListForMyTakePurpose(String takePurpose);

	List<String> selectMyFoodList(String takeFood);

	List<String> selectIngredient_list();

	List<String> selectNutrient_list();

	int saveAnalyzeReport(AnalyzeReportDTO analyzeReportDTO);

	AnalyzeReportDTO selectAnalyzeReport(String id);

	List<AnalyzeReportDTO> selectAnalyzeReportAll(String id);

	int deleteAnalyzeReport(int analyzeno);

	int selectAnalyzeReportCount(String id);
}
