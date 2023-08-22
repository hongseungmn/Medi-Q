package com.kosmo.springapp.analyze.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.type.Alias;

import com.kosmo.springapp.model.NutIntakeDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("analyzeResultListDto")
public class AnalyzeResultListDTO {
	int resultScore;
	List<AnalyzeResultDTO> listdto; //복용 목적별 정보
	List<String> nutrient_list_report; //복용중 비타민
	List<String> nutrient_list_no_report; // 아직 복용하지 않고 있는 비타민
	int ingredientCount;
	//List<String> nutnumlist;
	List<NutIntakeDTO> nutIntakeDTOs;
}
