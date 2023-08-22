package com.kosmo.springapp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.TakeFoodAlarmDTO;

@Mapper
public interface TakeFoodAlarmMapper {

	Map selectTakeFoodAlarm(Map map); //로그인 아이디와 1개의 복용 영양제에 대한 알람정보
	List<Map> selectAllAlarm(String id); //로그인 아이디의 알람정보
	int insertTakeFoodAlarm(Map map); //알람 등록
	int updateTakeFoodAlarm(Map map); //알람 수정
	int deleteTakeFoodAlarm(Map map); //로그인 아이디와 1개의 복용 영양제에 대한 알람 삭제
}
