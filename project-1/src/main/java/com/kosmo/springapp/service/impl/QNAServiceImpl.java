package com.kosmo.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.BoardDTO;
import com.kosmo.springapp.model.BoardMemberDTO;
import com.kosmo.springapp.service.QNAMapper;
import com.kosmo.springapp.service.QNAService;

@Service
public class QNAServiceImpl implements QNAService{
	@Autowired
	QNAMapper mapper;

	@Override
	public List<BoardDTO> BoardList() {
		return mapper.BoardList();
	}

	@Override
	public List<BoardMemberDTO> BoardListMember() {
		return mapper.BoardListMember();
	}
	
	

}
