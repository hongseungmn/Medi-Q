package com.kosmo.springapp.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;


@Service
public interface HealthMemoService<T> {

	List<T> selectAll(HttpServletRequest req);
	T selectOne(Map map);
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
}
