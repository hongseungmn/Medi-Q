package com.kosmo.springapp.qnabbs.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.qnabbs.service.impl.board.AnswerServiceImpl;

@RestController
public class AnswerBoardRestController {

	@Autowired
	private AnswerServiceImpl answerservice;
	
	@DeleteMapping("/board/AnswerDelete.do")
	public Map answerdelete(@RequestBody Map bodymap) {
		
		System.out.println("AnswerBoardController입니다");
		System.out.println("answer_no값 출력:"+bodymap); //{answer_no=337}
		Map map=new HashMap<>();
		
		System.out.println("답변글 상세보기합니다");
		//답변글 검색
		map=answerservice.answerselectOne(bodymap); //삭제될 정보 map에 저장
		System.out.println("answer_no값 출력:"+bodymap); //answer_no값 {answer_no=337}
		answerservice.answerdelete(bodymap); //(answer_no로)답변글 삭제
		return map;
	}
}
