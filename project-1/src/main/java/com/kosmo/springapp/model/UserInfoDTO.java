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
@Alias("userInfoDTO")
public class UserInfoDTO {
	String ID;
	float kcal;
	float prorate;
	float cbhrate;
	float fatrate;
	int actstage;
}
