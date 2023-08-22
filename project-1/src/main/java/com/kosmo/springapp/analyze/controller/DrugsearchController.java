package com.kosmo.springapp.analyze.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;

@Controller
public class DrugsearchController {
	
	@Autowired
	MainPageServiceImpl mainPageService;
	
	@GetMapping("drugsearch.do")
	public String DrugSearch(Model model,Map map,@RequestParam String search,@RequestParam int hno,@RequestParam String formalation) {
		map.put("search",search);
		FunctionalFoodListDTO listOne = mainPageService.selectFoodOneByNo(map);
		model.addAttribute("listOne",listOne);
		return "/analyze/medicinbasket";
	}
}
