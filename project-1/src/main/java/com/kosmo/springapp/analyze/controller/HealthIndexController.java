package com.kosmo.springapp.analyze.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HealthIndexController {

	@GetMapping("healthselect.do")
	public String HealthIndex(Model model,Map map,@RequestParam int hno,@RequestParam String formalation) {
		map.put("hno", hno);
		map.put("formalation", formalation);
		model.addAttribute("info", map);
		return "/analyze/drugsearch";
	}
}
