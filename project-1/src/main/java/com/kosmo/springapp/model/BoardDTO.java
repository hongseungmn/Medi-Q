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
public class BoardDTO {

	private String no;
	private String id;
	private String title;
	private String content;
	private Date postdate;
}
