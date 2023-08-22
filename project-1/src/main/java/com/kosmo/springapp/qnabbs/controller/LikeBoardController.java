package com.kosmo.springapp.qnabbs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.qnabbs.service.LikeBoardService;
import com.kosmo.springapp.service.JWTokensService;


@RestController
@RequestMapping("/like")
public class LikeBoardController {

	//토큰용 아래 3개 주입
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	
	@Autowired
	private LikeBoardService likeBoardservice;
	
	@PostMapping("/Toggle.do")
	public int toggleLike(@RequestParam int no,HttpServletRequest req,Model model) {
		
		//여기는 회원인 경우
		//id값 불러옴
		String token= jwTokensService.getToken(req, tokenName);//token을 가져옴
		Map payload = jwTokensService.getTokenPayloads(token, secretKey);//payload로 만듬
		if(payload.get("sub") != null) {//payload는 map형태의 많은 데이터(이건 TRUE)하지만 .get("sub")를 통해 아이디가 있는지 판별(있으면 null이 아님)
			String id=payload.get("sub").toString();//가져온 id를 String id에 저장(현재 로그인한 아이디)
			
			//회원 id,게시물 no로 토글형식으로 반환값:true,false
			//System.out.println("answer_no:"+no);
			boolean toggle=likeBoardservice.toggleLike(id, no);
			//System.out.println("toggle:"+toggle);
			int toggleInt = toggle ? 1 : 0; //true,false를  int 1,0으로 변환
			//System.out.println("toggleInt: " + toggleInt);
			int togggle=likeBoardservice.getTotalLikes(no); //게시물의 총 좋아요 개수 조회
			//System.out.println("togggle 1 or 0중 하나 "+togggle);
			return togggle; //게시물의 총 좋아요 개수를 반환
		}else {//회원이 아닌 경우 클릭을 누를때
			int toggle=likeBoardservice.getTotalLikes(no); //게시물의 총 좋아요 개수 조회(아무 변화가 없음)
			toggle=-1;//비회원일때 -1로 저장
			return toggle; //게시물의 총 좋아요 개수를 반환
		}
    }
	
	// 게시물의 총 좋아요 개수 조회  //(답변글 존재x시 answer_no=(null) 400 error이지만 기능엔 문제 없음)
    @GetMapping("/Count.do")
    public int getTotalLikes(@RequestParam int no) {
        return likeBoardservice.getTotalLikes(no); //게시물의 총 좋아요 개수 조회
    }
}
