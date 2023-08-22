package com.kosmo.springapp.nutrient.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.nutrient.service.impl.NutrientSelectMapper;
import com.kosmo.springapp.nutrient.service.impl.NutrientSelectServiceImpl;

@Controller
public class NutrientController {

	@Autowired
	private NutrientSelectMapper nutrietnSelectMapper;
	
	@Autowired
	private NutrientSelectServiceImpl nutrientSelectServiceImpl;
	
	// 인기 영양소 페이지로 이동
	@GetMapping("/NutrientSelect.do")
	public String nutrientselect(Model model) {
		
		List<String> vitaminNames = nutrietnSelectMapper.getVitaminName();
		model.addAttribute("vitaminNames",vitaminNames);
		
		List<String> etcNames = nutrietnSelectMapper.getETCName();
		model.addAttribute("etcNames",etcNames);
		
		List<String> ingredientNames = nutrietnSelectMapper.getIngredientName();
		model.addAttribute("ingredientNames",ingredientNames);
		
		// 조회수에 따른 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		// 인기 영양소 Top5 검색수
        List<String> top5 = nutrietnSelectMapper.getTop5();
		model.addAttribute("top5",top5);
		
		// 비타민 Top5 검색수
		List<String> top5v = nutrietnSelectMapper.getTop5v();
		model.addAttribute("top5v",top5v);
		
		// 미네랄 Top5 검색수
		List<String> top5m = nutrietnSelectMapper.getTop5m();
		model.addAttribute("top5m",top5m);
		
		// 기능성 원료 Top5 검색수
		List<String> top5i = nutrietnSelectMapper.getTop5i();
		model.addAttribute("top5i",top5i);
        
		return "nutrient/NutrientSelect";
	}
	
	// 비타민 페이지로 이동
	@GetMapping("/NutrientSelectVitamin.do")
	public String nutrientselectvitamin(Model model) {
		
		List<String> vitaminNames = nutrietnSelectMapper.getVitaminName();
		model.addAttribute("vitaminNames",vitaminNames);
		
		List<String> etcNames = nutrietnSelectMapper.getETCName();
		model.addAttribute("etcNames",etcNames);
		
		List<String> ingredientNames = nutrietnSelectMapper.getIngredientName();
		model.addAttribute("ingredientNames",ingredientNames);
		
		// 조회수에 따른 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		// 인기 영양소 Top5 검색수
        List<String> top5 = nutrietnSelectMapper.getTop5();
		model.addAttribute("top5",top5);
		
		// 비타민 Top5 검색수
		List<String> top5v = nutrietnSelectMapper.getTop5v();
		model.addAttribute("top5v",top5v);
		
		// 미네랄 Top5 검색수
		List<String> top5m = nutrietnSelectMapper.getTop5m();
		model.addAttribute("top5m",top5m);
		
		// 기능성 원료 Top5 검색수
		List<String> top5i = nutrietnSelectMapper.getTop5i();
		model.addAttribute("top5i",top5i);
		
		return "nutrient/NutrientSelectVitamin";
	}
	
	// 미네랄 페이지로 이동
	@GetMapping("/NutrientSelectMineral.do")
	public String nutrientselectmineral(Model model) {
		
		List<String> vitaminNames = nutrietnSelectMapper.getVitaminName();
		model.addAttribute("vitaminNames",vitaminNames);
		
		List<String> etcNames = nutrietnSelectMapper.getETCName();
		model.addAttribute("etcNames",etcNames);
		
		List<String> ingredientNames = nutrietnSelectMapper.getIngredientName();
		model.addAttribute("ingredientNames",ingredientNames);
		
		// 조회수에 따른 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		// 인기 영양소 Top5 검색수
        List<String> top5 = nutrietnSelectMapper.getTop5();
		model.addAttribute("top5",top5);
		
		// 비타민 Top5 검색수
		List<String> top5v = nutrietnSelectMapper.getTop5v();
		model.addAttribute("top5v",top5v);
		
		// 미네랄 Top5 검색수
		List<String> top5m = nutrietnSelectMapper.getTop5m();
		model.addAttribute("top5m",top5m);
		
		// 기능성 원료 Top5 검색수
		List<String> top5i = nutrietnSelectMapper.getTop5i();
		model.addAttribute("top5i",top5i);
		
		return "nutrient/NutrientSelectMineral";
	}
	
