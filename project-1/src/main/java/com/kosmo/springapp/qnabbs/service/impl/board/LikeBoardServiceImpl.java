package com.kosmo.springapp.qnabbs.service.impl.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.qnabbs.service.LikeBoardService;

@Service("likeBoardservice")
public class LikeBoardServiceImpl implements LikeBoardService {

	@Autowired
	private LikeBoardMapper mapper;
	
	// 좋아요 추가 또는 취소
	@Override
	public boolean toggleLike(String id, int no) {
		
		int likeCount = mapper.getLike(id, no); //좋아요 여부 조회
        if (likeCount > 0) {
            mapper.deleteLike(id, no);
            return false; // 좋아요 취소
        } else {
            mapper.insertLike(id, no);
            return true; // 좋아요 추가
        }
	}
	// 좋아요 여부 조회
	@Override
	public int getLike(String id, int no) {
		return mapper.getLike(id, no);
	}
	// 게시물의 총 좋아요 개수 조회
	@Override
	public int getTotalLikes(int no) {
		return mapper.getTotalLikes(no);
	}
	
}
