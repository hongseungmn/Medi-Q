package com.kosmo.springapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosmo.springapp.model.BoardDTO;
import com.kosmo.springapp.model.BoardMemberDTO;

@Service
public interface QNAService {

	List<BoardDTO> BoardList();
	List<BoardMemberDTO> BoardListMember();
}
