package com.kosmo.springapp.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.auth.openidconnect.IdToken.Payload;
import com.kosmo.springapp.admin.service.AdminMapper;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.LoginMapper;
import com.kosmo.springapp.service.NotificationService;
import com.kosmo.springapp.service.impl.EmailServiceImpl;
import com.kosmo.springapp.service.impl.KakaoLoginServiceImpl;
import com.kosmo.springapp.service.impl.LoginServiceImpl;
import com.kosmo.springapp.service.impl.NaverLoginServiceImpl;

@Controller
@RequestMapping("/project")
public class LoginController {

	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private JWTokensService jwTokensService;
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private NotificationService notificationService;
	
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	@Value("${save-name}")
	private String saveName;

	// 로그인 클릭 시 이동
	@GetMapping("/Login.do")
	public String login(HttpServletRequest req, HttpServletResponse resp) {
		// 아이디 저장 체크 정보 가져오기
		String username = "";
		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (saveName.equals(cookie.getName())) {
					username = cookie.getValue();
				}
			}
		}
		req.setAttribute("username", username);

		// 시작페이지에서 토큰이 저장되어있는 경우
		String token = jwTokensService.getToken(req, tokenName);
		boolean isAuthentication = jwTokensService.verifyToken(token, tokenName, secretKey, req, resp);

		if (isAuthentication)
			return "forward:/project/MyPage.do"; // 마이페이지로 이동
		// return "login/MyPage";
		else
			return "login/Login"; // 로그인페이지로 이동
	}

	// 로그인 아이디 입력시
	@PostMapping("/Login.do")
	public String login(@RequestParam Map map, Model model, HttpServletRequest req, HttpServletResponse resp) {

		boolean flag = loginService.isMember(map);// 쿼리문으로 회원여부 판단
		String id = map.get("id").toString();
		MemberDTO member = loginService.selectOne(id);
		String active = member==null ? "" : member.getActive();

		if (flag && !"N".equals(active)) {// 회원 or 관리자 일 때
			String name = member.getName();
			String activeFl = member.getActive();

			// 토큰 생성한 뒤 쿠키에 저장
			Map<String, Object> payloads = new HashMap<>();// 사용자 임의 데이타
			payloads.put("name", name);
			payloads.put("activeFl", activeFl);

			long expirationTime = 1000 * 60 * 60 *24; // 토큰의 만료시간 설정

			String token = jwTokensService.createToken(id, secretKey, payloads, expirationTime);

			// 쿠키에 굽자
			Cookie cookie = new Cookie(tokenName, token);
			cookie.setPath("/");
			resp.addCookie(cookie);

			// 아이디 저장 체크 여부 판단
			if (map.get("saveId") != null) {// value=Y
				Cookie save = new Cookie(saveName, id.trim());
				save.setPath("/");
				save.setMaxAge(-1);
				resp.addCookie(save);
			} else {// 체크하지 않은 경우
				Cookie save = new Cookie(saveName, "");
				save.setPath("/");
				save.setMaxAge(-1);
				resp.addCookie(save);
			}

			// 로그인시 기록 저장(허재준)
			adminMapper.insertLoginMember(id);
			
			// 쿠키를 response에 담았으니 redirect로 보내야함(메인 페이지로)
			return "redirect:/";
		} 
		else if(flag && "N".equals(active)) {
			model.addAttribute("NOT_LOGIN", "현재 탈퇴신청한 아이디입니다");//////////////////////////////
			return "login/Login";
		}
		else {
			model.addAttribute("NOT_LOGIN", "아이디와 비밀번호가 일치하지 않습니다");
			return "login/Login";
		}
	}

	//로그아웃 클릭 시
	@GetMapping("/Logout.do")
	public String logout(HttpServletRequest req, HttpServletResponse resp) {
		// 로그아웃 처리- 세션영역에 저장된 속성 삭제
		jwTokensService.removeToken(req, resp, tokenName);
		
		//로그아웃 시 fcm토큰 삭제
		ResponseEntity re = notificationService.deleteToken();
		System.out.println("fcm 토큰삭제: "+re);
		
		// 로그아웃 처리 후 로그인 페이지로 이동;
		return "redirect:/";
	}

	// 회원가입 클릭 시
	@GetMapping("/Join.do")
	public String join() {
		return "login/JoinTheMembership";
	}
	
	// 회원가입 약관 동의 시
	@GetMapping("/Join2.do")
	public String join2() {
		return "login/JoinTheMembership2";
	}

	// 아이디 중복 체크
	@PostMapping("/IdCheck.do")
	@ResponseBody
	public Map idCheck(@RequestParam Map map) {
		boolean isDuplicate = loginService.idCheck(map);
		map.put("isDuplicate", isDuplicate);
		return map;
	}
	
	@Autowired
	private EmailServiceImpl emailServiceImpl;
	
	// 이메일 인증
	@PostMapping("mailConfirm.do")
	@ResponseBody
	public Map mailConfirm(@RequestParam("email") String email) throws Exception {
		String code = emailServiceImpl.sendRandomNumberMessage(email);
		//System.out.println("인증코드 : " + code);
		Map map = new HashMap<>();
		map.put("code",code);
		return map;
	}

	// 회원가입 완료 후
	@PostMapping("/Join.do")
	@ResponseBody
	public String joinAfter(@Valid MemberDTO member, Errors errors, HttpServletRequest req) {
		if (errors.hasErrors()) {
			return "<script>history.back();</script>";
		}
		int affected = loginService.insert(member);
		if (affected == 1) {
			return "<script>location.href=\'/project/Join3.do\';</script>";
		} else {
			return "<script>alert('회원가입에 실패하였습니다');history.back()</script>";
		}
	}
	
	// 회원가입 정보 입력 시
	@GetMapping("/Join3.do")
	public String join3() {
		return "login/JoinTheMembership3";
	}

	//아이디,비밀번호 찾기 클릭 시
	@GetMapping("/SearchIdNPwd.do")
	@ResponseBody
	public Map searchIdNPwd(@RequestParam Map<String, String> map) throws AddressException, MessagingException, UnsupportedEncodingException {
		
		map.put("message",loginService.selectOneIdNPwd(map));
		return map;
	}
	
	@Autowired
	private LoginMapper mapper;

	@Autowired
	private KakaoLoginServiceImpl kakaoLoginServiceImpl;

	// 카카오 로그인
	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
	public String kakaoLogin(String code, HttpServletRequest req, HttpServletResponse resp) {
		//카카오에서 정보 얻어오기
		String accessToken = kakaoLoginServiceImpl.getAccessToken(code);
		try {
			Map<String, Object> userInfo = kakaoLoginServiceImpl.getUserInfo(accessToken);// 이메일,성별,사이트명
	
			// 기존에 소셜로그인으로 로그인한 기록이 있는지 확인
			int visit = mapper.checkBySocial(userInfo);
	
			if (visit == 0) {// 첫방문O
				mapper.saveSocial(userInfo);
				return "redirect:/project/JoinAdd.do?add1="+userInfo.get("email").toString()+"&add2="+accessToken; //추가 정보 입력
			}
					
			// 첫방문x
			String token = loginService.socialLogin(userInfo,accessToken);
			
			// 쿠키에 굽자
			Cookie cookie = new Cookie(tokenName, token);
			cookie.setPath("/");
			resp.addCookie(cookie);
			
			// 로그인시 기록 저장(허재준)
			adminMapper.insertLoginMember(userInfo.get("email").toString());
		}
		catch (Exception e) {
			req.setAttribute("WHERE", "SOCIAL");
			req.setAttribute("SUCCFAIL", -1);
			return "login/Message";
		}
		
		// 쿠키를 response에 담았으니 redirect로 보내야함(메인 페이지로)
		return "redirect:/";
	}
	
	@Autowired
	private NaverLoginServiceImpl naverLoginServiceImpl;
	
	//네이버 로그인
	@RequestMapping(value = "naverLogin.do",method = RequestMethod.GET)
	public String naverLogin(String code, HttpServletRequest req, HttpServletResponse resp) {

		String accessToken = naverLoginServiceImpl.getAccessToken(code);
		try {
			Map<String, Object> userInfo = naverLoginServiceImpl.getUserInfo(accessToken);// 이메일,성별,이름,생년월일,사이트명
		
			// 기존에 소셜로그인으로 로그인한 기록이 있는지 확인
			int visit = mapper.checkBySocial(userInfo);
	
			if (visit == 0) {// 첫방문O
				mapper.saveSocial(userInfo);
				return "redirect:/project/JoinAdd.do?add1="+userInfo.get("email").toString()+"&add2="+accessToken; //추가 정보 입력
			}
							
			// 첫방문x
			String token = loginService.socialLogin(userInfo,accessToken);
			
			// 쿠키에 굽자
			Cookie cookie = new Cookie(tokenName, token);
			cookie.setPath("/");
			resp.addCookie(cookie);
			
			// 로그인시 기록 저장(허재준)
			adminMapper.insertLoginMember(userInfo.get("email").toString());
		}
		catch (Exception e) {
			req.setAttribute("WHERE", "SOCIAL");
			req.setAttribute("SUCCFAIL", -1);
			return "login/Message";
		}

		// 쿠키를 response에 담았으니 redirect로 보내야함(메인 페이지로)
		return "redirect:/";
	}
}
