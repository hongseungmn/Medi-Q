package com.kosmo.springapp.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/test1.do")
	public String test1() {
		return "test1";
	}
}
