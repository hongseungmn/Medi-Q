package com.kosmo.springapp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.magazine.service.impl.MagazineSelectMapper;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.SelectFoodMapper;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;


@Controller
public class MagazineController {
	
	@Autowired
	MainPageServiceImpl mainPageService;
	@Autowired
	SelectFoodMapper mapper;
	
	@GetMapping("/magazine.do")
	  public String magazine(@RequestParam String no,Map map,Model model) {
	    //List<FunctionalFoodListDTO> listData = mainPageService.selectFoodList();
		List<FunctionalFoodListDTO> listData = new ArrayList<>();
		if(no.equals("01")) {
			listData =mapper.selectFoodListFromNut("아르기닌");
		}
		else if(no.equals("02")) {
			listData =mapper.selectFoodListFromNut("콜라겐");
		}
		else if(no.equals("03")) {
			listData =mapper.selectFoodListFromNut("히알루론산");
		}
		else if(no.equals("04")) {
			listData =mapper.selectFoodListFromNut("프로폴리스");
		}
		else if(no.equals("05")) {
			listData =mapper.selectFoodListFromNut("단백질");
		}
		else if(no.equals("06")) {
			listData =mapper.selectFoodListFromNut("프로바이오틱스");
		}
		else if(no.equals("08")) {
			listData =mapper.selectFoodListFromNut("황기");
		}
		else if(no.equals("11")) {
			listData =mapper.selectFoodListFromNut("식이섬유");
		}
		else if(no.equals("13")) {
			listData =mapper.selectFoodListFromNut("감태");
		}
		else if(no.equals("14")) {
			listData =mapper.selectFoodListFromNut("프로바이오틱스");
		}
		else if(no.equals("15")) {
			listData =mapper.selectFoodListFromNut("비타민D");
		}
		else if(no.equals("16")) {
			listData =mapper.selectFoodListFromNut("마그네슘");
		}
		else if(no.equals("17")) {
			listData =mapper.selectFoodListFromNut("EPA");
		}
		else if(no.equals("18")) {
			listData =mapper.selectFoodListFromNut("히알루론산");
		}
		else if(no.equals("19")) {
			listData =mapper.selectFoodListFromNut("단백질");
		}
		else {
			listData = mainPageService.selectFoodList();
		}
	    model.addAttribute("listData",listData);
	    return "slider/Magazine"+no;
	  }
	/*
	@GetMapping("/magazineindex.do")
	  public String magazineinddex(Map map) {
	    return "slider/MagazineIndex";
	  }
	*/
	@Autowired
	private MagazineSelectMapper magazineSelectMapper;
	
	//전체 카테고리로 이동
	@GetMapping("/magazineindex.do")
	public String magazineSelect(Map map, Model model) {
		
		List<String> titleCommonSense = magazineSelectMapper.getTitleCommonSense();
		model.addAttribute("titleCommonSense", titleCommonSense);
		List<String> titleNutrient = magazineSelectMapper.getTitleNutrient();
		model.addAttribute("titleNutrient", titleNutrient);
		List<String> titleRecipe = magazineSelectMapper.getTitleRecipe();
		model.addAttribute("titleRecipe", titleRecipe);
		List<String> titleTrue = magazineSelectMapper.getTitleTrue();
		model.addAttribute("titleTrue", titleTrue);
		List<String> titleHealth = magazineSelectMapper.getTitleHealth();
		model.addAttribute("titleHealth", titleHealth);
		//조회수에 따른 Top6 가져오기
		//List<String> top6 = magazineSelectMapper.getTop6();
		
		return "slider/MagazineIndex";
	}////////magazineSelect

	
	/*
	//영양제 상식 카테고리로 이동
	@GetMapping("/magazineCommonSense.do")
	public String magazineSelectCommonSense(Model model) {

	}////////magazineSelectCommonSense
	*/
	
	//영양소 A to Z 카테고리로 이동
	
	
	
	//영양제 레시피 카테고리로 이동
	
	
	
	//영양제 팩트체크 카테고리로 이동
	
	
	
	//Health & Life 카테고리로 이동
	
}///////////////////////////
