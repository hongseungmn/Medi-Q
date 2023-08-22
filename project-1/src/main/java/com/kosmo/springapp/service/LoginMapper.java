package com.kosmo.springapp.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.ProfileImageDTO;

@Mapper
public interface LoginMapper {
	
	///////////////////MEMBER 테이블

	MemberDTO findMember(String id); //아이디로 회원정보 가져오기

	boolean findByIdAndPwd(Map map);//회원여부 체크

	boolean checkById(Map map);//아이디 중복 체크용

	int save(MemberDTO member);//회원가입 insert

	MemberDTO searchIdNPwd(Map map); //아이디 찾기, 비밀번호 찾기로 얻은 회원 정보 

	boolean checkByPassword(Map map); //로그인한 회원이 입력한 비밀번호가 일치하는지 확인

	int update(MemberDTO info); //회원정보 수정
	
	int updateProfImg(MemberDTO dto); //프로필 이미지 유무 업데이트
	
	int delete(String id); //회원 탈퇴(active=N 으로 수정)
	
	
	///////////////////SOCIAL
	
	int saveSocial(Map userInfo);//카카오,네이버 로그인 시 회원정보 저장

	int checkBySocial(Map userInfo);//카카오, 네이버 로그인 정보 확인
	
	
	
	///////////////////PROFILE_IMAGE 테이블

	int saveProfImg(ProfileImageDTO info); //프로필 이미지 선택 시(기본 이미지 X)

	ProfileImageDTO findProfImg(String id); //회원의 프로필 이미지 정보 가져오기

	int deleteProfImg(String id); //기본이미지 선택 시 회원의 프로필 이미지 삭제

}
