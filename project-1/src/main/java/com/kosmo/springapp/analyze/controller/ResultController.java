package com.kosmo.springapp.analyze.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.analyze.model.HealthIssueDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;
import com.kosmo.springapp.analyze.service.AnalyzeService;
import com.kosmo.springapp.analyze.service.impl.AnalyzeServiceImpl;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.service.impl.MainPageServiceImpl;

@Controller
public class ResultController {
	
	@Autowired
	MainPageServiceImpl mainPageService;
	
	@Autowired
	AnalyzeServiceImpl analyzeService;
	
	
	//나중에 nutrient테이블 N_SUBNAME으로 가져오기
	
	@GetMapping("/healthresult.do")
	public String healthResult(Map map,Model model,@RequestParam String no) {
		map.put("no",Integer.parseInt(no));//사용자가 선택한 건기식의 고유번호를 가져옴
		List<String> nuts = analyzeService.nutrientList();//+-*
		FunctionalFoodListDTO listOne = mainPageService.selectFoodOneByNo(map);//+-*map에 no라는 이름으로 no값가져와서 찾기
		Pattern cappattern = Pattern.compile("[0-9.]{1,}");//+-*뒤의 단위 생략용도 ※상한용량은 null값이 있어서 사용에 조심해야함
		float total_result=0;//+-*영양제 점수
		List<String> resultList = new ArrayList<>();
		Map nutnummap = new HashMap<>();
		Map map2 = new HashMap<>();
		//map2.put("나이아신", 149);
        for (String nut : nuts){//위에 저장된 28가지 영양소 만큼 for문
            NutrientDTO nutdto = analyzeService.findNutrientByName(nut);//현재 영양소에 해당하는 정보를 가져온다(서브네임과 비교한다)
            String listpattern = nut + "[^0-9.]*([0-9.]+)";//영양소 이름 다음에 나오는 숫자 또는 (.) 까지를 무시하고 숫자와.만 가져온다
            Pattern listregex = Pattern.compile(listpattern);
            Matcher listmatcher = listregex.matcher(listOne.getStandard());//건기식 정보를 가져올때 비타민 C 같은 경우가 있어 띄워쓰기를 없애는 용도
	        Matcher DMmatcher = cappattern.matcher(nutdto.getN_DRI_M());
            Matcher DFmatcher = cappattern.matcher(nutdto.getN_DRI_F());
            
            if(listmatcher.find()) {//남자 28가지영양소 점수 부여
                String nutNumber = listmatcher.group(1);//건기식에 저장된 영양소량 확인용
                nutnummap.put(nut,nutNumber);

            	if(map2.containsKey(nut)) {
                    float map2num = Float.parseFloat(map2.get(nut).toString());
                    float nutnum = Float.parseFloat(nutnummap.get(nut).toString());
                    float resultmap = map2num+nutnum;
            		nutnummap.replace(nut,resultmap);
            		nutNumber = Float.toString(resultmap);
            	}
        		//System.out.println("헬스이슈에 있는 영양소:"+hnut.trim());
            	//if(nut.equalsIgnoreCase(hnut)) {//여기서 하는거아니고 75개 비교시 사용
            	//System.out.println(nut);//영양소확인용
            	//System.out.println(nutNumber);//영양소량 확인용
            	if(DMmatcher.find()) {
            		if(nutdto.getN_UL_M() != null) {//상한 섭취량 존재유무 판단
            			Matcher UMmatcher = cappattern.matcher(nutdto.getN_UL_M());
            			if(UMmatcher.find()) {
            				if(Float.parseFloat(DMmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 1.5;
	            				String result = nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0);
	            				System.out.println(result);
	            				resultList.add(result);
	            			}//권장 섭취량 보다 조금 먹었을 경우 1.5점 추가
	            			else if(Float.parseFloat(DMmatcher.group(0)) <= Float.parseFloat(nutNumber) &&
	            					Float.parseFloat(UMmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 2.5;
	            				String result =nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0) + " 최대용량 : " + UMmatcher.group(0);
	            				System.out.println(result);
	            				resultList.add(result);
	            			}//권장 섭취량과 상한 섭취량 사이로 먹었을 경우 2.5점 추가
	            			else {
	            				total_result += 2;
	            				String result =nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0) + " 최대용량 : " + UMmatcher.group(0);
	            				System.out.println(result);
	            				resultList.add(result);
	            			}//상한섭취량보다 많이 먹었을 경우 2점추가
            			}//UMmatcher확인용
            		}//if(nutdto.getN_UL_F() != null) 끝(상한 섭취량이 존재함)
            		else {
            			if(Float.parseFloat(DMmatcher.group(0)) > Float.parseFloat(nutNumber)){
            				total_result += 1.5;
            				String result =nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0);
            				System.out.println(result);
            				resultList.add(result);
            			}//상한 섭취량이 없고 권장서취량보다 적게 먹었을 경우 1.5점 추가
            			else if(Float.parseFloat(DMmatcher.group(0)) <= Float.parseFloat(nutNumber)){
            				total_result += 2.5;
            				String result =nut+" : "+nutNumber + " 최소용량 : " + DMmatcher.group(0) + " 최대용량 : 없음";
            				System.out.println(result);
            				resultList.add(result);
            			}//상한섭취량이 없고 권장섭취량 보다 많이먹었을 경우 2.5점추가
            		}//if(nutdto.getN_UL_M() != null) else문 끝(상한 섭취량이 없는 경우)
        		}//DMmatcher확인용
            	
	    		/*if(DFmatcher.find()) {//여자 28가지영양소 점수 부여
	    			if(nutdto.getN_UL_F() != null) {//상한 섭취량 존재 유무 판단
            			Matcher UFmatcher = cappattern.matcher(nutdto.getN_UL_F());
            			if(UFmatcher.find()) {
            				if(Float.parseFloat(DFmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 1.5;
	            				String result = nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0);
	            				System.out.println(result);
	            				resultList.add(result);
	            			}//권장 섭취량 보다 조금 먹었을 경우 1.5점 추가
	            			else if(Float.parseFloat(DFmatcher.group(0)) <= Float.parseFloat(nutNumber) &&
	            					Float.parseFloat(UFmatcher.group(0)) > Float.parseFloat(nutNumber)) {
	            				total_result += 2.5;
	            				String result =nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0) + " 최대용량 : " + UFmatcher.group(0);
	            				System.out.println(result);
	            				resultList.add(result);
	            			}//권장 섭취량과 상한 섭취량 사이로 먹었을 경우 2.5점 추가
	            			else {
	            				total_result += 2;
	            				String result =nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0) + " 최대용량 : " + UFmatcher.group(0);
	            				System.out.println(result);
	            				resultList.add(result);
	            			}//상한섭취량보다 많이 먹었을 경우 2점추가
            			}//UFmatcher확인용
            		}//if(nutdto.getN_UL_M() != null) 끝(상한 섭취량이 존재함)
            		else {
            			if(Float.parseFloat(DFmatcher.group(0)) > Float.parseFloat(nutNumber)){
            				total_result += 1.5;
            				String result =nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0);
            				System.out.println(result);
	            				resultList.add(result);
            			}//상한 섭취량이 없고 권장서취량보다 적게 먹었을 경우 1.5점 추가
            			else if(Float.parseFloat(DFmatcher.group(0)) <= Float.parseFloat(nutNumber)){
            				total_result += 2.5;
            				String result =nut+" : "+nutNumber + " 최소용량 : " + DFmatcher.group(0) + " 최대용량 : 없음";
            				System.out.println(result);
	            				resultList.add(result);
            			}//상한섭취량이 없고 권장섭취량 보다 많이먹었을 경우 2.5점추가
            			
            		}//if(nutdto.getN_UL_F() != null) else문 끝(상한 섭취량이 없는 경우)
	    			
	        	}//여자 권장 섭취량확인 끝*/
	    		
            }//영양제 matcher확인 끝
            
        	
        }//28가지 영양제for문 끝
    	System.out.println(nutnummap);
        model.addAttribute("results", resultList);
		System.out.println("당신의 점수는: "+(int)Math.ceil(total_result));
		model.addAttribute("totalresult", (int)Math.ceil(total_result));
    	return "test1";
    }
}
