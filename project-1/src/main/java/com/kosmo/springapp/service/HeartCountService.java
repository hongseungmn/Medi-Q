package com.kosmo.springapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface HeartCountService {

	String HeartCount(String id,String name);
	void insertHeart(String id,String name);
	void deleteHeart(String id,String name);
	List<String> selectFood(String id);
}
