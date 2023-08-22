package com.kosmo.springapp.model;

import java.sql.Date;
import java.util.List;

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
@Alias("analyzeReportDto")
public class AnalyzeReportDTO {
	private int analyzeno;
	private String userId;
	private String takePurposes;
	private String takeFoods;
	private Date analyzeDate;
	private int score;
}
