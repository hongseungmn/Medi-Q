package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.AllFoodDTO;
import com.kosmo.springapp.model.AllFoodScoreDTO;
import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.CheckWordDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.UserInfoDTO;

@Mapper
public interface SelectFoodMapper {
	List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname,int casesel);
	List<FunctionalFoodListDTO> selectFoodListFromName(String foodname,int casesel);
	List<FunctionalFoodListDTO> selectFoodListFromNut(String nut);
	List<FunctionalFoodListDTO> healthissuetakefood(String healthissue);
	List<AvgStarScoreCountDTO> selectFoodListFromHealthissue(String healthissue);
	List<AvgStarScoreCountDTO> FoodListFromHealthissue(String healthissue);
	List<AvgStarScoreCountDTO> selectFoodListFoodScore();
	List<AvgStarScoreCountDTO> selectFoodListFoodScoreTop10();
	List<FunctionalFoodListDTO> RecommendationFood(String value);
	List<String> intakeFoodNo(String formatDate,String ID);
	AllFoodDTO intakeFoodData(String no);
	int IntakeFood(String no,String ID);
	List<AllFoodDTO> FoodSearch(String food);
	List<String> RankingKeyWord();
	List<CheckWordDTO> checkWord(String foodname);
	String healthIssueCou(String healthissue);
	String foodNo(String takefood);
	String checkUserinfo(String ID);
	UserInfoDTO userinfo(String ID);
	String checkUserscore(String ID,String formatDate);
	List<AllFoodDTO> myintakefoodlist(String ID,String formatDate);
	void deletefood(String no,String formatDate,String ID);
	void newUserscore(String ID,int Score);
	void updateUserscore(String ID,int Score,String formatDate);
	AllFoodScoreDTO foodscore(String ID,String formatDate);
	void newUserinfo(float Fatrate,float Prorate,float Cbhrate,int healthIssueSelect,float dailyCalories,String ID);
	void updateUserinfo(float Fatrate,float Prorate,float Cbhrate,int healthIssueSelect,float dailyCalories,String ID);
	void newWord(String foodname);
	void selectKeyWord(String foodname);
}
