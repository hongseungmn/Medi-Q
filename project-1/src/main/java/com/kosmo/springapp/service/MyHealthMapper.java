package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.MyHealthDTO;

@Mapper
public interface MyHealthMapper {
	
	MyHealthDTO select(String id);
	List selectFood(String id);
	int insert(Map map);
	int delete(String id);
	int selectMyHealth(String id);
}
