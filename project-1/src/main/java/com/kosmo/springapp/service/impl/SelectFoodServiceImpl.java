package com.kosmo.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.AllFoodDTO;
import com.kosmo.springapp.model.AllFoodScoreDTO;
import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.CheckWordDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.UserInfoDTO;
import com.kosmo.springapp.service.SelectFoodMapper;
import com.kosmo.springapp.service.SelectFoodService;

@Service
public class SelectFoodServiceImpl implements SelectFoodService{

	@Autowired
	SelectFoodMapper mapper;

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFromNameScore(String foodname,int casesel) {
		return mapper.selectFoodListFromNameScore(foodname,casesel);
	}

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFoodScore() {
		return mapper.selectFoodListFoodScore();
	}

	@Override
	public List<FunctionalFoodListDTO> selectFoodListFromName(String foodname,int casesel) {
		return mapper.selectFoodListFromName(foodname,casesel);
	}

	@Override
	public List<String> RankingKeyWord() {
		System.out.println(mapper.RankingKeyWord());
		return mapper.RankingKeyWord();
	}

	@Override
	public void selectKeyWord(String foodname) {
		mapper.selectKeyWord(foodname);
	}

	@Override
	public List<CheckWordDTO> checkWord(String foodname) {
		return mapper.checkWord(foodname);
	}

	@Override
	public void newWord(String foodname) {
		mapper.newWord(foodname);
	}

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFoodScoreTop10() {
		return mapper.selectFoodListFoodScoreTop10();
	}

	@Override
	public List<AvgStarScoreCountDTO> selectFoodListFromHealthissue(String healthissue) {
		return mapper.selectFoodListFromHealthissue(healthissue);
	}

	@Override
	public List<AvgStarScoreCountDTO> FoodListFromHealthissue(String healthissue) {
		return mapper.FoodListFromHealthissue(healthissue);
	}

	@Override
	public String healthIssueCou(String healthissue) {
		return mapper.healthIssueCou(healthissue);
	}

	@Override
	public List<FunctionalFoodListDTO> selectFoodListFromNut(String nut) {
		return mapper.selectFoodListFromNut(nut);
	}

	@Override
	public List<FunctionalFoodListDTO> RecommendationFood(String value) {
		return mapper.RecommendationFood(value);
	}

	@Override
	public List<AllFoodDTO> FoodSearch(String food) {
		return mapper.FoodSearch(food);
	}

	@Override
	public int IntakeFood(String no, String ID) {
		return mapper.IntakeFood(no, ID);
	}

	@Override
	public List<FunctionalFoodListDTO> healthissuetakefood(String healthissue) {
		return mapper.healthissuetakefood(healthissue);
	}

	@Override
	public List<String> intakeFoodNo(String formatDate, String ID) {
		return mapper.intakeFoodNo(formatDate, ID);
	}

	@Override
	public AllFoodDTO intakeFoodData(String no) {
		return mapper.intakeFoodData(no);
	}

	@Override
	public String foodNo(String takefood) {
		return mapper.foodNo(takefood);
	}

	@Override
	public String checkUserinfo(String ID) {
		return mapper.checkUserinfo(ID);
	}

	@Override
	public void newUserinfo(float Fatrate, float Prorate, float Cbhrate, int healthIssueSelect, float dailyCalories,
			String ID) {
		mapper.newUserinfo(Fatrate, Prorate, Cbhrate, healthIssueSelect, dailyCalories, ID);
		
	}

	@Override
	public void updateUserinfo(float Fatrate, float Prorate, float Cbhrate, int healthIssueSelect,
			float dailyCalories, String ID) {
		mapper.updateUserinfo(Fatrate, Prorate, Cbhrate, healthIssueSelect, dailyCalories, ID);
	}

	@Override
	public UserInfoDTO userinfo(String ID) {
		return mapper.userinfo(ID);
	}

	@Override
	public void newUserscore(String ID, int Score) {
		mapper.newUserscore(ID, Score);
	}

	@Override
	public void updateUserscore(String ID, int Score,String formatDate) {
		mapper.updateUserscore(ID, Score,formatDate);		
	}

	@Override
	public String checkUserscore(String ID, String formatDate) {
		return mapper.checkUserscore(ID, formatDate);
	}

	@Override
	public List<AllFoodDTO> myintakefoodlist(String ID, String formatDate) {
		return mapper.myintakefoodlist(ID, formatDate);
	}

	@Override
	public AllFoodScoreDTO foodscore(String ID, String formatDate) {
		return mapper.foodscore(ID, formatDate);
	}

	@Override
	public void deletefood(String no, String formatDate, String ID) {
		mapper.deletefood(no, formatDate, ID);
	}
}
