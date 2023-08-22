package com.kosmo.springapp.model;

import org.apache.ibatis.type.Alias;

import com.google.api.client.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(exclude = "no")
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("AvgStarScoreCountDto")
public class AvgStarScoreCountDTO {
	private int no;
	private long postNo;
	private String productName;
	private String company;
	private String expiration;
	private String intake;
	private String shape;
	private String nutrient;
	private String caution;
	private String standard;
	private String material;
	private String imgURL;
	private String R_Productno;
	private String AVG_Score;
	private String REVIEW_Count;
}
