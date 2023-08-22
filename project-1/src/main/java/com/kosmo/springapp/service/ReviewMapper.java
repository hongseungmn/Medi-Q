package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.model.TotalReviewDTO;

@Mapper
public interface ReviewMapper {

	int registerReview(ReviewDTO reviewDTO);

	FunctionalFoodListDTO selectFoodOneByNo(int no);

	List<ReviewDTO> selectReviewByFoodNo(Map map);

	float selectTotalReviewInfoStarScoreAverage(int no);

	Map selectTotalReviewInfoStarScore(int no);

	List<Map<String, Object>> selectTotalReviewInfoEffectList(int no);

	List<Map<String, Object>> selectTotalReviewInfoNoEffectList(int no);

	List<Map> selectReviewByUserId(String userId);

	int deleteReview(Map map);
	
	int selectReviewByNo(int no);

	List<ReviewDTO> androidSelectReviewByFoodNo(Map map);
}
