package com.kosmo.springapp.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.HealthInfoDTO;

@Mapper
public interface HealthInfoMapper {

	int saveHealthInfo(HealthInfoDTO healthInfoDto);
	int updateHealthInfo(HealthInfoDTO healthInfoDto);

	HealthInfoDTO selectHealthInfoByUserId(String userId);

	int selectHealthInfoCount(String userId);
	
	int savePredictResultInfo(Map<String, String> data);
}
