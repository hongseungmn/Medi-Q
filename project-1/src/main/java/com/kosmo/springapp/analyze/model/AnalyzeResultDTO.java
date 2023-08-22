package com.kosmo.springapp.analyze.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.type.Alias;

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
@Alias("analyzeResultDto")
public class AnalyzeResultDTO {
	String  takePurpose;// 복용 목적
	List<String> foodList;// 사용자가 복용 목적을 위해 필요한 영양소들
	Map<String,List> foodForHelpPurpose;//(있을경우)건기식 이름,건기식에서 사용자의 복용 목적에 도움되는 기능성 영양소List
	List<String> ingredient_list_no_report;//사용자가 먹는 건기식들에서 나오지 않은 복용목적에 필요한 기능성 영양소 - 섭취가 필요한
}
