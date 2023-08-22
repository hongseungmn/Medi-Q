package com.kosmo.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.service.HeartCountMapper;
import com.kosmo.springapp.service.HeartCountService;

@Service
public class HeartCountServiceImpl implements HeartCountService{
	
	@Autowired
	HeartCountMapper mapper;

	@Override
	public String HeartCount(String id, String name) {
		return mapper.HeartCount(id, name);
	}

	@Override
	public void insertHeart(String id, String name) {
		mapper.insertHeart(id, name);
	}

	@Override
	public void deleteHeart(String id, String name) {
		mapper.deleteHeart(id, name);
	}

	@Override
	public List<String> selectFood(String id) {
		
		return mapper.selectFood(id);
	}

}
