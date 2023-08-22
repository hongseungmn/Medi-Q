package com.kosmo.springapp.analyze.model;

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
@Alias("healthIssueDTO")
public class HealthIssueDTO {

	private String H_NO;
	private String H_NAME;
	private String H_NUTRIENT;
	private String H_DESC;
}
