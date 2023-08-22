package com.kosmo.springapp.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.service.MentalTestMapper;

@Service
public class MentalTestServiceImpl {
	
	@Autowired
	private MentalTestMapper mapper;
	
	public Map selectResult(String id) {
		
		return mapper.selectResult(id);
	}
	
	public int insertResult(Map map) {
		String id = map.get("id").toString();
		String name = map.get("name").toString();
		int flag = mapper.selectFlag(id);
		
		map.put("id", id);
		System.out.println("sum: "+map.get("sum"));
		map.put("test1", "");
		map.put("test2", "");
		map.put("test3", "");
		map.put("test4", "");
		map.put(name, map.get("sum"));
		
		if(flag == 0) {
			return mapper.insertResult(map);
		}
		else {
			System.out.println("update/////////////");
			return mapper.updateResult(map);
		}
	}
	
	public int updateResult(Map map) {
		
		return mapper.updateResult(map);
	}
}
