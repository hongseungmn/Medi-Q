package com.kosmo.springapp.qnabbs.service.impl.board;

import java.sql.Date;

public class AnswerBoard {
	
	private int ANSWER_NO; //답변글 고유번호
    
	private int BOARD_NO; //게시물 NO FK
    
	private String CONTENT; //답변글 내용
    
	private Date POSTDATE; //답변글 등록일
    
	private String id; // 답변글 작성자 id
}
