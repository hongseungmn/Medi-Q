package com.kosmo.springapp.admin.controller;

import java.util.ArrayList;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.LinkedHashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.math.BigDecimal;
import java.sql.Clob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.kosmo.springapp.admin.service.AdminMapper;
import com.kosmo.springapp.model.MemberDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	
	// 관리자 메인 화면
	@GetMapping("/AdminMain.do")
	public String adminMain(Model model) throws JsonProcessingException {
		
    	/////////////////// 영양제 
    	List<Map<String, Object>> foodInfos = adminMapper.getInfoFromFoodTable();

    	// Map 내의 null 값을 빈 문자열로 대체하는 처리
        for (Map<String, Object> foodInfo : foodInfos) {
        	foodInfo.put("no", getStringValue(foodInfo.get("NO"), 25));
            foodInfo.put("productName", getStringValue(foodInfo.get("PRODUCTNAME"), 25));
            foodInfo.put("material", getStringValue(foodInfo.get("MATERIAL"), 25));
            foodInfo.put("nutrient", getStringValue(foodInfo.get("NUTRIENT"), 25));
            foodInfo.put("reviewCount", getStringValue(foodInfo.get("REVIEW_COUNT"), 25));
            foodInfo.put("avgStarScore", getStringValue(foodInfo.get("AVG_STARSCORE"), 25));
        }
        model.addAttribute("foodInfos", foodInfos);
        
		// 버블 차트
        // 분석 정보 가져오기
    	List<Map<String, Object>> analyzeInfo = adminMapper.getInfoFromAnalyzeTable();
    	
    	// 현재 날짜를 가져와서 연령 계산에 사용합니다.
        LocalDate currentDate = LocalDate.now();
        
        // SimpleDateFormat을 이용해 날짜 포맷 지정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        for (Map<String, Object> row : analyzeInfo) {
        	
        	// 행에서 선택 건강고민 정보를 추출합니다.
            String takePurposes = (String) row.get("TAKEPURPOSES");
            if (takePurposes != null) {
                // 선택 건강고민 값을 [, ]로 둘러싸지 않도록 수정합니다.
                takePurposes = takePurposes.replaceAll("\\[|\\]", "");

                // 선택 건강고민 정보를 해당 행의 맵에 추가합니다.
                row.put("TAKEPURPOSES", takePurposes);
            }
        	
        	// 행에서 분석일 정보를 추출합니다.
            Timestamp analyzedTimestamp = (Timestamp) row.get("ANALYZEDATE");
            if (analyzedTimestamp != null) {
                // Timestamp를 Date로 변환하고, 시분초를 제외한 날짜 문자열로 변환합니다.
                String analyzedDate = dateFormat.format(analyzedTimestamp);

                // 분석일 정보를 해당 행의 맵에 추가합니다.
                row.put("ANALYZEDATE", analyzedDate);
            }
            
            // 행에서 생년월일 정보를 추출합니다.
            Timestamp birthTimestamp = (Timestamp) row.get("BIRTH");
            if (birthTimestamp != null) {
            	
                // Timestamp를 Date로 변환합니다.
                Date birthDate = new Date(birthTimestamp.getTime());

                // 생년월일을 LocalDate로 변환합니다.
                LocalDate birthLocalDate = birthDate.toLocalDate();

                // 나이 계산
                int age = Period.between(birthLocalDate, currentDate).getYears();

                // 연령대 그룹화
                String ageRange;
                if (age < 20) {
                    ageRange = "20대 미만";
                } else if (age >= 20 && age < 30) {
                    ageRange = "20대";
                } else if (age >= 30 && age < 40) {
                    ageRange = "30대";
                } else if (age >= 40 && age < 50) {
                    ageRange = "40대";
                } else if (age >= 50 && age < 60) {
                    ageRange = "50대";
                } else {
                    ageRange = "60대 이상";
                }

                // 연령대 정보를 해당 행의 맵에 추가합니다.
                row.put("AGE_RANGE", ageRange);
            }
        }

        model.addAttribute("analyzeInfo", analyzeInfo);
    	
        
        // 연령대별로 선택한 건강고민의 개수를 계산합니다.
        Map<String, Map<String, Integer>> selectionCountData = new HashMap<>();
        for (Map<String, Object> row : analyzeInfo) {
            String ageRange = (String) row.get("AGE_RANGE");

            String takePurposesString = (String) row.get("TAKEPURPOSES");
            if (takePurposesString != null) {
                // 쉼표를 구분자로 사용하여 문자열을 분리합니다.
                String[] takePurposes = takePurposesString.split(","); 

                if (!selectionCountData.containsKey(ageRange)) {
                    selectionCountData.put(ageRange, new HashMap<>());
                }

                Map<String, Integer> countMap = selectionCountData.get(ageRange);
                for (String takePurpose : takePurposes) {
                    // 문자열 앞 뒤의 공백을 제거합니다.
                    String trimmedTakePurpose = takePurpose.trim(); 
                    countMap.put(trimmedTakePurpose, countMap.getOrDefault(trimmedTakePurpose, 0) + 1);
                }
            }
        }

        ObjectMapper objectMapper = new ObjectMapper();
        String selectionCountDataJson = objectMapper.writeValueAsString(selectionCountData);

        model.addAttribute("selectionCountDataJson", selectionCountDataJson);
		
        // 질병예측 결과
    	// 분석 정보 가져오기
    	List<Map<String, Object>> analyzeInfo_ = adminMapper.getInfoFromPredictTable();
    	
    	// 현재 날짜를 가져와서 연령 계산에 사용합니다.
        LocalDate currentDate_ = LocalDate.now();
        
        // SimpleDateFormat을 이용해 날짜 포맷 지정
        SimpleDateFormat dateFormat_ = new SimpleDateFormat("yyyy-MM-dd");

        for (Map<String, Object> row : analyzeInfo_) {
        	
        	// 행에서 분석일 정보를 추출합니다.
            Timestamp analyzedTimestamp = (Timestamp) row.get("P_DATE");
            if (analyzedTimestamp != null) {
                // Timestamp를 Date로 변환하고, 시분초를 제외한 날짜 문자열로 변환합니다.
                String analyzedDate = dateFormat_.format(analyzedTimestamp);

                // 분석일 정보를 해당 행의 맵에 추가합니다.
                row.put("P_DATE", analyzedDate);
            }
            
            // 행에서 생년월일 정보를 추출합니다.
            Timestamp birthTimestamp = (Timestamp) row.get("BIRTH");
            if (birthTimestamp != null) {
            	
                // Timestamp를 Date로 변환합니다.
                Date birthDate = new Date(birthTimestamp.getTime());

                // 생년월일을 LocalDate로 변환합니다.
                LocalDate birthLocalDate = birthDate.toLocalDate();

                // 나이 계산
                int age = Period.between(birthLocalDate, currentDate_).getYears();

                // 연령대 그룹화
                String ageRange;
                if (age < 20) {
                    ageRange = "20대 미만";
                } else if (age >= 20 && age < 30) {
                    ageRange = "20대";
                } else if (age >= 30 && age < 40) {
                    ageRange = "30대";
                } else if (age >= 40 && age < 50) {
                    ageRange = "40대";
                } else if (age >= 50 && age < 60) {
                    ageRange = "50대";
                } else {
                    ageRange = "60대 이상";
                }

                // 연령대 정보를 해당 행의 맵에 추가합니다.
                row.put("AGE_RANGE", ageRange);
            }
        }

        model.addAttribute("analyzeInfo_", analyzeInfo_);
        
		
		
	    return "admin/AdminMain";
	}
	
	// 관리자 회원관리 화면
	@GetMapping("/AdminMember.do")
	public String adminMember(Model model) {
		
		// 회원정보 출력
		List<MemberDTO> members = adminMapper.getMemberInfo();
		
		// 생년월일에서 시분초 제거
		for (MemberDTO member : members) {
	        // 시분초 제거: "2000-03-18 00:00:00" -> "2000-03-18"
			if(member.getBirth() != null) {
		        String birthString = member.getBirth().substring(0, 10);
		        member.setBirth(birthString);
	        }
			else {
				member.setBirth("2023-07-31");
			}
	    }
		
		model.addAttribute("members",members);
		
	    return "admin/AdminMember";
	}
	
	/////////////////////////////////관리자 회원관리 화면
	
	// 회원 정보 삭제
	@PostMapping("/deleteMember.do")
	@ResponseBody
	public Map<String, Object> deleteMember(@RequestBody Map<String, Object> data) {
		
	    String memberId = (String) data.get("memberId");

	    Map<String, Object> response = new HashMap<>();
	    int deletedRows = adminMapper.deleteMemberInfoByAdmin(memberId);

	    if (deletedRows > 0) {
	        response.put("success", true);
	        response.put("message", " 회원 삭제가 성공적으로 완료되었습니다.");
	    } else {
	        response.put("success", false);
	        response.put("message", " 회원 삭제를 실패하였습니다. 다시 시도해주세요.");
	    }

	    return response;
	}
	
	// 회원 정보 수정 전 조회
	@GetMapping("/getMemberById/{memberId}")
	@ResponseBody
	public Map<String, Object> getMemberById(@PathVariable String memberId) {
		
	    Map<String, Object> response = new HashMap<>();

	    try {
	        MemberDTO memberdto = adminMapper.getMemberInfoById(memberId);
	        if (memberdto != null) {
	            response.put("success", true);
	            response.put("member", memberdto);
	        } else {
	            response.put("success", false);
	            response.put("message", "회원 정보를 찾을 수 없습니다.");
	        }
	    } 
	    catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "회원 정보 조회에 실패하였습니다.");
	    }

	    return response;
	}
	
	// 회원 정보 수정 후 처리
    @PostMapping("/editMember")
    @ResponseBody
    public Map<String, Object> editMember(@RequestBody Map<String, Object> request) {
        
    	Map<String, Object> response = new HashMap<>();

    	try {
            // MemberDTO 객체 생성
            MemberDTO memberDto = new MemberDTO();
            
            // 아이디
            memberDto.setId((String) request.get("id"));
            // 이름
            memberDto.setName((String) request.get("name"));
            // 생년월일 설정
            String birthStr = (String) request.get("birth");
            memberDto.setBirth(birthStr);
            // 성별
            memberDto.setGender((String) request.get("gender"));
            // 이메일
            memberDto.setEmail((String) request.get("email"));
            // 활동상태     
            memberDto.setActive((String) request.get("active"));
            // 활동변경일자
            // 받은 JSON 데이터에서 inactive_date를 파싱하여 Date 타입으로 변환
            if(request.get("inactive_Date") != null) {
	            String inactiveDateStr = (String) request.get("inactive_Date");
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            java.util.Date utilInactiveDate = dateFormat.parse(inactiveDateStr);
	            java.sql.Date sqlInactiveDate = new java.sql.Date(utilInactiveDate.getTime());
	            memberDto.setInactive_date(sqlInactiveDate);
            }
            else {
            	memberDto.setInactive_date(null);
            }
	            
	            
            // 소셜 여부
            memberDto.setSocial_Fl((String) request.get("socialFl"));
            // 소셜 사이트
            memberDto.setSite((String) request.get("site"));
            
            // 회원정보 업데이트
            int affectedRows = adminMapper.updateMemberInfoByAdmin(memberDto);
            
            if (affectedRows > 0) {
                response.put("success", true);
                response.put("message", "회원 정보가 성공적으로 수정되었습니다.");
            } else {
                response.put("success", false);
                response.put("message", "회원 정보 수정에 실패하였습니다. 다시 시도해주세요.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "회원 정보 수정 중 오류가 발생하였습니다. 관리자에게 문의해주세요.");
        }

        return response;
    }
	
	// 일일 로그인수 조회
    @GetMapping("/countLoginMember.do")
    @ResponseBody
    public List<Integer> countLoginMember() {
        try {
            // 로그인 로그를 조회하는 로직 (데이터베이스 조회 등)
            // 여기에서는 예시 데이터로 임의의 결과를 반환합니다.
        	// 로그인 로그를 조회하는 로직을 LoginLogService에서 처리하여 가져옵니다.
        	int count_6days_ago = adminMapper.count_6days_ago();
        	int count_5days_ago = adminMapper.count_5days_ago();
        	int count_4days_ago = adminMapper.count_4days_ago();
        	int count_3days_ago = adminMapper.count_3days_ago();
        	int count_2days_ago = adminMapper.count_2days_ago();
        	int count_1days_ago = adminMapper.count_1days_ago();
        	int count_0days_ago = adminMapper.count_0days_ago();
        	
        	// 조회된 로그인 수를 List에 담아서 반환합니다.
            List<Integer> loginCounts = new ArrayList<>();
            loginCounts.add(count_6days_ago);
            loginCounts.add(count_5days_ago);
            loginCounts.add(count_4days_ago);
            loginCounts.add(count_3days_ago);
            loginCounts.add(count_2days_ago);
            loginCounts.add(count_1days_ago);
            loginCounts.add(count_0days_ago);
        	
            
            return loginCounts;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return null; 
        }
    }

    // 일일 로그인수 조회
    @GetMapping("/countSignUpMember.do")
    @ResponseBody
    public List<Integer> countSignUpMember() {
        try {
            // 로그인 로그를 조회하는 로직 (데이터베이스 조회 등)
            // 여기에서는 예시 데이터로 임의의 결과를 반환합니다.
        	// 로그인 로그를 조회하는 로직을 LoginLogService에서 처리하여 가져옵니다.
        	int count_6days_ago = adminMapper.scount_6days_ago();
        	int count_5days_ago = adminMapper.scount_5days_ago();
        	int count_4days_ago = adminMapper.scount_4days_ago();
        	int count_3days_ago = adminMapper.scount_3days_ago();
        	int count_2days_ago = adminMapper.scount_2days_ago();
        	int count_1days_ago = adminMapper.scount_1days_ago();
        	int count_0days_ago = adminMapper.scount_0days_ago();
        	
        	// 조회된 로그인 수를 List에 담아서 반환합니다.
            List<Integer> loginCounts = new ArrayList<>();
            loginCounts.add(count_6days_ago);
            loginCounts.add(count_5days_ago);
            loginCounts.add(count_4days_ago);
            loginCounts.add(count_3days_ago);
            loginCounts.add(count_2days_ago);
            loginCounts.add(count_1days_ago);
            loginCounts.add(count_0days_ago);
        	
            
            return loginCounts;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return null; 
        }
    }
    
    @GetMapping("/getAgeData.do")
    @ResponseBody
    public Map<String, Integer> getAgeData() {
    	
    	Map<String, Integer> ageDataMap = new LinkedHashMap<>();

        // 현재 년도 구하기
        int currentYear = LocalDate.now().getYear();

        // 회원 정보 가져오기
        List<MemberDTO> members = adminMapper.getMemberInfo();

        // 연령대 구분 및 연령대별 회원 수 세기
        for (MemberDTO member : members) {
            String birthYearStr = member.getBirth().substring(0, 4);
            int birthYear = Integer.parseInt(birthYearStr);
            int age = currentYear - birthYear;

            String ageGroup;
            
            if (age < 20) {
                ageGroup = "20대 미만";
            } else if (age < 30) {
                ageGroup = "20대";
            } else if (age < 40) {
                ageGroup = "30대";
            } else if (age < 50) {
                ageGroup = "40대";
            } else if (age < 60) {
                ageGroup = "50대";
            } else {
                ageGroup = "60대 이상";
            }

            ageDataMap.put(ageGroup, ageDataMap.getOrDefault(ageGroup, 0) + 1);
        }
       

        return ageDataMap;
    }
    /////////////////////////////////관리자 회원관리 화면
    
    /////////////////////////////////영양소, 영양제 DB 관리
    @GetMapping("/AdminDB.do")
	public String adminDB(Model model) {
    	
    	/////////////////// 영양제 
    	List<Map<String, Object>> foodInfos = adminMapper.getInfoFromFoodTable();

    	// Map 내의 null 값을 빈 문자열로 대체하는 처리
        for (Map<String, Object> foodInfo : foodInfos) {
        	foodInfo.put("no", getStringValue(foodInfo.get("NO"), 25));
            foodInfo.put("productName", getStringValue(foodInfo.get("PRODUCTNAME"), 25));
            foodInfo.put("material", getStringValue(foodInfo.get("MATERIAL"), 25));
            foodInfo.put("nutrient", getStringValue(foodInfo.get("NUTRIENT"), 25));
            foodInfo.put("reviewCount", getStringValue(foodInfo.get("REVIEW_COUNT"), 25));
            foodInfo.put("avgStarScore", getStringValue(foodInfo.get("AVG_STARSCORE"), 25));
        }
        model.addAttribute("foodInfos", foodInfos);
        
        // 영양제 Top10 이름
        List<String> foodTop10 = new ArrayList<>();
        for (int i = 0; i < Math.min(foodInfos.size(), 10); i++) {
            Map<String, Object> foodInfo = foodInfos.get(i);
            String productName = getStringValue(foodInfo.get("PRODUCTNAME"), 4);
            foodTop10.add(productName);
        }
        model.addAttribute("foodTop10", foodTop10);

        // 영양제 Top10 리뷰개수 
        List<String> foodTop10RC = new ArrayList<>();
        for (int i = 0; i < Math.min(foodInfos.size(), 10); i++) {
            Map<String, Object> foodInfo = foodInfos.get(i);
            String REVIEW_COUNT = getStringValue(foodInfo.get("REVIEW_COUNT"), 3);
            foodTop10RC.add(REVIEW_COUNT);
        }
        model.addAttribute("foodTop10RC", foodTop10RC);
        
        // 영양제 Top10 평균별점
        List<String> foodTop10AS = new ArrayList<>();
        for (int i = 0; i < Math.min(foodInfos.size(), 10); i++) {
            Map<String, Object> foodInfo = foodInfos.get(i);
            String AVG_STARSCORE = getStringValue(foodInfo.get("AVG_STARSCORE"), 3);
            // 새로운 코드 추가: 소수점 아래 둘째 자리를 소수점 아래 첫째 자리로 변환
            int dotIndex = AVG_STARSCORE.indexOf(".");
            if (dotIndex != -1 && AVG_STARSCORE.length() > dotIndex + 1) {
                AVG_STARSCORE = AVG_STARSCORE.substring(0, dotIndex + 2);
            }
            foodTop10AS.add(AVG_STARSCORE);
        }
        model.addAttribute("foodTop10AS", foodTop10AS);
    	
        ///////////////////// 영양소
        List<Map<String, Object>> nutInfos = adminMapper.getInfoFromNut();
        for (Map<String, Object> nutInfo : nutInfos) {
            // CLOB 객체를 String으로 변환하여 작업
            Object productNamesObj = nutInfo.get("PRODUCTNAMES");
            if (productNamesObj != null) {
                String productNames;
                if (productNamesObj instanceof Clob) {
                    Clob clob = (Clob) productNamesObj;
                    try {
                        productNames = clob.getSubString(1, (int) clob.length());
                        productNames = productNames.replaceAll("&quot;", "").replaceAll("&apos;", "");
                    } catch (SQLException e) {
                        e.printStackTrace();
                        productNames = "";
                    }
                } else {
                    productNames = productNamesObj.toString();
                }
                nutInfo.put("productNames", getStringValue(productNames, 25));
            } else {
                // Set "-" when productNamesObj is null
                nutInfo.put("productNames", "-");
            }

            // NAME, FUNC, VIEW 추가 및 null 값을 빈 문자열로 변환하여 동일한 키로 저장
            nutInfo.put("name", getStringValue(nutInfo.get("N_NAME"), 25));
            nutInfo.put("func", getStringValue(nutInfo.get("N_FUNC"), 25));

            // nView 값을 BigDecimal로 변환하여 저장
            String nViewStr = getStringValue(nutInfo.get("N_VIEW"), 25);
            BigDecimal nView = new BigDecimal(nViewStr);
            nutInfo.put("view", nView);
            
            // 추가한 키를 제거하여 원래 키와 이름이 충돌하지 않도록 합니다.
            nutInfo.remove("N_NAME");
            nutInfo.remove("N_FUNC");
            nutInfo.remove("N_VIEW");
        }
        
        // 원료(INGREDIENT) 정보 조회
        List<Map<String, Object>> ingInfos = adminMapper.getInfoFromIng();
        for (Map<String, Object> ingInfo : ingInfos) {
            // CLOB 객체를 String으로 변환하여 작업
            Object productNamesObj = ingInfo.get("PRODUCTNAMES");
            if (productNamesObj != null) {
                String productNames;
                if (productNamesObj instanceof Clob) {
                    Clob clob = (Clob) productNamesObj;
                    try {
                        productNames = clob.getSubString(1, (int) clob.length());
                        productNames = productNames.replaceAll("&quot;", "").replaceAll("&apos;", "");
                    } catch (SQLException e) {
                        e.printStackTrace();
                        productNames = "";
                    }
                } else {
                    productNames = productNamesObj.toString();
                }
                ingInfo.put("productNames", getStringValue(productNames, 25));
            } else {
                // Set "-" when productNamesObj is null
            	ingInfo.put("productNames", "-");
            }

            // NAME, FUNC, VIEW 추가 및 null 값을 빈 문자열로 변환하여 동일한 키로 저장
            ingInfo.put("name", getStringValue(ingInfo.get("I_NAME"), 25));
            ingInfo.put("func", getStringValue(ingInfo.get("I_FUNC"), 25));

            // iView 값을 BigDecimal로 변환하여 저장
            String iViewStr = getStringValue(ingInfo.get("I_VIEW"), 25);
            BigDecimal iView = new BigDecimal(iViewStr);
            ingInfo.put("view", iView);
            
            // 추가한 키를 제거하여 원래 키와 이름이 충돌하지 않도록 합니다.
            ingInfo.remove("I_NAME");
            ingInfo.remove("I_FUNC");
            ingInfo.remove("I_VIEW");
        }
        
        // 영양소(NUTRIENT)와 원료(INGREDIENT) 정보를 하나의 리스트로 합칩니다.
        List<Map<String, Object>> mergedInfos = new ArrayList<>();
        mergedInfos.addAll(nutInfos);
        mergedInfos.addAll(ingInfos);

        
        // 뷰(View)를 기준으로 내림차순으로 정렬합니다.
        mergedInfos.sort(Comparator.comparingInt(info -> {
            BigDecimal view = (BigDecimal) info.get("view");
            return view != null ? view.intValue() : 0;
        }));
        Collections.reverse(mergedInfos);

        // 최종 결과를 모델에 추가합니다.
        model.addAttribute("mergedInfos", mergedInfos);
        
        // 영양소 Top10 
        List<String> nutTop10 = new ArrayList<>();
        for (int i = 0; i < Math.min(mergedInfos.size(), 10); i++) {
            Map<String, Object> mergedInfo = mergedInfos.get(i);
            String name = getStringValue(mergedInfo.get("name"), 5);
            nutTop10.add(name);
        }
        model.addAttribute("nutTop10", nutTop10);
        
        // 영양소 Top10 조회수
        List<String> nutTop10v = new ArrayList<>();
        for (int i = 0; i < Math.min(mergedInfos.size(), 10); i++) {
            Map<String, Object> mergedInfo = mergedInfos.get(i);
            String view = getStringValue(mergedInfo.get("view"), 5);
            nutTop10v.add(view);
        }
        model.addAttribute("nutTop10v", nutTop10v);
        
        // 영양소 Top10 검색수
        List<Integer> nutTop10s = new ArrayList<>();
        for (int i = 0; i < Math.min(mergedInfos.size(), 10); i++) {
            Map<String, Object> mergedInfo = mergedInfos.get(i);
            String name = getStringValue(mergedInfo.get("name"), 20);
            
            int sCount = adminMapper.getNutTop10s(name);
            
            nutTop10s.add(sCount);
        }
        model.addAttribute("nutTop10s", nutTop10s);
        
        
	    return "admin/AdminDB";
	}
    
     // null 값을 빈 문자열로 변환하는 헬퍼 메서드
    private String getStringValue(Object value, int maxLength) {
        String stringValue = value != null ? value.toString() : "-";
        if (stringValue.length() > maxLength) {
            stringValue = stringValue.substring(0, maxLength) + "..";
        }
        return stringValue;
    }
    /////////////////////////////////영양소, 영양제 DB 관리
    
    /////////////////////////////////영양제 분석 결과
    @GetMapping("/AdminIssue.do")
 	public String AdminIssue(Model model) throws JsonProcessingException {
 		
    	// 분석 정보 가져오기
    	List<Map<String, Object>> analyzeInfo = adminMapper.getInfoFromAnalyzeTable();
    	
    	// 현재 날짜를 가져와서 연령 계산에 사용합니다.
        LocalDate currentDate = LocalDate.now();
        
        // SimpleDateFormat을 이용해 날짜 포맷 지정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        for (Map<String, Object> row : analyzeInfo) {
        	
        	// 행에서 선택 건강고민 정보를 추출합니다.
            String takePurposes = (String) row.get("TAKEPURPOSES");
            if (takePurposes != null) {
                // 선택 건강고민 값을 [, ]로 둘러싸지 않도록 수정합니다.
                takePurposes = takePurposes.replaceAll("\\[|\\]", "");

                // 선택 건강고민 정보를 해당 행의 맵에 추가합니다.
                row.put("TAKEPURPOSES", takePurposes);
            }
        	
        	// 행에서 분석일 정보를 추출합니다.
            Timestamp analyzedTimestamp = (Timestamp) row.get("ANALYZEDATE");
            if (analyzedTimestamp != null) {
                // Timestamp를 Date로 변환하고, 시분초를 제외한 날짜 문자열로 변환합니다.
                String analyzedDate = dateFormat.format(analyzedTimestamp);

                // 분석일 정보를 해당 행의 맵에 추가합니다.
                row.put("ANALYZEDATE", analyzedDate);
            }
            
            // 행에서 생년월일 정보를 추출합니다.
            Timestamp birthTimestamp = (Timestamp) row.get("BIRTH");
            if (birthTimestamp != null) {
            	
                // Timestamp를 Date로 변환합니다.
                Date birthDate = new Date(birthTimestamp.getTime());

                // 생년월일을 LocalDate로 변환합니다.
                LocalDate birthLocalDate = birthDate.toLocalDate();

                // 나이 계산
                int age = Period.between(birthLocalDate, currentDate).getYears();

                // 연령대 그룹화
                String ageRange;
                if (age < 20) {
                    ageRange = "20대 미만";
                } else if (age >= 20 && age < 30) {
                    ageRange = "20대";
                } else if (age >= 30 && age < 40) {
                    ageRange = "30대";
                } else if (age >= 40 && age < 50) {
                    ageRange = "40대";
                } else if (age >= 50 && age < 60) {
                    ageRange = "50대";
                } else {
                    ageRange = "60대 이상";
                }

                // 연령대 정보를 해당 행의 맵에 추가합니다.
                row.put("AGE_RANGE", ageRange);
            }
        }

        model.addAttribute("analyzeInfo", analyzeInfo);
    	
        
        // 연령대별로 선택한 건강고민의 개수를 계산합니다.
        Map<String, Map<String, Integer>> selectionCountData = new HashMap<>();
        for (Map<String, Object> row : analyzeInfo) {
            String ageRange = (String) row.get("AGE_RANGE");

            String takePurposesString = (String) row.get("TAKEPURPOSES");
            if (takePurposesString != null) {
                // 쉼표를 구분자로 사용하여 문자열을 분리합니다.
                String[] takePurposes = takePurposesString.split(","); 

                if (!selectionCountData.containsKey(ageRange)) {
                    selectionCountData.put(ageRange, new HashMap<>());
                }

                Map<String, Integer> countMap = selectionCountData.get(ageRange);
                for (String takePurpose : takePurposes) {
                    // 문자열 앞 뒤의 공백을 제거합니다.
                    String trimmedTakePurpose = takePurpose.trim(); 
                    countMap.put(trimmedTakePurpose, countMap.getOrDefault(trimmedTakePurpose, 0) + 1);
                }
            }
        }

        ObjectMapper objectMapper = new ObjectMapper();
        String selectionCountDataJson = objectMapper.writeValueAsString(selectionCountData);

        model.addAttribute("selectionCountDataJson", selectionCountDataJson);

        return "admin/AdminIssue";
    }
    
    ////////////////////////////////////////////질병예측 결과 관리
    @GetMapping("/AdminPredict.do")
	public String adminPredict(Model model) {
    	
    	// 분석 정보 가져오기
    	List<Map<String, Object>> analyzeInfo = adminMapper.getInfoFromPredictTable();
    	
    	// 현재 날짜를 가져와서 연령 계산에 사용합니다.
        LocalDate currentDate = LocalDate.now();
        
        // SimpleDateFormat을 이용해 날짜 포맷 지정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        for (Map<String, Object> row : analyzeInfo) {
        	
        	// 행에서 분석일 정보를 추출합니다.
            Timestamp analyzedTimestamp = (Timestamp) row.get("P_DATE");
            if (analyzedTimestamp != null) {
                // Timestamp를 Date로 변환하고, 시분초를 제외한 날짜 문자열로 변환합니다.
                String analyzedDate = dateFormat.format(analyzedTimestamp);

                // 분석일 정보를 해당 행의 맵에 추가합니다.
                row.put("P_DATE", analyzedDate);
            }
            
            // 행에서 생년월일 정보를 추출합니다.
            Timestamp birthTimestamp = (Timestamp) row.get("BIRTH");
            if (birthTimestamp != null) {
            	
                // Timestamp를 Date로 변환합니다.
                Date birthDate = new Date(birthTimestamp.getTime());

                // 생년월일을 LocalDate로 변환합니다.
                LocalDate birthLocalDate = birthDate.toLocalDate();

                // 나이 계산
                int age = Period.between(birthLocalDate, currentDate).getYears();

                // 연령대 그룹화
                String ageRange;
                if (age < 20) {
                    ageRange = "20대 미만";
                } else if (age >= 20 && age < 30) {
                    ageRange = "20대";
                } else if (age >= 30 && age < 40) {
                    ageRange = "30대";
                } else if (age >= 40 && age < 50) {
                    ageRange = "40대";
                } else if (age >= 50 && age < 60) {
                    ageRange = "50대";
                } else {
                    ageRange = "60대 이상";
                }

                // 연령대 정보를 해당 행의 맵에 추가합니다.
                row.put("AGE_RANGE", ageRange);
            }
            
             
        }

        model.addAttribute("analyzeInfo", analyzeInfo);
    	
    	return "admin/AdminPredict";
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
	
	
	
}
