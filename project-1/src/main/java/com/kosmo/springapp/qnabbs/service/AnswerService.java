package com.kosmo.springapp.qnabbs.service;

import java.util.Map;

public interface AnswerService<T> {
	
	
	Map answerselectOne(Map map); //답변 상세보기
	
	int answerinsert(Map map); //답변 입력
	
	int answerupdate(Map map); //답변 수정
	
	int answerdelete(Map map); //답변만 삭제
	
	int boarddelete(Map map); //질문글 삭제시 답변글도 같이 삭제
}
