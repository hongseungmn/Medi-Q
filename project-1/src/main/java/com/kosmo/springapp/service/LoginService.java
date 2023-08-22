package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.MemberDTO;

@Service
public interface LoginService<T> {

	boolean isLogin(Map map);
	List<T> selectMember();
	T selectOne(String id);
	int update(T info);
	int delete(HttpServletRequest req);
	int insert(T info);
}
