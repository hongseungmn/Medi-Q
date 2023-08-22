package com.kosmo.springapp.qnabbs.service;

public interface LikeBoardService {

    int getLike(String id, int no); //좋아요 여부 조회

    int getTotalLikes(int no); //게시물의 총 좋아요 개수 조회

	boolean toggleLike(String id, int no); //좋아요 판단여부를 토글
}
