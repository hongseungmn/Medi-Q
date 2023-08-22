package com.kosmo.springapp.qnabbs.service.impl.board;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeBoardMapper {
	
	void insertLike(String id, int no); //좋아요 추가

    void deleteLike(String id, int no); //좋아요 삭제
    
    int getLike(String id, int no); //좋아요 여부 조회

    int getTotalLikes(int no); //게시물의 총 좋아요 개수 조회
    
    boolean toggleLike(String id, int no); //좋아요 토글 여부
}
