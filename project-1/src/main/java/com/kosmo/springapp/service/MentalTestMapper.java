package com.kosmo.springapp.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MentalTestMapper {
	Map selectResult(String id);
	int selectFlag(String id);
	int insertResult(Map map);
	int updateResult(Map map);
}
