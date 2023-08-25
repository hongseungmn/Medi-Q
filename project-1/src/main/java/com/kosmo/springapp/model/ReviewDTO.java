package com.kosmo.springapp.model;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
@Alias("reviewDto")
public class ReviewDTO {
	private String r_id;
	private String takeTime;
	private String starScore;
	private String effect;
	private String noEffect;
	private String content;
	private int r_productNo;
	private Date r_regidate;
	private String gender;
	private String birth;
}
