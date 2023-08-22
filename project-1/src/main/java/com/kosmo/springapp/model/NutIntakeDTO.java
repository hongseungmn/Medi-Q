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
@Alias("nutIntakeDTO")
public class NutIntakeDTO {
	private float nutNumber;
	private float DRI;
	private float UL;
	private String nut;
	private String DRIUnit;
	private String ULUnit;
}
