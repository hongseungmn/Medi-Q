package com.kosmo.springapp.model;

import java.util.Date;

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
public class AllFoodScoreDTO {
	String ID;
	String SCORE;
	Date SCOREDATE;
}
