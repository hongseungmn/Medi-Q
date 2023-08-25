package com.kosmo.springapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.kosmo.springapp.model.HealthMemoDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.MyHealthDTO;
import com.kosmo.springapp.model.ProfileImageDTO;
import com.kosmo.springapp.model.ReviewDTO;
import com.kosmo.springapp.model.TakeFoodAlarmDTO;
import com.kosmo.springapp.service.FCMInitializer;
import com.kosmo.springapp.service.HeartCountService;
import com.kosmo.springapp.service.JWTokensService;
import com.kosmo.springapp.service.MyHealthServiceImpl;
import com.kosmo.springapp.service.impl.AnalyzeMyReportServiceImpl;
import com.kosmo.springapp.service.impl.HealthInfoServiceImpl;
import com.kosmo.springapp.service.impl.HealthMemoIServicempl;
import com.kosmo.springapp.service.impl.HeartCountServiceImpl;
import com.kosmo.springapp.service.impl.LoginServiceImpl;
import com.kosmo.springapp.service.impl.MentalTestServiceImpl;
import com.kosmo.springapp.service.impl.ReviewServiceImpl;
import com.kosmo.springapp.service.impl.TakeFoodAlarmServiceImpl;

@RequestMapping("/project")
@Controller
public class MypageController {

	@Autowired
	private LoginServiceImpl loginService;
	@Autowired
	private HealthMemoIServicempl healthMemoIServicempl;
	@Autowired
	private JWTokensService jwTokensService;
	@Autowired
	private ReviewServiceImpl reviewServiceImpl;
	@Autowired
	private HeartCountServiceImpl heartCountServiceImpl;
	@Autowired
	private MyHealthServiceImpl myHealthServiceImpl;
	@Autowired
	private AnalyzeMyReportServiceImpl analyzeMyReportServiceImpl;
	@Autowired
	private HealthInfoServiceImpl healthInfoServiceImpl;
	@Autowired
	private MentalTestServiceImpl mentalTestServiceImpl;
	@Autowired
	private TakeFoodAlarmServiceImpl takeFoodAlarmServiceImpl;

	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;

	//마이페이지 클릭 시
	@GetMapping("/MyPage.do")
	public String mypage(HttpServletRequest req, Model model) throws IOException {
		LocalDate current = LocalDate.now(); //현재날짜 구하기
		Map map = new HashMap<>();
		//System.out.println("date: "+date);
		
		MemberDTO member = loginService.selectOne(req);	
		String id = member.getId();
		
		ProfileImageDTO profImg = loginService.selectProfImg(id);
		List<HealthMemoDTO> memos = healthMemoIServicempl.selectAll(req);
		for(HealthMemoDTO m : memos) {
			m.setMm_Date(m.getMm_Date().split(" ")[0]);
		}
		
		map.put("mm_Id", id);
		map.put("mm_Date", current);
		
		HealthMemoDTO memo = healthMemoIServicempl.selectOne(map);
		MyHealthDTO my = myHealthServiceImpl.select(id);
		List food = myHealthServiceImpl.selectFood(id);
		
		if(memo != null) {
			memo.setMm_Date(memo.getMm_Date().split(" ")[0]);
		}
		model.addAttribute("current", current);//오늘 날짜
		model.addAttribute("info", member);//회원 정보
		model.addAttribute("profImg", profImg);//프로필 이미지
		model.addAttribute("memos", memos);//모든 건강 다이어리
		model.addAttribute("memo", memo);//오늘 작성한 건강 다이어리
		model.addAttribute("my", my);//등록한 건강정보
		model.addAttribute("food", food);//등록한 영양제 정보
		
		return "login/MyPage";
	}
	
	@GetMapping("/MyPage2.do")
	public String mypage2(HttpServletRequest req, Model model) {
		MemberDTO member = loginService.selectOne(req);	
		String id = member.getId();
		
		ProfileImageDTO profImg = loginService.selectProfImg(id);
		List<Map> review = reviewServiceImpl.selectReviewByUserId(id);
		List<String> foodlike = heartCountServiceImpl.selectFood(id);
		MyHealthDTO my = myHealthServiceImpl.select(id);
		List food = myHealthServiceImpl.selectFood(id);
		
		model.addAttribute("info", member);//회원 정보
		model.addAttribute("profImg", profImg);//프로필 이미지
		model.addAttribute("review", review);//리뷰 작성 글
		model.addAttribute("foodlike", foodlike);//찜 영양제 명만 가져옴
		model.addAttribute("my", my);//등록한 건강정보
		model.addAttribute("food", food);//등록한 영양제 정보
		
		return "login/MyPage2";
	}
	
