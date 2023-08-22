package com.kosmo.springapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.MyHealthDTO;

@Service
public class MyHealthServiceImpl implements MyHealthService{
	
	@Autowired
	private JWTokensService jwTokensService;
	@Autowired
	private MyHealthMapper mapper;
	
	@Value("${token-name}")
	private String tokenName;
	@Value("${secret-key}")
	private String secretKey;

	@Override
	public MyHealthDTO select(String id) {
		
		return mapper.select(id); 
	}

	@Override
	public int insert(String[] healthRegi, HttpServletRequest req) {
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		mapper.delete(id); //기존 기록 삭제
		
		Map map = new HashMap<>();
		map.put("id", id);
		
		map.put("worry", healthRegi[0]);
		map.put("disease", healthRegi[1]);
		map.put("allergy", healthRegi[2]);
		map.put("foodname", healthRegi[3]);
		map.put("special", healthRegi[4]);
		
		return mapper.insert(map);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List selectFood(String id) {
		
		return mapper.selectFood(id);
	}

	@Override
	public int selectMyHealth(String id) {
		
		return mapper.selectMyHealth(id);
	}

}
