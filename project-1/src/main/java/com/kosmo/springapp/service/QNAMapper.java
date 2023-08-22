package com.kosmo.springapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kosmo.springapp.model.BoardDTO;
import com.kosmo.springapp.model.BoardMemberDTO;

@Mapper
public interface QNAMapper {

	List<BoardDTO> BoardList();
	List<BoardMemberDTO> BoardListMember();
}