	@GetMapping("/MyPage3.do")
	public String mypage3(HttpServletRequest req, Model model) {
		MemberDTO member = loginService.selectOne(req);	
		String id = member.getId();
		
		ProfileImageDTO profImg = loginService.selectProfImg(id);
		MyHealthDTO my = myHealthServiceImpl.select(id);
		List food = myHealthServiceImpl.selectFood(id);
		List<Map> alarms = takeFoodAlarmServiceImpl.selectById(id);
		
		model.addAttribute("info", member);//회원 정보
		model.addAttribute("profImg", profImg);//프로필 이미지
		model.addAttribute("my", my);//등록한 건강정보
		model.addAttribute("food", food);//등록한 영양제 정보
		model.addAttribute("alarms", alarms);//등록한 영양제 알람 정보
		
		return "login/MyPage3";
	}
	
	@GetMapping("/ClickDate.do")
	public String clickDate(@RequestParam String clickDate, HttpServletRequest req, Model model) {
		LocalDate current = LocalDate.now(); //현재날짜 구하기
		MemberDTO member = loginService.selectOne(req);
		String id = member.getId();
		ProfileImageDTO profImg = loginService.selectProfImg(id);
		
		List<HealthMemoDTO> memos = healthMemoIServicempl.selectAll(req);
		for(HealthMemoDTO m : memos) {
			m.setMm_Date(m.getMm_Date().split(" ")[0]);
		}
		
		Map map = new HashMap<>();
		map.put("mm_Id", id);
		map.put("mm_Date", clickDate);
		
		HealthMemoDTO memo = healthMemoIServicempl.selectOne(map);
		MyHealthDTO my = myHealthServiceImpl.select(id);
		List food = myHealthServiceImpl.selectFood(id);
		
		if(memo != null) {
			memo.setMm_Date(memo.getMm_Date().split(" ")[0]);
		}
		model.addAttribute("current", current);//오늘 날짜
		model.addAttribute("clickDate", clickDate);
		model.addAttribute("info", member);//추후 더 추가해야함
		model.addAttribute("profImg", profImg);
		model.addAttribute("memos", memos);
		model.addAttribute("memo", memo);
		model.addAttribute("my", my);//등록한 건강정보
		model.addAttribute("food", food);//등록한 영양제 정보
		
		return "login/MyPage";
	}

	@PostMapping("/Password.do")
	@ResponseBody
	public String password(@RequestParam Map map) {
		boolean flag = loginService.isCorrectPassword(map);
		// 비밀번호가 틀린 경우는 이전 페이지로
		if (!flag) {
			return "<script>alert('비밀번호가 일치하지 않아요');history.back();</script>";
		}
		// 비밀번호가 일치하는 경우
		if("editBtn".equals(map.get("mode"))) {
			return "<script>location.href='/project/JoinEdit.do'</script>";
		}
		else {
			return "<script>location.href='/project/Inacive.do'</script>";
		}
	}
	
	//회원수정 클릭 후 비밀번호 일치 시
	@GetMapping("/JoinEdit.do")
	public String joinEdit(HttpServletRequest req, Map map) {
		MemberDTO member = loginService.selectOne(req);
		String id = member.getId();
		map.put("info",loginService.selectOne(id));
		
		return "login/JoinEdit";
	}
	
	//회원탈퇴 클릭 후 비밀번호 일치 시
	@GetMapping("/Inacive.do")
	@ResponseBody
	public String inActive(HttpServletRequest req) {
		int flag = loginService.delete(req);
		if(flag == 1) {
			return "<script>alert('그동안 MEDI-Q 서비스를 아끼고 사랑해주셔서 감사합니다.\\r\\n더욱더 노력하고 발전하는 MEDI-Q가 되겠습니다.');location.href=\'/project/Logout.do\';</script>";
		}

		return "<script>alert('정상적으로 탈퇴처리가 되지 않았습니다.');history.back();</script>";
	}
	
