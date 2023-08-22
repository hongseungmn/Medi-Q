package com.kosmo.springapp.qnabbs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.qnabbs.service.DaoService;
import com.kosmo.springapp.qnabbs.service.ListPagingData;
import com.kosmo.springapp.qnabbs.service.PagingUtil;
import com.kosmo.springapp.qnabbs.service.impl.board.AnswerServiceImpl;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.impl.LoginServiceImpl;

@Controller
@RequestMapping("/board")
public class BoardController {
	//토큰용 아래 3개 주입
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	
	@Autowired
	private DaoService board;
	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private AnswerServiceImpl answerservice;
	
	@RequestMapping(value="/List.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String list(
			@RequestParam Map map,
			@RequestParam(required = false,defaultValue = "1",value = PagingUtil.NOWPAGE) int nowPage,
			HttpServletRequest req,
			@RequestParam Map likemap,
			Model model) {
		
		//회원인 경우
		//id값 불러옴
		String token= jwTokensService.getToken(req, tokenName);//token을 가져옴
		Map payload = jwTokensService.getTokenPayloads(token, secretKey);//payload로 만듬
		if(payload.get("sub") != null) {//payload는 map형태의 많은 데이터(이건 TRUE)하지만 .get("sub")를 통해 아이디가 있는지 판별(있으면 null이 아님)
			String id=payload.get("sub").toString();//가져온 id를 String id에 저장(현재 로그인한 아이디)
			model.addAttribute("id", id);
			//작성자가 관리자인지 아닌지 체크, id로 회원정보 가져와서 active 정보 가져옴
			String active=loginService.selectOne(id).getActive();
			//System.out.println("active:"+active);//"Y, A, N 중 하나"
			model.addAttribute("active", active);//model에 active로 저장
		}
		ListPagingData listPagingData= board.selectList(map, req, nowPage, likemap);
		//데이타 저장
		model.addAttribute("listPagingData", listPagingData);	
		return "board/List";
	}/////////////////////
	
	//글쓰기 폼으로 이동
	@GetMapping("/Write.do")
	public String write() {
		return "board/Write";
	}/////////////////
	
	//글작성후 list.do로 이동(목록으로 이동)
	@PostMapping("/Write.do")
	public String writeProcess(HttpServletRequest req,@RequestParam Map map,Model model) {
		
		//id란 이름으로 token의 id를 저장
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		map.put("id", id);
		
		//affect에 글작성이 성공하였다면 (int) 1,실패면 0으로 저장
		int affected = board.insert(map);
		//map에 1명의 글 저장 
		map = board.selectOne(map);
		//글 입력 실패시
		if(affected==0) {
			System.out.println("글작성 실패하셨습니다.");
			return "board/View";
		}
		//작성하고 상세페이지로 이동
		return "redirect:/board/View.do?no=" + map.get("NO");
	}////////////////////
	
	//상세보기
	@RequestMapping(value="/View.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String view(HttpServletRequest req,@RequestParam Map map,Model model) { 
		//System.out.println(map);//board의 no를 가지고 있음
		//회원인 경우
		String token= jwTokensService.getToken(req, tokenName);//token을 가져옴
		Map payload = jwTokensService.getTokenPayloads(token, secretKey);//payload로 만듬
		if(payload.get("sub") != null) {//payload는 map형태의 많은 데이터(이건 TRUE)하지만 .get("sub")를 통해 아이디가 있는지 판별(있으면 null이 아님)
			String id=payload.get("sub").toString();//가져온 id를 String id에 저장(현재 로그인한 아이디)
			model.addAttribute("id", id);//모델에 id란 이름으로 id 저장
			
			//작성자가 관리자인지 아닌지 체크, id로 회원정보 가져와서 active 정보 가져옴
			String active=loginService.selectOne(id).getActive();
			//System.out.println("active:"+active);//"Y, A, N 중 하나"
			model.addAttribute("active", active);//model에 active로 저장
		}
		//답변글 Map생성
		Map paramMap =new HashMap<>();
		
		//질문글 하나 불러와서 map에 저장
		//System.out.println(map);//{no=값,87}
		map=board.selectOne(map);
		//줄바꿈 질문글 엔터키 br태그 적용
		Object contentObj = map.get("CONTENT");
		//System.out.println("contentObj:"+contentObj);
        if (contentObj instanceof String) {
            String content = (String) contentObj;
            content = content.replaceAll("\r\n", "<br>");
            map.put("CONTENT", content);
        }
		//질문글 하나 record란 이름으로 저장
		model.addAttribute("record", map);
		if (map.get("NO") != null) {
			//System.out.println("map의 NO:"+map.get("NO"));//map의 NO:87
			//질문글의 no로 답변글을 불러와서 paramMap에 저장
			paramMap=answerservice.answerselectOne(map);
			//줄바꿈 답변글 엔터키 br태그 적용
			if(paramMap !=null) {
				Object paramcontentObj = paramMap.get("CONTENT");
				//System.out.println("paramcontentObj:"+paramcontentObj);
		        if (paramcontentObj instanceof String) {
		            String content = (String) paramcontentObj;
		            content = content.replaceAll("\r\n", "<br>");
		            paramMap.put("CONTENT", content);
		        }
			}
		}
        System.out.println("paramMap(답변이 없으면 null):"+paramMap);
		//paramMap이란 이름으로 map을 저장
		model.addAttribute("paramMap", paramMap);
		//paramMap을 출력
		return "board/View";
	}///////////////
	
	//수정page 이동
	@GetMapping("/Edit.do")
	public String edit(HttpServletRequest req,@RequestParam Map map,Model model) {
		map= board.selectOne(map);
		//System.out.println(map);
		model.addAttribute("record", map);
		//System.out.println("record값확인"+model);
		return "board/Edit";
	}/////////////
	
	//수정처리process
	@PostMapping("/EditProcess.do")
	public String editProcess(HttpServletRequest req,@RequestParam Map map,Model model) {
		int affected = board.update(map);
	    if (affected == 0) {
	        //model.addAttribute("inputError", "입력 오류입니다. 다시 입력해주세요");
	        model.addAttribute("record", map);
	        return "board/Edit";
	    } 
	 // 뷰정보 반환 - 목록을 처리하는 컨트롤러로 이동
	    return "forward:/board/View.do";
	}//////////////////
	
	@GetMapping("/Delete.do")
	public String delete(HttpServletRequest req,@RequestParam Map map,Model model) {
		
		//서비스 호출
		int deleteCount = board.delete(map);
	    System.out.println("여기 delete후 "+deleteCount);
		if (deleteCount == -1) {
	        //System.out.println("delete에 에러 발생");
	        return "forward:/board/View.do";
	    }
	    System.out.println("삭제된 답글 수: " + deleteCount);
	    // 뷰정보 반환 - 목록을 처리하는 컨트롤러로 이동
	    return "forward:/board/List.do"; 
	}
}
