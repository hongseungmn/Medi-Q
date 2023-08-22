package com.kosmo.springapp.model;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

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
@Alias("profImgDto")
@Component
public class ProfileImageDTO {

	@NotNull
	private String pi_No; //프로필이미지 일련번호
	
	private String id; //프로필이미지 등록 아이디
	
	@NotNull
	private String pi_Path; //프로필이미지 저장경로
	
	@NotNull
	private String pi_Filename; //프로필이미지 파일명
	
	@NotNull
	private String pi_Ext; //프로필이미지 파일 확장자
	
	private MultipartFile file;
}
