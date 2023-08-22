package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {

	List<Map> likeList(Map map); //추천수TOP3 목록
	
	List<Map> selectList(Map map); //게시물 목록
	
	Map selectOne(Map map); //게시물 상세보기
	
	int insert(Map map); //게시물 작성
	
	int update(Map map); //게시물 수정
	
	int delete(Map map); //게시물 삭제
	
	int count(Map map); //게시물 총 개수(페이징처리를 위한)
}