	// 기능성 원료 페이지로 이동
	@GetMapping("/NutrientSelectFunctional.do")
	public String nutrientselectfunctional(Model model) {
		
		List<String> vitaminNames = nutrietnSelectMapper.getVitaminName();
		model.addAttribute("vitaminNames",vitaminNames);
		
		List<String> etcNames = nutrietnSelectMapper.getETCName();
		model.addAttribute("etcNames",etcNames);
		
		List<String> ingredientNames = nutrietnSelectMapper.getIngredientName();
		model.addAttribute("ingredientNames",ingredientNames);
		
		// 조회수에 따른 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		// 인기 영양소 Top5 검색수
        List<String> top5 = nutrietnSelectMapper.getTop5();
		model.addAttribute("top5",top5);
		
		// 비타민 Top5 검색수
		List<String> top5v = nutrietnSelectMapper.getTop5v();
		model.addAttribute("top5v",top5v);
		
		// 미네랄 Top5 검색수
		List<String> top5m = nutrietnSelectMapper.getTop5m();
		model.addAttribute("top5m",top5m);
		
		// 기능성 원료 Top5 검색수
		List<String> top5i = nutrietnSelectMapper.getTop5i();
		model.addAttribute("top5i",top5i);
		
		return "nutrient/NutrientSelectFunctional";
	}
	
