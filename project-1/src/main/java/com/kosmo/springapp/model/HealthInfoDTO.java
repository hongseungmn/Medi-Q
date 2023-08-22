package com.kosmo.springapp.model;

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
@Alias("healthInfoDto")
public class HealthInfoDTO {
	private String userId;
	private String height;
	private String weight;
	private String waistline;
	private String bmi;
	private String vision;
	private String listen;
	private String bloodPressure_high;
	private String bloodPressure_low;
	private String proteinuria;
	private String hemoglobin;
	private String bloodSugar;
	private String total_cholesterol;
	private String HDL_cholesterol;
	private String triglyceride;
	private String LDL_cholesterol;
	private String serum_creatinine;
	private String ast;
	private String alt;
	private String gpt;
}