	//소셜 첫 로그인 시
	@GetMapping("/JoinAdd.do")
	public String joinAdd(@RequestParam String add1, String add2, Map map) {
		map.put("first", "first");
		map.put("info", loginService.selectOne(add1));
		map.put("token", loginService.selectOne(add2));
		return "login/JoinEdit";
	}
	
	//회원정보 수정 완료 클릭 후(일반 회원)
	@PostMapping("/JoinEditOk.do")
	@ResponseBody
	public String joinEditOk(@Valid MemberDTO member, Errors errors, HttpServletRequest req) {
		if(errors.hasErrors()) {
			System.out.println("error: "+errors);
			return "<script>history.back();</script>";
		}

		int affected = loginService.update(member);
		if (affected == 1) {
			return "<script>alert('회원정보 수정이 완료되었습니다\\r\\n마이페이지 화면으로 이동합니다');location.href=\'/project/MyPage.do\';</script>";
		} else {
			return "<script>alert('회원정보 수정에 실패하였습니다');history.back()</script>";
		}
	}
	
	//회원정보 수정 완료 클릭 후(소셜 로그인)
	@PostMapping("/JoinEditSocialOk.do")
	@ResponseBody
	public String joinEditOk(@RequestParam Map map, HttpServletRequest req, HttpServletResponse resp, MemberDTO member) {
		Pattern pattern = Pattern.compile(MemberDTO.REGEX_NAME);
		Matcher matcher = pattern.matcher(map.get("name").toString());
		if(!matcher.matches()) {
			return "<script>alert('입력한 정보를 확인해주세요');history.back()</script>";
		}
		
		member.setId(map.get("id").toString());
		member.setName(map.get("name").toString());
		member.setBirth(map.get("birth").toString());
		member.setGender(map.get("gender").toString());

		int affected = loginService.update(member);
		
		if (affected == 1) {
			if(map.get("first")!=null) {
				String token = loginService.socialLogin(map,map.get("token").toString());

				// 쿠키에 굽자
				Cookie cookie = new Cookie(tokenName, token);
				cookie.setPath("/");
				resp.addCookie(cookie);

				// 쿠키를 response에 담았으니 redirect로 보내야함(메인 페이지로)
				return "<script>alert('추가 정보 입력이 완료되었습니다\\r\\메인 화면으로 이동합니다');location.replace(\'/\');</script>";
			}
			return "<script>alert('회원정보 수정이 완료되었습니다\\r\\마이페이지 화면으로 이동합니다');location.href=\'/project/MyPage.do\';</script>";
		} else {
			return "<script>alert('회원정보 수정에 실패하였습니다');history.back()</script>";
		}
	}
	
