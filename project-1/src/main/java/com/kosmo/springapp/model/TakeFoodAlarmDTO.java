package com.kosmo.springapp.model;

import org.springframework.stereotype.Component;

import com.google.auto.value.AutoValue.Builder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Component
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TakeFoodAlarmDTO {

	private String type;
	private String id;
	private String foodname;
	private String weekly;
	private String alarm_time;
	private String take_pill;
}
