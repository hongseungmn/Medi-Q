package com.kosmo.springapp.model;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

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
@Alias("memberDto")
public class MemberDTO {
	public static final String REGEX_ID = "^[a-z][a-z0-9]{5,11}";
	public static final String REGEX_PASSWORD = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#\\$%\\^&\\*\\(\\)\\+\\|\\=\\-])[A-Za-z\\d~!@#\\$%\\^&\\*\\(\\)\\+\\|\\=\\-]{8,16}$";
	public static final String REGEX_EMAIL = "^[a-z][a-z0-9]{5,11}@[a-z]{3,8}\\.(com|net|co\\.kr)$";
	public static final String REGEX_NAME = "^[가-힣]{2,}$";
	
	@NotBlank(message = "아이디를 입력하세요")
	@Pattern(regexp = REGEX_ID, message = "아이디 6~12자의 영문(소문자),숫자만 입력하세요")
	private String id;
	
	@NotBlank(message = "이름을 입력하세요")
	@Pattern(regexp = REGEX_NAME, message = "한글 2자 이상 입력하세요")
	private String name;
	
	@NotBlank(message = "비밀번호를 입력하세요")
	@Pattern(regexp = REGEX_PASSWORD, message = "비밀번호 8~16자의 영문(대/소문자),숫자,특수문자를 입력하세요")
	private String password;
	
	@NotNull(message = "생일을 선택하세요")
	private String birth;
	
	@NotNull(message = "성별을 선택하세요")
	private String gender;
	
	@NotBlank(message = "이메일을 입력하세요")
	@Pattern(regexp = REGEX_EMAIL,message = "잘못된 이메일 형식입니다")
	private String email;
	
	private Date regDate;//회원가입일
	
	private String active;//활동여부(admin-A)
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date inactive_date;//탈퇴일
	
	private String prof_Img_Fl;//프로필 이미지 여부
	
	private String site; //소셜 로그인 사이트
	
	private String social_Fl;//소셜 로그인 여부

}
