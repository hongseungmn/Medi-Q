package com.kosmo.springapp.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.ReviewService;
import com.kosmo.springapp.service.impl.ReviewServiceImpl;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewServiceImpl reviewServiceImpl;
	
	
	@RequestMapping(value = "/WriteReview.do", method = RequestMethod.POST)
	public String writeReview(@RequestBody Map map) {
		int result = reviewServiceImpl.registerReview(map);
		return "Detail";
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/SelectReview.do", method = RequestMethod.GET)
	public List<ReviewDTO> selectReview(@RequestParam Map map) {
		List<ReviewDTO> listDto = reviewServiceImpl.selectReviewByFoodNo(map);
		int current = Integer.parseInt(LocalDate.now().toString().split("-")[0]); //현재날짜 구하기

		for(ReviewDTO list : listDto) {
			int birtYear = list.getBirth()==null ? current : Integer.parseInt(list.getBirth().split("-")[0]);
			list.setBirth(Integer.toString((int)Math.floor((current-birtYear)/10)*10));
		}
		return listDto;
	}
	
	@ResponseBody
	@RequestMapping(value = "/DeleteReview.do", method = RequestMethod.POST)
	public int deleteReview(@RequestParam Map map) {
		int delete = reviewServiceImpl.deleteReview(map);
		return delete;
	}
}
