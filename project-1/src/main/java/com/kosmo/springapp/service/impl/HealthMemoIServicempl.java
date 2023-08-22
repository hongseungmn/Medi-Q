package com.kosmo.springapp.service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.HealthMemoDTO;
import com.kosmo.springapp.service.HealthMemoMapper;
import com.kosmo.springapp.service.HealthMemoService;
import com.kosmo.springapp.service.JWTokensService;

@Service
public class HealthMemoIServicempl implements HealthMemoService<HealthMemoDTO>{
	
	@Autowired
	private HealthMemoMapper mapper;
	@Autowired
	private JWTokensService jwTokensService;

	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;

	@Override
	public List<HealthMemoDTO> selectAll(HttpServletRequest req) {
		String token = jwTokensService.getToken(req, tokenName);
		Map<String, Object> payloads = jwTokensService.getTokenPayloads(token, secretKey);
		String id = payloads.get("sub").toString();
		
		payloads.put("mm_Id", id);
		
		return mapper.findAllMemo(payloads);
	}
	
	@Override
	public HealthMemoDTO selectOne(Map map) {
		return mapper.findMemo(map);
	}

	@Override
	public int insert(Map map) {
		
		return mapper.save(map);
	}

	@Override
	public int update(Map map) {
		
		return mapper.update(map);
	}

	@Override
	public int delete(Map map) {
		
		return mapper.delete(map);
	}


}
