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
@Alias("ingredientDTO")
public class IngredientDTO {

	private String I_NAME;
	private String I_DRI;
	private String I_UL;
	private String I_FUNC;
	private String I_DESC;
	private String I_CAUTION;
}