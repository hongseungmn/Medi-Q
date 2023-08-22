package com.kosmo.springapp.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.MyHealthDTO;

@Service
public interface MyHealthService {

	MyHealthDTO select(String id);
	int insert(String[] healthRefi, HttpServletRequest req);
	int delete(String id);
	int selectMyHealth(String id);
}