	// 상세 페이지로 이동
	@GetMapping("/NutrientDetail.do")
	public String nutrientdetail(@RequestParam String name, Model model) {
		
		if(name.equals("비타민B1") || name.equals("티아민")) {
			name = "비타민B1(티아민)";
		}
		if(name.equals("비타민B2") || name.equals("리보플라빈")) {
			name = "비타민B2(리보플라빈)";
		}
		if(name.equals("나이아신") || name.equals("비타민B3")) {
			name = "비타민B3(나이아신)";
		}
		if(name.equals("비타민B5") || name.equals("판토텐산")) {
			name = "비타민B5(판토텐산)";
		}
		if(name.equals("피리독신") || name.equals("비타민B6")) {
			name = "비타민B6(피리독신)";
		}
		if(name.equals("비타민B7") || name.equals("비오틴")) {
			name = "비타민B7(비오틴)";
		}
		if(name.equals("비타민B9") || name.equals("엽산")) {
			name = "비타민B9(엽산)";
		}
		if(name.equals("코발라민") || name.equals("비타민B12")) {
			name = "비타민B12(코발라민)";
		}
		if(name.equals("아스코르브산") || name.equals("비타민C")) {
			name = "비타민C(아스코르브산)";
		}
		if(name.equals("콜레칼시페롤") || name.equals("비타민D")) {
			name = "비타민D(콜레칼시페롤)";
		}
		if(name.equals("토코페롤") || name.equals("비타민E")) {
			name = "비타민E(토코페롤)";
		}
		if(name.equals("필로퀴논") || name.equals("비타민K")) {
			name = "비타민K(필로퀴논)";
		}

		
		// 탭 이동시 뿌려주기
		List<String> vitaminNames = nutrietnSelectMapper.getVitaminName();
		model.addAttribute("vitaminNames",vitaminNames);
		
		List<String> etcNames = nutrietnSelectMapper.getETCName();
		model.addAttribute("etcNames",etcNames);
		
		List<String> ingredientNames = nutrietnSelectMapper.getIngredientName();
		model.addAttribute("ingredientNames",ingredientNames);
		
		// 5대 영양소 상세정보들
		String n_FUNC = nutrietnSelectMapper.getN_FUNCbyVitaminName(name);
		model.addAttribute("n_FUNC",n_FUNC);
		
//		String n_DESC = nutrietnSelectMapper.getN_DESCbyVitaminName(name);
//		model.addAttribute("n_DESC",n_DESC);
		
		String desc = nutrientSelectServiceImpl.editN_DESCbyVitaminName(name);
		desc = desc.replace("·", "<span style=\"font-size: 20px;\">✔</span>");
		model.addAttribute("desc",desc);
		
		String n_DRI_M = nutrietnSelectMapper.getN_DRI_MbyVitaminName(name);
		model.addAttribute("n_DRI_M",n_DRI_M);
		
		String n_DRI_F = nutrietnSelectMapper.getN_DRI_FbyVitaminName(name);
		model.addAttribute("n_DRI_F",n_DRI_F);
		
		String n_UL_M = nutrietnSelectMapper.getN_UL_MbyVitaminName(name);
		model.addAttribute("n_UL_M",n_UL_M);
		
		String n_UL_F = nutrietnSelectMapper.getN_UL_FbyVitaminName(name);
		model.addAttribute("n_UL_F",n_UL_F);
		
		String n_LACK = nutrietnSelectMapper.getN_LACKbyVitaminName(name);
		model.addAttribute("n_LACK",n_LACK);
		
//		String n_CAUTION = nutrietnSelectMapper.getN_CAUTIONbyVitaminName(name);
//		model.addAttribute("n_CAUTION",n_CAUTION);
		
		String caution = nutrientSelectServiceImpl.editN_CAUTIONbyVitaminName(name);
		model.addAttribute("caution",caution);
		
		String n_FOOD = nutrietnSelectMapper.getN_FOODNbyVitaminName(name);
		model.addAttribute("n_FOOD",n_FOOD);
		
		// 원료 상세정보들
		String i_FUNC = nutrietnSelectMapper.getI_FUNCbyIngredientName(name);
		model.addAttribute("i_FUNC",i_FUNC);
		
//		String i_DESC = nutrietnSelectMapper.getI_DESCbyIngredientName(name);
//		model.addAttribute("i_DESC",i_DESC);
		
		String i_desc = nutrientSelectServiceImpl.editI_DESCbyIngredientName(name);
		i_desc = i_desc.replace("·", "<span style=\"font-size: 20px;\">✔</span>");
		model.addAttribute("i_desc",i_desc);
		
		String i_DRI = nutrietnSelectMapper.getI_DRIbyIngredientName(name);
		model.addAttribute("i_DRI",i_DRI);
		
		String i_UL = nutrietnSelectMapper.getI_ULbyIngredientName(name);
		model.addAttribute("i_UL",i_UL);
		
//		String i_CAUTION = nutrietnSelectMapper.getI_CAUTIONbyIngredientName(name);
//		model.addAttribute("i_CAUTION",i_CAUTION);
		
		String i_caution = nutrientSelectServiceImpl.editI_CAUTIONbyIngredientName(name);
		model.addAttribute("i_caution",i_caution);
		
		// 5대 영양소 포함 추천 영양제 Top5
		List<Map<String, Object>> n_productInfoList = nutrietnSelectMapper.getProductNameNImgUrlFromFoodtableByN(name);
		model.addAttribute("n_productInfoList", n_productInfoList);

		// 기능성 원료 포함 추천 영양제 Top5
		List<Map<String, Object>> i_productInfoList = nutrietnSelectMapper.getProductNameNImgUrlFromFoodtableByI(name);
		model.addAttribute("i_productInfoList", i_productInfoList);

		
		// 조회수
		// 5대 영양소
		if (vitaminNames.contains(name) || etcNames.contains(name)) {
			int n_view = nutrietnSelectMapper.getN_VIEW(name);
			//System.out.println(n_view);
			nutrietnSelectMapper.increaseN_VIEW(name);
			model.addAttribute("n_view",n_view+1);
		}
		// 기능성 원료
		else {
			int i_view = nutrietnSelectMapper.getI_VIEW(name);
			//System.out.println(i_view);
			nutrietnSelectMapper.increaseI_VIEW(name);
			model.addAttribute("i_view",i_view+1);
		}
		
		// 조회수에 따른 Top10 가져오기
		List<String> top10 = nutrietnSelectMapper.getTop10();
		model.addAttribute("top10",top10);
		
		// 인기 영양소 Top5 검색수
        List<String> top5 = nutrietnSelectMapper.getTop5();
		model.addAttribute("top5",top5);
		
		// 비타민 Top5 검색수
		List<String> top5v = nutrietnSelectMapper.getTop5v();
		model.addAttribute("top5v",top5v);
		
		// 미네랄 Top5 검색수
		List<String> top5m = nutrietnSelectMapper.getTop5m();
		model.addAttribute("top5m",top5m);
		
		// 기능성 원료 Top5 검색수
		List<String> top5i = nutrietnSelectMapper.getTop5i();
		model.addAttribute("top5i",top5i);
		
		model.addAttribute("title_name",name);
		return "nutrient/NutrientDetail";
		
	}
		
	// 검색어 기록
	@PostMapping("/search.do")
    public void search(@RequestBody String keyword) {
		
		// 검색어 앞뒤에 추가된 "와 " 제거
	    String trimmedKeyword = keyword;
        trimmedKeyword = trimmedKeyword.substring(1, trimmedKeyword.length() - 1);
	    
        // 검색어를 DB에 저장
		nutrietnSelectMapper.saveSearchHistory(trimmedKeyword);	
	}
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
