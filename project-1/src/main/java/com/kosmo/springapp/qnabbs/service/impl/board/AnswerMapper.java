package com.kosmo.springapp.qnabbs.service.impl.board;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnswerMapper {
	
	Map answerselectOne(Map paramMap); //상세보기(board/View.jsp)
	
	int answerinsert(Map paramMap); //답변 입력
	
	int answerupdate(Map paramMap); //답변 수정
	
	int answerdelete(Map paramMap); //답변만 삭제
	
	int boarddelete(Map paramMap); //질문글 삭제시 답변도 같이 삭제
}