	//이미지 수정 클릭 시(파일선택)
	@PostMapping(value = "/ProfImgEdit.do", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String profImgEdit(ProfileImageDTO dto, MemberDTO member, Model model) throws IllegalStateException, IOException {

		ProfileImageDTO info = loginService.editProfImg(dto);
		
		int insertFlag = loginService.insertProfImg(info);
		
		if(insertFlag==1) {
			member.setProf_Img_Fl("Y");
			loginService.updateProfImg(member);
		}
		
		model.addAttribute("SUCCFAIL", insertFlag);
		model.addAttribute("WHERE", "PROF");
		return "login/Message";
	}
	
	//이미지 수정 클릭 시(기본이미지)
	@GetMapping("/ProfImgEdit.do")
	public String profImgEditDefault(ProfileImageDTO dto, MemberDTO member, HttpServletRequest req, Model model) throws IllegalStateException, IOException {
		String id = jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub").toString();
		dto.setId(id);
		int deleteFlag = loginService.editProfImgDefault(dto);
		
		if(deleteFlag==1) {
			System.out.println("deleteFlag: "+deleteFlag);
			member.setProf_Img_Fl("N");
			member.setId(id);
			loginService.updateProfImg(member);
		}
		
		model.addAttribute("SUCCFAIL", deleteFlag);
		model.addAttribute("WHERE", "PROF");
		
		return "login/Message";
	}
	
	//건강정보 등록
	@PostMapping("/healthInfo.do")
	@ResponseBody
	public String[] healthInfo(String[] healthRegi, HttpServletRequest req) {
		
		myHealthServiceImpl.insert(healthRegi,req);
		
		return healthRegi;
	}
	
	//건강프로필 프로그레스 바
	@PostMapping("/ProgressProfile.do")
	@ResponseBody
	public Map progressProfile(@RequestParam String id) {
		Map map = new HashMap<>();
		int sum = 0;
		
		int arc = analyzeMyReportServiceImpl.selectAnalyzeReportCount(id)>=1 ? 25 : 0;
		int hi = healthInfoServiceImpl.selectHealthInfoCount(id)==1 ? 25 : 0;
		int mh = myHealthServiceImpl.selectMyHealth(id)==1 ? 25 : 0;
		Map mt = mentalTestServiceImpl.selectResult(id);
		System.out.println("삼항연산자 전: "+mt);
		if(mt != null) {
			System.out.println(mt.get("TEST2"));
			int test1 = mt.get("TEST1")==null ? 0 : 6;
			int test2 = mt.get("TEST2")==null ? 0 : 6;
			int test3 = mt.get("TEST3")==null ? 0 : 6;
			int test4 = mt.get("TEST4")==null ? 0 : 7;
			sum = test1+test2+test3+test4;
			map.put("mt", sum);//등록한 정신건강테스트 4종 여부-25(6/6/6/7)
		}
		map.put("arc", arc);//등록한 분석 여부-25
		map.put("hi", hi);//등록한 건강검진결과 확인 여부-25
		map.put("mh", mh);//등록한 나의 건강정보 등록 여부-25
		map.put("mt", sum);//등록한 정신건강테스트 4종 여부-25(6/6/6/7)
		System.out.println("프로그레스 바: "+map);
		return map;
	}
	
	//정신건강테스트1
	@GetMapping("/MentalTest1.do")
	public String mentalTest1() {
		return "mentaltest/MentalTest1";
	}
	//정신건강테스트2
	@GetMapping("/MentalTest2.do")
	public String mentalTest2() {
		return "mentaltest/MentalTest2";
	}
	//정신건강테스트3
	@GetMapping("/MentalTest3.do")
	public String mentalTest3(HttpServletRequest req, HttpServletResponse resp, Model model) {
		MemberDTO member = loginService.selectOne(req);
		model.addAttribute("info", member);
		return "mentaltest/MentalTest3";
	}
	//정신건강테스트4
	@GetMapping("/MentalTest4.do")
	public String mentalTest4() {
		return "mentaltest/MentalTest4";
	}
	
	//정신건강테스트 결과
	@PostMapping("/MentalResult.do")
	@ResponseBody
	public String mentalResult(@RequestParam Map map, HttpServletRequest req) {
		
		String name = map.get("name").toString();
		System.out.println("name: "+name);
		try {
			String id = (String)jwTokensService.getTokenPayloads(jwTokensService.getToken(req, tokenName), secretKey).get("sub");
			if("result".equals(name)) {//최근 결과값 필요
				String test = map.get("test").toString();
				System.out.println("test: "+test);
				map = mentalTestServiceImpl.selectResult(id);
				System.out.println("정신건강테스트: "+map);
				String result = map.get(test.toUpperCase()).toString();
				System.out.println("result: "+result);
				return result;
			}
			else {//값 저장
				map.put("id", id);
				int result = mentalTestServiceImpl.insertResult(map);
				System.out.println("저장: "+result);
				return Integer.toString(result);
			}
		}
		//catch (NullPointerException e) {
			//return map.get("sum").toString();
		//}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
	
	//복용 알림 설정
	@PostMapping("/TakeAlarm.do")
	@ResponseBody
	public Map takeAlarm(@RequestParam Map map) {
		System.out.println("알람 map: "+map);
		if("저장".equals(map.get("type"))) {
			takeFoodAlarmServiceImpl.insertAlarm(map);
		}
		else if("삭제".equals(map.get("type"))){
			takeFoodAlarmServiceImpl.deleteAlarm(map);
		}
		else {
			map = takeFoodAlarmServiceImpl.selectTakeFoodAlarm(map);
			System.out.println("data map: "+map);
		}
		return map;
	}
}
