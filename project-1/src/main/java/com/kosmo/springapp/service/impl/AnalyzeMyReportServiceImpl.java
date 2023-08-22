package com.kosmo.springapp.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.analyze.model.AnalyzeResultDTO;
import com.kosmo.springapp.analyze.model.AnalyzeResultListDTO;
import com.kosmo.springapp.analyze.model.NutrientDTO;
import com.kosmo.springapp.analyze.service.impl.AnalyzeServiceImpl;
import com.kosmo.springapp.model.AnalyzeReportDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.NutIntakeDTO;
import com.kosmo.springapp.service.AnalyzeMyReportMapper;

@Service
public class AnalyzeMyReportServiceImpl {

	@Autowired
	AnalyzeMyReportMapper analyzeMyReportMapper;
	@Autowired
	AnalyzeServiceImpl analyzeService;
	public AnalyzeResultListDTO analyzeMyReportM(Map map) {
		
		// 필수 영양소(비타민 등)을 담기 위한 리스트(모든 필수 영양소, 현재 섭취중인 필수 영양소, 섭취가 필요한 필수 영양소)
		List<String> nutrient_list = analyzeMyReportMapper.selectNutrient_list();
		List<String> nutrient_list_report = new ArrayList<String>();
		List<String> nutrient_list_no_report = new ArrayList<String>(nutrient_list);
		List<String> nuts = analyzeService.nutrientList();
		Pattern cappattern = Pattern.compile("[0-9.]{1,}");
		List<AnalyzeResultDTO> analyzeResultDTOs = new ArrayList<AnalyzeResultDTO>();
		AnalyzeResultListDTO analyzeResultListDTO = new AnalyzeResultListDTO();
		List<String> takePurposes = ((List)map.get("takePurpose"));
		Map<String,String> nutnummap = new HashMap<>();
		Map<String,String> map2 = new HashMap<>();
		int nutrient_score = 0;
		int ingredient_score = 0;
		float total_result = 0;
		String Nuts = "";
		String DRIUnit = "";
		String ULUnit = "";
        float NutNumbers = 0.0f;
        float DRI = 0.0f;
        float UL = 0.0f;
        List<NutIntakeDTO> nutIntakeDTOs = new ArrayList<>();
		int ingsize = takePurposes.size();
		List<String> takeFoods = ((List)map.get("takeFood"));//사용자가 복용중인 건기식
		
		for(String takePurpose : takePurposes) {//복용 목적을 하나씩 비교
			boolean ing = false;
			ingsize--;
			AnalyzeResultDTO analyzeResultDTO = new AnalyzeResultDTO();
			List<String> foodList = analyzeMyReportMapper.selectFoodListForMyTakePurpose(takePurpose);//사용자의 복용 목적을 위해 필요한 영양소
			System.out.println("사용자의 복용 목적["+takePurpose+"]을 위해 필요한 영양소 : " + foodList);
			List<String> ingredient_list_no_report = new ArrayList<String>(foodList);
			System.out.println("사용자가 복용중인 건기식 : "+ takeFoods);
			Map<String,List> foodForHelpPurpose = new HashMap<>();
			for(String takeFood : takeFoods) {//사용자가 복용중인 건기식들을 하나씩 비교
				List<String> myfoodList = analyzeMyReportMapper.selectMyFoodList(takeFood);//사용자가 복용중인 건기식에 들어있는 것들
				System.out.println("사용자가 복용중인 건기식("+ takeFood +") 에 들어있는 것들 : "+myfoodList);
				List<String> ingredient_list = new ArrayList<String>(foodList);//사용자가 복용중인 건기식의 기능성 영양소를 담을 리스트(복용 목적을 위해 필요한 모든 기능성 영양소, 사용자가 복용중인 건기식의 기능성 영양소, 사용자가 먹지 않고 있는 기능성 영양소)
				List<String> ingredient_list_report = new ArrayList<String>();
				for(String foods : myfoodList) {
					List<String> food = Arrays.asList(foods.split("\\$")).stream().map(item-> item.trim()).toList();//문자열을 구분 -> 리스트에 담음
					for(String item : food) {//들어있는 성분 하나를 들고옴-> 공백 제거
						item = item.replaceAll("\\s","");
						for(String ingredient : ingredient_list) {//기능성 영양소에서 하나 가져옴
							if(item.contains(ingredient)) {//복용목적을 위한 올바른 기능영 영양소라면
								ingredient_list_no_report.remove(ingredient);
								ingredient_list_report.add(ingredient);
								ing = true;
							}
						}
						for(String nutrient : nutrient_list) {//필수 영양소에서 하나를 가져옴 -> 모든 건기식에 대해 수행해야 한다
							
							if(nutrient.contains(item)) {//필수 비타민을 섭취 중이라면
								if(!nutrient_list_report.contains(nutrient)) { // 중복 제거
									nutrient_list_no_report.remove(nutrient);
									nutrient_list_report.add(nutrient);	
								}
							}
						}///////////
					}
				}
				//건기식 for 중
				// 이번 건기식에서 사용자의 복용 목적에 도움되는 기능성 영양소들 -> 있을 시에 추가 //1. 있을 시 -> 건기식 이름 저장 -> 없을 시 계속
				if(ingredient_list_report.size() != 0) {
					foodForHelpPurpose.put(takeFood, ingredient_list_report);
					ingredient_score += ingredient_list_report.size();
				}
			}
			analyzeResultDTO.setTakePurpose(takePurpose);// 복용 목적
			analyzeResultDTO.setFoodForHelpPurpose(foodForHelpPurpose);//(있을경우)건기식 이름,건기식에서 사용자의 복용 목적에 도움되는 기능성 영양소List
			analyzeResultDTO.setIngredient_list_no_report(ingredient_list_no_report);//사용자가 먹는 건기식에서 나오지 않은 복용목적에 필요한 기능성 영양소 - 섭취가 필요한
			analyzeResultDTO.setFoodList(foodList);//사용자가 복용 목적을 위해 필요한 영양소들
			analyzeResultDTOs.add(analyzeResultDTO);
		
			if(ing) {
				ingsize +=1;
			}
			//1. 
		}
		for(String takeFood : takeFoods) {
			FunctionalFoodListDTO listOne = analyzeService.selectFoodOneByName(takeFood);
			for (String nut : nuts){//위에 저장된 28가지 영양소 만큼 for문
	            String listpattern = nut + "[^0-9.]*([0-9.]+)";//영양소 이름 다음에 나오는 숫자 또는 (.) 까지를 무시하고 숫자와.만 가져온다
	            Pattern listregex = Pattern.compile(listpattern);
	            Matcher listmatcher = listregex.matcher(listOne.getStandard());//건기식 정보를 가져올때 비타민 C 같은 경우가 있어 띄워쓰기를 없애는 용도
	            if(listmatcher.find()) {//남자 28가지영양소 점수 부여
	                String nutNumber = listmatcher.group(1);//건기식에 저장된 영양소량 확인용
	                nutnummap.put(nut,nutNumber);
	            	if(map2.containsKey(nut)) {
	                    float map2num = Float.parseFloat(map2.get(nut).toString());
	                    float nutnum = Float.parseFloat(nutnummap.get(nut).toString());
	                    float resultmap = map2num+nutnum;
	            		nutnummap.replace(nut,Float.toString(resultmap));
	            		nutNumber = Float.toString(resultmap);
	            	}
	            }
            	map2.putAll(nutnummap);
			}//////////////////////////////////////////
		}
		for(Map.Entry<String, String> entry : map2.entrySet()) {
			String nut = entry.getKey();
            String nutNumber = entry.getValue();
			NutrientDTO nutdto = analyzeService.findNutrientByName(nut);//현재 영양소에 해당하는 정보를 가져온다(서브네임과 비교한다)
			Matcher DMmatcher = cappattern.matcher(nutdto.getN_DRI_M());
	        NutIntakeDTO nutIntakeDTO = new NutIntakeDTO();

        	if(DMmatcher.find()) {
        		if(nutdto.getN_UL_M() != null) {//상한 섭취량 존재유무 판단
        			Matcher UMmatcher = cappattern.matcher(nutdto.getN_UL_M());
        			if(UMmatcher.find()) {
        				if(Float.parseFloat(DMmatcher.group(0)) > Float.parseFloat(nutNumber)) {
            				total_result += 1.3;
            				/*String result = "<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_M()+" ~ "+nutdto.getN_UL_M()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
            						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DMmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right:2px dotted black\"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\"></progress>\r\n"
            						+ "	</div><div style=\"text-align: center;\">"+"<span style='color:#0033FF;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
            				System.out.println(result);
            				resultList.add(result);*/
            				Nuts = nut;
            				NutNumbers = Float.parseFloat(nutNumber);
            				DRI = Float.parseFloat(DMmatcher.group(0));
            				UL=Float.parseFloat(UMmatcher.group(0));
            				DRIUnit=nutdto.getN_DRI_M();
            				ULUnit=nutdto.getN_UL_M();
            				nutIntakeDTO.setNut(Nuts);
            		        nutIntakeDTO.setNutNumber(NutNumbers);
            		        nutIntakeDTO.setDRI(DRI);
            		        nutIntakeDTO.setUL(UL);
            		        nutIntakeDTO.setDRIUnit(DRIUnit);
            		        nutIntakeDTO.setULUnit(ULUnit);
            		        nutIntakeDTOs.add(nutIntakeDTO);
            			}//권장 섭취량 보다 조금 먹었을 경우 1.5점 추가
            			else if(Float.parseFloat(DMmatcher.group(0)) <= Float.parseFloat(nutNumber) &&
            					Float.parseFloat(UMmatcher.group(0)) > Float.parseFloat(nutNumber)) {
            				total_result += 1.8;
            				/*String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_M()+" ~ "+nutdto.getN_UL_M()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
            						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DMmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+UMmatcher.group(0)+"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\"></progress>\r\n"
            						+ "	</div><div style=\"text-align: center;\">"+"<span style='color:#33CC33;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
            				System.out.println(result);
            				resultList.add(result);*/
            				Nuts = nut;
            				NutNumbers = Float.parseFloat(nutNumber);
            				DRI = Float.parseFloat(DMmatcher.group(0));
            				UL=Float.parseFloat(UMmatcher.group(0));
            				DRIUnit=nutdto.getN_DRI_M();
            				ULUnit=nutdto.getN_UL_M();
            				nutIntakeDTO.setNut(Nuts);
            		        nutIntakeDTO.setNutNumber(NutNumbers);
            		        nutIntakeDTO.setDRI(DRI);
            		        nutIntakeDTO.setUL(UL);
            		        nutIntakeDTO.setDRIUnit(DRIUnit);
            		        nutIntakeDTO.setULUnit(ULUnit);
            		        nutIntakeDTOs.add(nutIntakeDTO);
            			}//권장 섭취량과 상한 섭취량 사이로 먹었을 경우 2.5점 추가
            			else {
            				total_result += 1.5;
            				/*float UM2 = Float.parseFloat(UMmatcher.group(0))*2;
            				float UM = Float.parseFloat(nutNumber)-Float.parseFloat(UMmatcher.group(0));
            				String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_M()+" ~ "+nutdto.getN_UL_M()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
            						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DMmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+UMmatcher.group(0)+"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\" value="+UM+" max="+UM2+"></progress>\r\n"
            						+ "	</div><div style=\"text-align: center;\">"+"<span style='color:#FF0000;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
            				System.out.println(result);
            				resultList.add(result);*/
            				Nuts = nut;
            				NutNumbers = Float.parseFloat(nutNumber);
            				DRI = Float.parseFloat(DMmatcher.group(0));
            				UL=Float.parseFloat(UMmatcher.group(0));
            				DRIUnit=nutdto.getN_DRI_M();
            				ULUnit=nutdto.getN_UL_M();
            				nutIntakeDTO.setNut(Nuts);
            		        nutIntakeDTO.setNutNumber(NutNumbers);
            		        nutIntakeDTO.setDRI(DRI);
            		        nutIntakeDTO.setUL(UL);
            		        nutIntakeDTO.setDRIUnit(DRIUnit);
            		        nutIntakeDTO.setULUnit(ULUnit);
            		        nutIntakeDTOs.add(nutIntakeDTO);
            			}//상한섭취량보다 많이 먹었을 경우 2점추가
        			}//UMmatcher확인용
        		}//if(nutdto.getN_UL_F() != null) 끝(상한 섭취량이 존재함)
        		else {
        			if(Float.parseFloat(DMmatcher.group(0)) > Float.parseFloat(nutNumber)){
        				total_result += 1.3;
        				/*String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_M()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
        						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DMmatcher.group(0)+"></progress><progress id=\"myProgress1\"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\"></progress>\r\n"
        						+ "	</div><div style=\"text-align: center; width: 900px\">"+"<span style='color:#0033FF;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
        				System.out.println(result);
        				resultList.add(result);*/
        				Nuts = nut;
        				NutNumbers = Float.parseFloat(nutNumber);
        				DRI = Float.parseFloat(DMmatcher.group(0));
        				UL=0.0f;
        				DRIUnit=nutdto.getN_DRI_M();
        				ULUnit="";
        				nutIntakeDTO.setNut(Nuts);
        		        nutIntakeDTO.setNutNumber(NutNumbers);
        		        nutIntakeDTO.setDRI(DRI);
        		        nutIntakeDTO.setUL(UL);
        		        nutIntakeDTO.setDRIUnit(DRIUnit);
        		        nutIntakeDTO.setULUnit(ULUnit);
        		        nutIntakeDTOs.add(nutIntakeDTO);
        			}//상한 섭취량이 없고 권장서취량보다 적게 먹었을 경우 1.5점 추가
        			else if(Float.parseFloat(DMmatcher.group(0)) <= Float.parseFloat(nutNumber)){
        				total_result += 1.8;
        				/*float DM3=Float.parseFloat(DMmatcher.group(0))*10;
        				String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_M()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
        						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DMmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right: 1px solid black;width:600px;\" value="+nutNumber+" max="+DM3+">\r\n"
        						+ "	</div><div style=\"text-align: center; width: 900px\">"+"<span style='color:#33CC33;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
        				System.out.println(result);
        				resultList.add(result);*/
        				Nuts = nut;
        				NutNumbers = Float.parseFloat(nutNumber);
        				DRI = Float.parseFloat(DMmatcher.group(0));
        				UL=0.0f;
        				DRIUnit=nutdto.getN_DRI_M();
        				ULUnit="";
        				nutIntakeDTO.setNut(Nuts);
        		        nutIntakeDTO.setNutNumber(NutNumbers);
        		        nutIntakeDTO.setDRI(DRI);
        		        nutIntakeDTO.setUL(UL);
        		        nutIntakeDTO.setDRIUnit(DRIUnit);
        		        nutIntakeDTO.setULUnit(ULUnit);
        		        nutIntakeDTOs.add(nutIntakeDTO);
        			}//상한섭취량이 없고 권장섭취량 보다 많이먹었을 경우 2.5점추가
        		}//if(nutdto.getN_UL_M() != null) else문 끝(상한 섭취량이 없는 경우)
    		}//DMmatcher확인용
		}
		analyzeResultListDTO.setNutIntakeDTOs(nutIntakeDTOs);
		analyzeResultListDTO.setListdto(analyzeResultDTOs);
		analyzeResultListDTO.setNutrient_list_report(nutrient_list_report);
		analyzeResultListDTO.setNutrient_list_no_report(nutrient_list_no_report);
		//analyzeResultListDTO.setNutnumlist(resultList);
		//최종 점수 구하기
		nutrient_score = nutrient_list_report.size() *3 / takePurposes.size();
		System.out.println(nutnummap);
		System.out.println(takePurposes.size());
		System.out.println(total_result);
		float resultScore = (50/takePurposes.size())*ingsize + total_result;//nutrient_score;
		if(resultScore >= 100) {
			resultScore = 100;
		}
		analyzeResultListDTO.setResultScore((int)Math.ceil(resultScore));
		analyzeResultListDTO.setIngredientCount(((List)map.get("takeFood")).size());
		return analyzeResultListDTO;
	}
	
