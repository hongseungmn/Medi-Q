package com.kosmo.springapp.qnabbs.service;

import javax.servlet.http.HttpServletRequest;

import java.util.Map;

public interface DaoService<T> {
	
	ListPagingData selectList(Map map, HttpServletRequest req, int nowPage,Map likemap); //게시물 목록 보기
	
	Map selectOne(Map map); //게시물 상세보기
	
	int insert(Map map); //게시물 작성
	
	int update(Map map); //게시물 수정
	
	int delete(Map map); //게시물 삭제
}
