package com.kosmo.springapp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.springapp.model.AllFoodDTO;
import com.kosmo.springapp.model.AvgStarScoreCountDTO;
import com.kosmo.springapp.model.FunctionalFoodListDTO;
import com.kosmo.springapp.model.MemberDTO;
import com.kosmo.springapp.model.UserInfoDTO;
import com.kosmo.springapp.service.impl.LoginServiceImpl;
import com.kosmo.springapp.service.impl.SelectFoodServiceImpl;
@Controller
public class SelectFoodRankListController {
	@Autowired
	SelectFoodServiceImpl selectfoodservice;

	@Autowired
	 private LoginServiceImpl loginService;
	
	@GetMapping("/ranking/selectfoodcompany.do")
	public String foodcompany(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",3);
		return "ranking/FoodRank";
	}

	@GetMapping("/functionfood/selectissue.do")
    public String hselectissue2(Model models,HttpServletRequest req,HttpServletResponse resp) throws IOException, TasteException {
        List<FunctionalFoodListDTO> list1 = new ArrayList<>();
		MemberDTO memberDto = loginService.selectOne(req);
		Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        System.out.println((int)currentYear - Integer.parseInt(memberDto.getBirth().substring(0, 4)));
        int age = (int)currentYear - Integer.parseInt(memberDto.getBirth().substring(0, 4));
        int ages = age - (age %10);
        System.out.println(ages);
        if(ages >60) {
        	ages = 60;
        }
        // 모델 로드 또는 생성
        DataModel model = new FileDataModel(new File("src/main/resources/static/Data/random_rating.csv"));

        UserSimilarity similarity = new EuclideanDistanceSimilarity(model);
        UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, model);
        UserBasedRecommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
        List<RecommendedItem> recommendations = recommender.recommend(ages, 5); // 사용자 20에게 5개의 추천 아이템 가져오기
        System.out.println("Recommendations for user "+ages+"대 추천");
        for (RecommendedItem recommendation : recommendations) {
            System.out.println(recommendation);
            list1.addAll(selectfoodservice.RecommendationFood(Long.toString(recommendation.getItemID())));
        }
        models.addAttribute("listData", list1);
        models.addAttribute("ages", ages);
        return "test1";
    }
	
	@GetMapping("/food/foodsearch.do")
	public String foodsearch(String food,Model model,HttpServletRequest req,HttpServletResponse resp) {
		List<AllFoodDTO> foodlist = selectfoodservice.FoodSearch(food);
		MemberDTO memberDto = loginService.selectOne(req);
		String ID = memberDto.getId();
		UserInfoDTO userinfo = selectfoodservice.userinfo(ID);
		model.addAttribute("foodlist", foodlist);
		if(userinfo != null) {
			model.addAttribute("dailyCalories", userinfo.getKcal());
		    model.addAttribute("Prorate", userinfo.getProrate());
		    model.addAttribute("Cbhrate", userinfo.getCbhrate());
		    model.addAttribute("Fatrate", userinfo.getFatrate());
		}
		return "test2";
	}
	
	@PostMapping("/food/userinfo.do")
	public String userinfo( HttpServletRequest req,
							HttpServletResponse resp,
							@RequestParam float Height,
							@RequestParam float age,
							@RequestParam float Weight,
							@RequestParam float Fatrate,
							@RequestParam float Prorate,
							@RequestParam float Cbhrate,
							@RequestParam int healthIssueSelect,
							Model model
							) {
		float activityMultiplier= 0;
		System.out.println(req);
		MemberDTO memberDto = loginService.selectOne(req);
		System.out.println(memberDto.getId());
	    // 남성일 경우의 BMR 계산식을 사용
	    float bmr = (float) (88.362 + (13.397 * Weight) + (4.799 * Height) - (5.677 * age));
	    // 활동 대사율 곱하기 (여기서는 예시로 '보통 활동' 계수 사용)
	    if(healthIssueSelect==1){
	    	activityMultiplier = (float) 1.2;
	    }
	    else if(healthIssueSelect==2){
	    	activityMultiplier = (float) 1.375;
	    }
	    else if(healthIssueSelect==3){
	    	activityMultiplier = (float) 1.55;
	    }
	    else if(healthIssueSelect==4){
	    	activityMultiplier = (float) 1.725;
	    }
	    else if(healthIssueSelect==5){
	    	activityMultiplier = (float) 1.9;
	    }
	    float dailyCalories = bmr * activityMultiplier;
	    model.addAttribute("dailyCalories", dailyCalories);
	    model.addAttribute("Prorate", Prorate);
	    model.addAttribute("Cbhrate", Cbhrate);
	    model.addAttribute("Fatrate", Fatrate);
	    String CHUSIN = selectfoodservice.checkUserinfo(memberDto.getId());
	    if(CHUSIN == null) {
	    	selectfoodservice.newUserinfo(Fatrate, Prorate, Cbhrate, healthIssueSelect, dailyCalories,memberDto.getId());
	    }
	    else{
	    	selectfoodservice.updateUserinfo(Fatrate, Prorate, Cbhrate, healthIssueSelect, dailyCalories, memberDto.getId());
	    }
	    // 계산된 칼로리 출력
		return "test2";
	}
	
	@GetMapping("/food/intakefood.do")
	public String intakefood(String no,String re,Model model,HttpServletRequest req,HttpServletResponse resp) {
		Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
        String formatDate = dateFormat.format(currentDate);
		MemberDTO memberDto = loginService.selectOne(req);
		int nowYear = LocalDate.now().getYear();
		float calorie = 0;
		float protein= 0;
		float fat= 0;
		float carbohydrate= 0;
		float sugar= 0;
		float dietaryfiber= 0;
		float saturatedfat= 0;
		float unsaturatedfat= 0;
		float cholesterol= 0;
		float sodium= 0;
		float transfat= 0;
		String ID = memberDto.getId();
		int rep = Integer.parseInt(re);
		for (int i = 0; i < rep; i++) {
			selectfoodservice.IntakeFood(no, ID);
		}
		for(String foodno:selectfoodservice.intakeFoodNo(formatDate, ID)) {
			AllFoodDTO AFD = selectfoodservice.intakeFoodData(foodno);
			if(AFD.getCalorie() != null) {
				calorie += Float.parseFloat(AFD.getCalorie());
			}
			if(AFD.getProtein() != null) {
				protein += Float.parseFloat(AFD.getProtein());
			}
			if(AFD.getFat() != null) {
				fat += Float.parseFloat(AFD.getFat());
			}
			if(AFD.getCarbohydrate() != null) {
				carbohydrate += Float.parseFloat(AFD.getCarbohydrate());
			}
			if(AFD.getSugar() != null) {
				sugar += Float.parseFloat(AFD.getSugar());
			}
			if(AFD.getDietaryfiber() != null) {
				dietaryfiber += Float.parseFloat(AFD.getDietaryfiber());
			}
			if(AFD.getSaturatedfat() != null) {
				saturatedfat += Float.parseFloat(AFD.getSaturatedfat());
			}
			if(AFD.getUnsaturatedfat() != null) {
				unsaturatedfat += Float.parseFloat(AFD.getUnsaturatedfat());
			}
			if(AFD.getCholesterol() != null) {
				cholesterol += Float.parseFloat(AFD.getCholesterol());
			}
			if(AFD.getSodium() != null) {
				sodium += Float.parseFloat(AFD.getSodium());
			}
			if(AFD.getTransfat() != null) {
				transfat += Float.parseFloat(AFD.getTransfat());
			}
		}
		
		model.addAttribute("calorie", calorie);
		model.addAttribute("protein", protein);
		model.addAttribute("fat", fat);
		model.addAttribute("carbohydrate", carbohydrate);
		model.addAttribute("sugar", sugar);
		model.addAttribute("dietaryfiber", dietaryfiber);
		model.addAttribute("saturatedfat", saturatedfat);
		model.addAttribute("unsaturatedfat", unsaturatedfat);
		model.addAttribute("cholesterol", cholesterol);
		model.addAttribute("sodium", sodium);
		model.addAttribute("transfat", transfat);
		model.addAttribute("calorie", calorie);
		UserInfoDTO userinfo = selectfoodservice.userinfo(ID);
		float KCSCORE = 0;
		float PRSCORE = 0;
		float CBSCORE = 0;
		float FASCORE = 0;
		if(userinfo != null) {
			model.addAttribute("dailyCalories", userinfo.getKcal());
		    model.addAttribute("Prorate", userinfo.getProrate());
		    model.addAttribute("Cbhrate", userinfo.getCbhrate());
		    model.addAttribute("Fatrate", userinfo.getFatrate());
		    
		    if(userinfo.getKcal() != 0 && calorie !=0) {
		    	if(userinfo.getKcal() >= calorie) {
		    		KCSCORE = (calorie/userinfo.getKcal())*25;
		    	}
		    	else {
		    		KCSCORE = (userinfo.getKcal()/calorie)*25;
		    	}
		    }
		    
		    if(userinfo.getProrate() != 0 && protein !=0) {
		    	if(userinfo.getProrate() >= protein) {
		    		PRSCORE = (protein/userinfo.getProrate())*25;
		    	}
		    	else {
		    		PRSCORE = (userinfo.getProrate()/protein)*25;
		    	}
		    }
		    
		    if(userinfo.getCbhrate() != 0 && carbohydrate !=0) {
		    	if(userinfo.getCbhrate() >= carbohydrate) {
		    		CBSCORE = (carbohydrate/userinfo.getCbhrate())*25;
		    	}
		    	else {
		    		CBSCORE = (userinfo.getCbhrate()/carbohydrate)*25;
		    	}
		    }
		    
		    if(userinfo.getFatrate() != 0 && fat !=0) {
		    	if(userinfo.getFatrate() >= fat) {
		    		FASCORE = (fat/userinfo.getFatrate())*25;
		    	}
		    	else {
		    		FASCORE = (userinfo.getFatrate()/fat)*25;
		    	}
		    }
		}
		int TOSCORE =(int)(FASCORE + CBSCORE + PRSCORE +KCSCORE);
		System.out.println(TOSCORE);
		System.out.println(selectfoodservice.checkUserscore(ID, formatDate));
		if(selectfoodservice.checkUserscore(ID, formatDate) != null) {
			selectfoodservice.updateUserscore(ID, TOSCORE,formatDate);
		}
		else {
			selectfoodservice.newUserscore(ID, TOSCORE);
		}

		model.addAttribute("TOSCORE",TOSCORE);
		System.out.println("칼로린:"+calorie);
		System.out.println("단백질:"+protein);
		System.out.println("지방:"+fat);
		System.out.println("탄수화물:"+carbohydrate);
		System.out.println("당:"+sugar);
		System.out.println("식이섬유:"+dietaryfiber);
		System.out.println("포화지방:"+saturatedfat);
		System.out.println("뷸포화지방:"+unsaturatedfat);
		System.out.println("트랜스지방:"+transfat);
		System.out.println("콜레스테롤:"+cholesterol);
		System.out.println("나트륨:"+sodium);
		model.addAttribute("age", nowYear-Integer.parseInt(memberDto.getBirth().substring(0, 4)));
		return "test2";
	}
	@GetMapping("/food/test2.do")
	public String test2(HttpServletRequest req,HttpServletResponse resp,Model model) {
		MemberDTO memberDto = loginService.selectOne(req);
		int nowYear = LocalDate.now().getYear();
		String ID = memberDto.getId();
		UserInfoDTO userinfo = selectfoodservice.userinfo(ID);
	if(userinfo != null) {
		model.addAttribute("dailyCalories", userinfo.getKcal());
	    model.addAttribute("Prorate", userinfo.getProrate());
	    model.addAttribute("Cbhrate", userinfo.getCbhrate());
	    model.addAttribute("Fatrate", userinfo.getFatrate());
		}

		model.addAttribute("age", nowYear-Integer.parseInt(memberDto.getBirth().substring(0, 4)));
		return "test2";
	}
	@GetMapping("/food/test3.do")
	public String test3(HttpServletRequest req,HttpServletResponse resp,Model model) {
		MemberDTO memberDto = loginService.selectOne(req);
		Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
        String formatDate = dateFormat.format(currentDate);
		String ID = memberDto.getId();
		UserInfoDTO userinfo = selectfoodservice.userinfo(ID);
		List<AllFoodDTO> foodlist = new ArrayList<>();
		float calorie = 0;
		float protein= 0;
		float fat= 0;
		float carbohydrate= 0;
		float sugar= 0;
		float dietaryfiber= 0;
		float saturatedfat= 0;
		float unsaturatedfat= 0;
		float cholesterol= 0;
		float sodium= 0;
		float transfat= 0;
		if(selectfoodservice.intakeFoodNo(formatDate, ID) != null) {
			for(String foodno:selectfoodservice.intakeFoodNo(formatDate, ID)) {
				 foodlist.add(selectfoodservice.intakeFoodData(foodno));
				 AllFoodDTO AFD = selectfoodservice.intakeFoodData(foodno);
				 if(AFD.getCalorie() != null) {
						calorie += Float.parseFloat(AFD.getCalorie());
					}
					if(AFD.getProtein() != null) {
						protein += Float.parseFloat(AFD.getProtein());
					}
					if(AFD.getFat() != null) {
						fat += Float.parseFloat(AFD.getFat());
					}
					if(AFD.getCarbohydrate() != null) {
						carbohydrate += Float.parseFloat(AFD.getCarbohydrate());
					}
					if(AFD.getSugar() != null) {
						sugar += Float.parseFloat(AFD.getSugar());
					}
					if(AFD.getDietaryfiber() != null) {
						dietaryfiber += Float.parseFloat(AFD.getDietaryfiber());
					}
					if(AFD.getSaturatedfat() != null) {
						saturatedfat += Float.parseFloat(AFD.getSaturatedfat());
					}
					if(AFD.getUnsaturatedfat() != null) {
						unsaturatedfat += Float.parseFloat(AFD.getUnsaturatedfat());
					}
					if(AFD.getCholesterol() != null) {
						cholesterol += Float.parseFloat(AFD.getCholesterol());
					}
					if(AFD.getSodium() != null) {
						sodium += Float.parseFloat(AFD.getSodium());
					}
					if(AFD.getTransfat() != null) {
						transfat += Float.parseFloat(AFD.getTransfat());
					}
			}
		}
		model.addAttribute("foodlist", foodlist);
		model.addAttribute("calorie", calorie);
		model.addAttribute("protein", protein);
		model.addAttribute("fat", fat);
		model.addAttribute("carbohydrate", carbohydrate);
		model.addAttribute("sugar", sugar);
		model.addAttribute("dietaryfiber", dietaryfiber);
		model.addAttribute("saturatedfat", saturatedfat);
		model.addAttribute("unsaturatedfat", unsaturatedfat);
		model.addAttribute("cholesterol", cholesterol);
		model.addAttribute("sodium", sodium);
		model.addAttribute("transfat", transfat);
		model.addAttribute("calorie", calorie);
		if(selectfoodservice.foodscore(ID, formatDate) != null) {
			model.addAttribute("TOSCORE", selectfoodservice.foodscore(ID, formatDate).getSCORE());
		}
	if(userinfo != null) {
		model.addAttribute("dailyCalories", userinfo.getKcal());
	    model.addAttribute("Prorate", userinfo.getProrate());
	    model.addAttribute("Cbhrate", userinfo.getCbhrate());
	    model.addAttribute("Fatrate", userinfo.getFatrate());
		}
		return "test3";
	}
	@GetMapping("/food/delete.do")
	public String deletefood(@RequestParam String no,HttpServletRequest req,HttpServletResponse resp) {
		MemberDTO memberDto = loginService.selectOne(req);
		Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
        String formatDate = dateFormat.format(currentDate);
		String ID = memberDto.getId();
		selectfoodservice.deletefood(no, formatDate, ID);
		return "forward:/food/test3.do";
	}

	
	@GetMapping("/ranking/HealthSelect.do")
	public String hselectissue() {
		return "ranking/HealthSelect";
	}
	
	@GetMapping("/functionfood/healthissue.do")
	public String hissue(@RequestParam String healthissue,Model model) {
		List<AvgStarScoreCountDTO> listData = new ArrayList<>();
		List<AvgStarScoreCountDTO> listData2 = new ArrayList<>();
		String Hissuecous = selectfoodservice.healthIssueCou(healthissue);
		String[] Hissuecou = Hissuecous.split("\\$");
		Set<AvgStarScoreCountDTO> uniqueData = new HashSet<>();
        for (String hins : Hissuecou) {
            for (AvgStarScoreCountDTO hin : selectfoodservice.selectFoodListFromHealthissue(hins)) {
                // listData에 객체를 추가하기 전에 중복 여부를 체크합니다.
                if (!uniqueData.contains(hin)) {
                    listData.add(hin);
                    uniqueData.add(hin);
                }
            }
            for (AvgStarScoreCountDTO hin : selectfoodservice.FoodListFromHealthissue(hins)) {
                // listData2에 객체를 추가하기 전에 중복 여부를 체크합니다.
                if (!uniqueData.contains(hin)) {
                    listData2.add(hin);
                    uniqueData.add(hin);
                }
            }
        }
        if(healthissue.trim().equals("혈관")) {
        	healthissue = "혈관 & 혈액순환";
        }
        else if(healthissue.trim().equals("스트레스")) {
        	healthissue = "스트레스 & 수면";
        }
        else if(healthissue.trim().equals("노화")) {
        	healthissue = "노화 & 항산화";
        }
        else if(healthissue.trim().equals("소화")) {
        	healthissue = "소화 & 위식도 건강";
        }
        else if(healthissue.trim().equals("치아")) {
        	healthissue = "치아 & 잇몸";
        }
        else if(healthissue.trim().equals("임산부")) {
        	healthissue = "임산부 & 태아 건강";
        }
        else if(healthissue.trim().equals("운동 능력")) {
        	healthissue = "운동 능력 & 근육량";
        }
        else if(healthissue.trim().equals("탈모")) {
        	healthissue = "탈모 & 손톱 건강";
        }

		model.addAttribute("healthissue", healthissue);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("listsize", uniqueData.size());
		return "ranking/HealthIssueFood";
	}
	
	@GetMapping("/ranking/selectfoodnutrient.do")
	public String foodnutrient(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/ranking/selectfood.do")
	public String foodrank(Model model) {
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFoodScore();
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("casesel",1);
		
		return "ranking/FoodRank";
	}
	////////////////////////////////////////////////////////////////////////
	@GetMapping("/functionfood/select.do")
	public String selectfood(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,1);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,1);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 1);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectnutrient.do")
	public String selectfoodnutrient(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,2);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,2);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 2);
		return "ranking/FoodRank";
	}
	
	@GetMapping("/functionfood/selectcompany.do")
	public String selectfoodcompany(@RequestParam String foodname,Model model) {
		if(selectfoodservice.checkWord(foodname).size() == 0) {
			selectfoodservice.newWord(foodname);
		}
		selectfoodservice.selectKeyWord(foodname);
		List<String> RankingKeyWord = selectfoodservice.RankingKeyWord();
		List<AvgStarScoreCountDTO> listData = selectfoodservice.selectFoodListFromNameScore(foodname,3);
		List<FunctionalFoodListDTO> listData2 = selectfoodservice.selectFoodListFromName(foodname,3);
		
		model.addAttribute("RankingKeyWord", RankingKeyWord);
		model.addAttribute("listData", listData);
		model.addAttribute("listData2", listData2);
		model.addAttribute("foodname", foodname);
		model.addAttribute("casesel", 3);
		return "ranking/FoodRank";
	}
	
	 @GetMapping("/functionfood/food.do")
	 public String foodsearch(@RequestParam String takefood) {
		 System.out.println(takefood);
		 String foodno = selectfoodservice.foodNo(takefood);
		 System.out.println(foodno);
		 return "forward:/detail.do?no="+foodno+"";
	 }
}
