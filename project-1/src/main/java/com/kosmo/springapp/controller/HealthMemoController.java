package com.kosmo.springapp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.springapp.model.HealthMemoDTO;
import com.kosmo.springapp.service.impl.HealthMemoIServicempl;

@Controller
@RequestMapping("/project")
public class HealthMemoController {
	
	@Autowired 
	private HealthMemoIServicempl healthMemoIServicempl;

	//건강기록 ajax로 받기
	@PostMapping("/Memo.do")
	@ResponseBody
	public Map calendarPost(@RequestParam Map map) {
		
		if("edit".equals(map.get("type"))) {//날짜에 저장된 정보가 있을 경우
			healthMemoIServicempl.update(map);
		}
		else if("submit".equals(map.get("type"))) {//날짜에 저장된 정보가 없을 경우
			healthMemoIServicempl.insert(map);
		}
		else {
			healthMemoIServicempl.delete(map);
		}
		return map;
	}
		
}
