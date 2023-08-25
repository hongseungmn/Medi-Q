package com.kosmo.springapp.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.HealthInfoDTO;
import com.kosmo.springapp.service.HealthInfoMapper;

@Service
public class HealthInfoServiceImpl {
	
	@Autowired
	HealthInfoMapper healthInfoMapper;
	
	public int saveHealthInfo(HealthInfoDTO healthInfoDto) {
		return healthInfoMapper.saveHealthInfo(healthInfoDto);
	}
	
	public int updateHealthInfo(HealthInfoDTO healthInfoDto) {
		return healthInfoMapper.updateHealthInfo(healthInfoDto);
	};
	

	public HealthInfoDTO selectHealthInfoByUserId(String userId) {
		return healthInfoMapper.selectHealthInfoByUserId(userId);
	}

	public int selectHealthInfoCount(String id) {
		return healthInfoMapper.selectHealthInfoCount(id);
	}

	public void savePredictResultInfo(Map<String, String> data) {
		healthInfoMapper.savePredictResultInfo(data);
	}

}