	public AnalyzeResultListDTO analyzeMyReportF(Map map) {
		
		// 필수 영양소(비타민 등)을 담기 위한 리스트(모든 필수 영양소, 현재 섭취중인 필수 영양소, 섭취가 필요한 필수 영양소)
		List<String> nutrient_list = analyzeMyReportMapper.selectNutrient_list();
		List<String> nutrient_list_report = new ArrayList<String>();
		List<String> nutrient_list_no_report = new ArrayList<String>(nutrient_list);
		List<String> nuts = analyzeService.nutrientList();
		List<String> resultList = new ArrayList<>();
		Pattern cappattern = Pattern.compile("[0-9.]{1,}");
		List<AnalyzeResultDTO> analyzeResultDTOs = new ArrayList<AnalyzeResultDTO>();
		AnalyzeResultListDTO analyzeResultListDTO = new AnalyzeResultListDTO();
		List<String> takePurposes = ((List)map.get("takePurpose"));
		Map<String,String> nutnummap = new HashMap<>();
		Map<String,String> map2 = new HashMap<>();
		int nutrient_score = 0;
		int ingredient_score = 0;
		float total_result = 0;
		String Nuts = "";
		String DRIUnit = "";
		String ULUnit = "";
        float NutNumbers = 0.0f;
        float DRI = 0.0f;
        float UL = 0.0f;
        List<NutIntakeDTO> nutIntakeDTOs = new ArrayList<>();
		int ingsize = takePurposes.size();
		List<String> takeFoods = ((List)map.get("takeFood"));//사용자가 복용중인 건기식
		
		for(String takePurpose : takePurposes) {//복용 목적을 하나씩 비교
			boolean ing = false;
			ingsize--;
			AnalyzeResultDTO analyzeResultDTO = new AnalyzeResultDTO();
			List<String> foodList = analyzeMyReportMapper.selectFoodListForMyTakePurpose(takePurpose);//사용자의 복용 목적을 위해 필요한 영양소
			System.out.println("사용자의 복용 목적["+takePurpose+"]을 위해 필요한 영양소 : " + foodList);
			List<String> ingredient_list_no_report = new ArrayList<String>(foodList);
			System.out.println("사용자가 복용중인 건기식 : "+ takeFoods);
			Map<String,List> foodForHelpPurpose = new HashMap<>();
			for(String takeFood : takeFoods) {//사용자가 복용중인 건기식들을 하나씩 비교
				List<String> myfoodList = analyzeMyReportMapper.selectMyFoodList(takeFood);//사용자가 복용중인 건기식에 들어있는 것들
				System.out.println("사용자가 복용중인 건기식("+ takeFood +") 에 들어있는 것들 : "+myfoodList);
				List<String> ingredient_list = new ArrayList<String>(foodList);//사용자가 복용중인 건기식의 기능성 영양소를 담을 리스트(복용 목적을 위해 필요한 모든 기능성 영양소, 사용자가 복용중인 건기식의 기능성 영양소, 사용자가 먹지 않고 있는 기능성 영양소)
				List<String> ingredient_list_report = new ArrayList<String>();
				for(String foods : myfoodList) {
					List<String> food = Arrays.asList(foods.split("\\$")).stream().map(item-> item.trim()).toList();//문자열을 구분 -> 리스트에 담음
					for(String item : food) {//들어있는 성분 하나를 들고옴-> 공백 제거
						item = item.replaceAll("\\s","");
						for(String ingredient : ingredient_list) {//기능성 영양소에서 하나 가져옴
							if(item.contains(ingredient)) {//복용목적을 위한 올바른 기능영 영양소라면
								ingredient_list_no_report.remove(ingredient);
								ingredient_list_report.add(ingredient);
								ing = true;
							}
						}
						for(String nutrient : nutrient_list) {//필수 영양소에서 하나를 가져옴 -> 모든 건기식에 대해 수행해야 한다
							
							if(nutrient.contains(item)) {//필수 비타민을 섭취 중이라면
								if(!nutrient_list_report.contains(nutrient)) { // 중복 제거
									nutrient_list_no_report.remove(nutrient);
									nutrient_list_report.add(nutrient);	
								}
							}
						}///////////
					}
				}
				//건기식 for 중
				// 이번 건기식에서 사용자의 복용 목적에 도움되는 기능성 영양소들 -> 있을 시에 추가 //1. 있을 시 -> 건기식 이름 저장 -> 없을 시 계속
				if(ingredient_list_report.size() != 0) {
					foodForHelpPurpose.put(takeFood, ingredient_list_report);
					ingredient_score += ingredient_list_report.size();
				}
			}
			analyzeResultDTO.setTakePurpose(takePurpose);// 복용 목적
			analyzeResultDTO.setFoodForHelpPurpose(foodForHelpPurpose);//(있을경우)건기식 이름,건기식에서 사용자의 복용 목적에 도움되는 기능성 영양소List
			analyzeResultDTO.setIngredient_list_no_report(ingredient_list_no_report);//사용자가 먹는 건기식에서 나오지 않은 복용목적에 필요한 기능성 영양소 - 섭취가 필요한
			analyzeResultDTO.setFoodList(foodList);//사용자가 복용 목적을 위해 필요한 영양소들
			analyzeResultDTOs.add(analyzeResultDTO);
		
			if(ing) {
				ingsize +=1;
			}
			//1. 
		}
		for(String takeFood : takeFoods) {
			FunctionalFoodListDTO listOne = analyzeService.selectFoodOneByName(takeFood);
			for (String nut : nuts){//위에 저장된 28가지 영양소 만큼 for문
	            String listpattern = nut + "[^0-9.]*([0-9.]+)";//영양소 이름 다음에 나오는 숫자 또는 (.) 까지를 무시하고 숫자와.만 가져온다
	            Pattern listregex = Pattern.compile(listpattern);
	            Matcher listmatcher = listregex.matcher(listOne.getStandard());//건기식 정보를 가져올때 비타민 C 같은 경우가 있어 띄워쓰기를 없애는 용도
	            if(listmatcher.find()) {//남자 28가지영양소 점수 부여
	                String nutNumber = listmatcher.group(1);//건기식에 저장된 영양소량 확인용
	                nutnummap.put(nut,nutNumber);
	    	        System.out.println(nut+" : "+nutNumber);
	            	if(map2.containsKey(nut)) {
	                    float map2num = Float.parseFloat(map2.get(nut).toString());
	                    float nutnum = Float.parseFloat(nutnummap.get(nut).toString());
	                    float resultmap = map2num+nutnum;
	            		nutnummap.replace(nut,Float.toString(resultmap));
	            		nutNumber = Float.toString(resultmap);
	            	}
	            }
            	map2.putAll(nutnummap);
			}//////////////////////////////////////////
		}
		for(Map.Entry<String, String> entry : map2.entrySet()) {
			String nut = entry.getKey();
            String nutNumber = entry.getValue();
			NutrientDTO nutdto = analyzeService.findNutrientByName(nut);//현재 영양소에 해당하는 정보를 가져온다(서브네임과 비교한다)
			Matcher DFmatcher = cappattern.matcher(nutdto.getN_DRI_F());
	        NutIntakeDTO nutIntakeDTO = new NutIntakeDTO();
        	if(DFmatcher.find()) {
        		if(nutdto.getN_UL_F() != null) {//상한 섭취량 존재유무 판단
        			Matcher UFmatcher = cappattern.matcher(nutdto.getN_UL_F());
        			if(UFmatcher.find()) {
        				if(Float.parseFloat(DFmatcher.group(0)) > Float.parseFloat(nutNumber)) {
            				total_result += 1.3;
            				/*String result = "<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_F()+" ~ "+nutdto.getN_UL_F()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
            						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DFmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right:2px dotted black\"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\"></progress>\r\n"
            						+ "	</div><div style=\"text-align: center;\">"+"<span style='color:#0033FF;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
            				System.out.println(result);
            				resultList.add(result);*/
            				Nuts = nut;
            				NutNumbers = Float.parseFloat(nutNumber);
            				DRI = Float.parseFloat(DFmatcher.group(0));
            				UL=Float.parseFloat(UFmatcher.group(0));
            				DRIUnit=nutdto.getN_DRI_F();
            				ULUnit=nutdto.getN_UL_F();
            				nutIntakeDTO.setNut(Nuts);
            		        nutIntakeDTO.setNutNumber(NutNumbers);
            		        nutIntakeDTO.setDRI(DRI);
            		        nutIntakeDTO.setUL(UL);
            		        nutIntakeDTO.setDRIUnit(DRIUnit);
            		        nutIntakeDTO.setULUnit(ULUnit);
            		        nutIntakeDTOs.add(nutIntakeDTO);
            			}//권장 섭취량 보다 조금 먹었을 경우 1.5점 추가
            			else if(Float.parseFloat(DFmatcher.group(0)) <= Float.parseFloat(nutNumber) &&
            					Float.parseFloat(UFmatcher.group(0)) > Float.parseFloat(nutNumber)) {
            				total_result += 1.8;
            				/*String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_F()+" ~ "+nutdto.getN_UL_F()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
            						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DFmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+UFmatcher.group(0)+"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\"></progress>\r\n"
            						+ "	</div><div style=\"text-align: center;\">"+"<span style='color:#33CC33;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
            				System.out.println(result);
            				resultList.add(result);*/
            				Nuts = nut;
            				NutNumbers = Float.parseFloat(nutNumber);
            				DRI = Float.parseFloat(DFmatcher.group(0));
            				UL=Float.parseFloat(UFmatcher.group(0));
            				DRIUnit=nutdto.getN_DRI_F();
            				ULUnit=nutdto.getN_UL_F();
            				nutIntakeDTO.setNut(Nuts);
            		        nutIntakeDTO.setNutNumber(NutNumbers);
            		        nutIntakeDTO.setDRI(DRI);
            		        nutIntakeDTO.setUL(UL);
            		        nutIntakeDTO.setDRIUnit(DRIUnit);
            		        nutIntakeDTO.setULUnit(ULUnit);
            		        nutIntakeDTOs.add(nutIntakeDTO);
            			}//권장 섭취량과 상한 섭취량 사이로 먹었을 경우 2.5점 추가
            			else {
            				total_result += 1.5;
            				/*float UM2 = Float.parseFloat(UFmatcher.group(0))*2;
            				float UM = Float.parseFloat(nutNumber)-Float.parseFloat(UFmatcher.group(0));
            				String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_F()+" ~ "+nutdto.getN_UL_F()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
            						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DFmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+UFmatcher.group(0)+"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\" value="+UM+" max="+UM2+"></progress>\r\n"
            						+ "	</div><div style=\"text-align: center;\">"+"<span style='color:#FF0000;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
            				System.out.println(result);
            				resultList.add(result);*/
            				Nuts = nut;
            				NutNumbers = Float.parseFloat(nutNumber);
            				DRI = Float.parseFloat(DFmatcher.group(0));
            				UL=Float.parseFloat(UFmatcher.group(0));
            				DRIUnit=nutdto.getN_DRI_F();
            				ULUnit=nutdto.getN_UL_F();
            				nutIntakeDTO.setNut(Nuts);
            		        nutIntakeDTO.setNutNumber(NutNumbers);
            		        nutIntakeDTO.setDRI(DRI);
            		        nutIntakeDTO.setUL(UL);
            		        nutIntakeDTO.setDRIUnit(DRIUnit);
            		        nutIntakeDTO.setULUnit(ULUnit);
            		        nutIntakeDTOs.add(nutIntakeDTO);
            			}//상한섭취량보다 많이 먹었을 경우 2점추가
        			}//UFmatcher확인용
        		}//if(nutdto.getN_UL_F() != null) 끝(상한 섭취량이 존재함)
        		else {
        			if(Float.parseFloat(DFmatcher.group(0)) > Float.parseFloat(nutNumber)){
        				total_result += 1.3;
        				/*String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_F()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
        						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DFmatcher.group(0)+"></progress><progress id=\"myProgress1\"></progress><progress id=\"myProgress2\" style=\"border-right: 1px solid black;\"></progress>\r\n"
        						+ "	</div><div style=\"text-align: center; width: 900px\">"+"<span style='color:#0033FF;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
        				System.out.println(result);
        				resultList.add(result);*/
        				Nuts = nut;
        				NutNumbers = Float.parseFloat(nutNumber);
        				DRI = Float.parseFloat(DFmatcher.group(0));
        				UL=0.0f;
        				DRIUnit=nutdto.getN_DRI_F();
        				ULUnit="";
        				nutIntakeDTO.setNut(Nuts);
        		        nutIntakeDTO.setNutNumber(NutNumbers);
        		        nutIntakeDTO.setDRI(DRI);
        		        nutIntakeDTO.setUL(UL);
        		        nutIntakeDTO.setDRIUnit(DRIUnit);
        		        nutIntakeDTO.setULUnit(ULUnit);
        		        nutIntakeDTOs.add(nutIntakeDTO);
        			}//상한 섭취량이 없고 권장서취량보다 적게 먹었을 경우 1.5점 추가
        			else if(Float.parseFloat(DFmatcher.group(0)) <= Float.parseFloat(nutNumber)){
        				total_result += 1.8;
        				/*float DM3=Float.parseFloat(DFmatcher.group(0))*10;
        				String result ="<div style=\"border: 2px solid #000; padding: 10px; border-radius: 10px;\"><div style=\"text-align: center;\">"+nut+"의 적정 섭취량</div><div style=\"text-align: center;\">"+nutdto.getN_DRI_F()+"</div><div class=\"progress-container\" style=\"white-space: nowrap;\">\r\n"
        						+ "	  <progress id=\"myProgress\" style=\"border-right:2px dotted black\" value="+nutNumber+" max="+DFmatcher.group(0)+"></progress><progress id=\"myProgress1\" style=\"border-right: 1px solid black;width:600px;\" value="+nutNumber+" max="+DM3+">\r\n"
        						+ "	</div><div style=\"text-align: center; width: 900px\">"+"<span style='color:#33CC33;'>"+nutNumber+"</span> 만큼 드시고 계십니다</div>"+"</div><br/>";
        				System.out.println(result);
        				resultList.add(result);*/
        				Nuts = nut;
        				NutNumbers = Float.parseFloat(nutNumber);
        				DRI = Float.parseFloat(DFmatcher.group(0));
        				UL=0.0f;
        				DRIUnit=nutdto.getN_DRI_F();
        				ULUnit="";
        				nutIntakeDTO.setNut(Nuts);
        		        nutIntakeDTO.setNutNumber(NutNumbers);
        		        nutIntakeDTO.setDRI(DRI);
        		        nutIntakeDTO.setUL(UL);
        		        nutIntakeDTO.setDRIUnit(DRIUnit);
        		        nutIntakeDTO.setULUnit(ULUnit);
        		        nutIntakeDTOs.add(nutIntakeDTO);
        			}//상한섭취량이 없고 권장섭취량 보다 많이먹었을 경우 2.5점추가
        		}//if(nutdto.getN_UL_F() != null) else문 끝(상한 섭취량이 없는 경우)
    		}//DFmatcher확인용
		}
		analyzeResultListDTO.setNutIntakeDTOs(nutIntakeDTOs);
		analyzeResultListDTO.setListdto(analyzeResultDTOs);
		analyzeResultListDTO.setNutrient_list_report(nutrient_list_report);
		analyzeResultListDTO.setNutrient_list_no_report(nutrient_list_no_report);
		//analyzeResultListDTO.setNutnumlist(resultList);
		//최종 점수 구하기
		nutrient_score = nutrient_list_report.size() *3 / takePurposes.size();
		System.out.println(nutnummap);
		System.out.println(takePurposes.size());
		System.out.println(total_result);
		float resultScore = (50/takePurposes.size())*ingsize + total_result;//nutrient_score;
		if(resultScore >= 100) {
			resultScore = 100;
		}
		analyzeResultListDTO.setResultScore((int)Math.ceil(resultScore));
		analyzeResultListDTO.setIngredientCount(((List)map.get("takeFood")).size());
		return analyzeResultListDTO;
	}
	
	public int saveAnalyzeReport(String id, List<String> takeList, List<String> foodList,int score) {
		AnalyzeReportDTO analyzeReportDTO = new AnalyzeReportDTO();
		analyzeReportDTO.setUserId(id);
		analyzeReportDTO.setTakePurposes(takeList.toString());
		analyzeReportDTO.setTakeFoods(foodList.toString());
		analyzeReportDTO.setScore(score);
		return analyzeMyReportMapper.saveAnalyzeReport(analyzeReportDTO);
	}

	public AnalyzeReportDTO selectAnalyzeReport(String id) {
		return analyzeMyReportMapper.selectAnalyzeReport(id);
	}

	public List<AnalyzeReportDTO> selectAnalyzeReportAll(String id) {
		return analyzeMyReportMapper.selectAnalyzeReportAll(id);
	}

	public int deleteAnalyzeReport(int analyzeno) {
		return analyzeMyReportMapper.deleteAnalyzeReport(analyzeno);
	}
	
	public int selectAnalyzeReportCount(String id) {
		return analyzeMyReportMapper.selectAnalyzeReportCount(id);
	}
}
