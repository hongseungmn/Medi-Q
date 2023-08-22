package com.kosmo.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.model.TotalReviewDTO;
import com.kosmo.springapp.service.ReviewMapper;
import com.kosmo.springapp.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDTO reviewDTO;
	
	@Autowired
	ReviewMapper reviewMapper;
	
	@Override
	public int registerReview(Map map) {
		reviewDTO.setR_id(map.get("id").toString());
		reviewDTO.setTakeTime(map.get("takeTime").toString());
		reviewDTO.setStarScore(map.get("starScore").toString());
		reviewDTO.setEffect(map.get("effect").toString());
		reviewDTO.setNoEffect(map.get("noEffect").toString());
		reviewDTO.setContent(map.get("content").toString());
		reviewDTO.setR_productNo(Integer.parseInt(map.get("no").toString()));
		
		
		return reviewMapper.registerReview(reviewDTO);
	}

	@Override
	public FunctionalFoodListDTO selectFoodOneByNo(int no) {
		return reviewMapper.selectFoodOneByNo(no);
	}

	@Override
	public List<ReviewDTO> selectReviewByFoodNo(Map map) {
		return reviewMapper.selectReviewByFoodNo(map);
	}

	@Override
	public TotalReviewDTO selectTotalReviewInfo(int no) {
		TotalReviewDTO totalReviewDto = new TotalReviewDTO();
		float starScoreAVG = reviewMapper.selectTotalReviewInfoStarScoreAverage(no);
		
		System.out.println("starScoreAVG : "+starScoreAVG);
		totalReviewDto.setStarScoreTotal(starScoreAVG);
		Map starScore = reviewMapper.selectTotalReviewInfoStarScore(no);
		
		totalReviewDto.setStarScore(starScore);
		System.out.println("starScore : "+starScore);
		
		List<Map<String,Object>> effectList = reviewMapper.selectTotalReviewInfoEffectList(no);
		totalReviewDto.setEffectList(effectList);
		System.out.println("effectList : "+ effectList);
		
		List<Map<String,Object>> noEffectList = reviewMapper.selectTotalReviewInfoNoEffectList(no);
		totalReviewDto.setNoEffectList(noEffectList);
		System.out.println("noEffectList : "+noEffectList);
		
		return totalReviewDto;
	}
	
	public List<Map> selectReviewByUserId(String userId){
		return reviewMapper.selectReviewByUserId(userId);
	}

	public int deleteReview(Map map) {
		
		return reviewMapper.deleteReview(map);
	}

	public int selectReviewByNo(int no) {
		
		return reviewMapper.selectReviewByNo(no);
	}

	public List<ReviewDTO> androidSelectReviewByFoodNo(Map map) {
		return reviewMapper.androidSelectReviewByFoodNo(map);
	}

}
