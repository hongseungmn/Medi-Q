package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.HealthMemoDTO;

@Mapper
public interface HealthMemoMapper {

	List<HealthMemoDTO> findAllMemo(Map map); //로그인 아이디에 저장된 모든 기록 가져오기
	HealthMemoDTO findMemo(Map map); //로그인된 아이디, 해당날짜에 저장된 기록 가져오기
	int save(Map map); //해당날짜의 기록 저장하기
	int update(Map map); //해당날짜의 기록 수정하기
	int delete(Map map); //해당날짜의 기록 삭제하기
}
