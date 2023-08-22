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
@Alias("nutrientDTO")
public class NutrientDTO {

	private String N_NAME;
	private String N_DRI_M;
	private String N_UL_M;
	private String N_DRI_F;
	private String N_UL_F;
	private String N_FUNC;
	private String N_DESC;
	private String N_CAUTION;
	private String N_LACK;
	private String N_FOOD;
	private String N_SUBNAME;
}