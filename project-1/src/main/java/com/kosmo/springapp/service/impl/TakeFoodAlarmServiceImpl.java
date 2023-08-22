package com.kosmo.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.TakeFoodAlarmDTO;
import com.kosmo.springapp.service.TakeFoodAlarmMapper;

@Service
public class TakeFoodAlarmServiceImpl {
	
	@Autowired
	private TakeFoodAlarmMapper mapper;
	
	public List<Map> selectById(String id) {
		return mapper.selectAllAlarm(id);
	}

	public int insertAlarm(Map map) {
		Map alarm = mapper.selectTakeFoodAlarm(map);
		//System.out.println("impl의 alarm: "+alarm);
		if(alarm==null)
			return mapper.insertTakeFoodAlarm(map);
		else {
			return mapper.updateTakeFoodAlarm(map);
		}
	}

	public int deleteAlarm(Map map) {
		return mapper.deleteTakeFoodAlarm(map);
	}

	public Map selectTakeFoodAlarm(Map map) {
		return mapper.selectTakeFoodAlarm(map);
	}
}
