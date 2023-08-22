package com.kosmo.springapp.nutrient.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.nutrient.service.NutrientSelectService;


@Service
public class NutrientSelectServiceImpl implements NutrientSelectService {

	@Autowired
	private NutrientSelectMapper mapper;
	
	@Override
	public String editN_DESCbyVitaminName(String name) {

		String desc = mapper.getN_DESCbyVitaminName(name);

		if(desc != null) {
			desc = desc.replace("요.", "요.<br/><br/>");
			desc = desc.replace("해요!", "해요.<br/><br/>");
			desc = desc.replace("고용량 섭취했을 때 나타날 수 있는", "· 고용량 섭취했을 때 나타날 수 있는");
			desc = desc.replace("이 부위가", "· 이 부위가");
			desc = desc.replace("따라서 하나의 통일된 기준으로", "· 따라서 하나의 통일된 기준으로");
	        desc = desc.replace("하지만 다른 수용성 비타민에 비해", "· 하지만 다른 수용성 비타민에 비해");

		}
		else {
			desc = "";
		}
	    return desc;
	}
	
	@Override
	public String editN_CAUTIONbyVitaminName(String name) {

		String caution = mapper.getN_CAUTIONbyVitaminName(name);
	    
	    if (caution != null) {
	        caution = caution.replace("있음", "있어요.<br/><br/>");
	        caution = caution.replace("주의", "주의해야해요.<br/><br/>");
	        caution = caution.replace("권장함", "권장해요.<br/><br/>");
	        caution = caution.replace("기준으로 함", "기준으로 해요.<br/><br/>");
	        caution = caution.replace("상담 필요", "상담이 필요해요.<br/><br/>");
	        caution = caution.replace("추천", "추천해요.<br/><br/>");
	        caution = caution.replace("좋음", "좋아요.<br/><br/>");
	        caution = caution.replace("불쾌감 유발가능", "불쾌감을 유발할 수 있어요.<br/><br/>");
	        caution = caution.replace("· 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있어요.", "<span style=\"font-size: 27px;\">🚬</span> 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있어요.");
	        caution = caution.replace("· 임신 중 과다 복용시 기형 발생 위험 있어요.", "<span style=\"font-size: 27px;\">🤰</span> 임신 중 과다 복용시 기형 발생 위험 있어요.");
	        caution = caution.replace("· 고용량 섭취하면 간 기능에 영향을 줄 수 있으므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 고용량 섭취하면 간 기능에 영향을 줄 수 있으므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 통풍 환자는 증상이 악화될 수 있으므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 통풍 환자는 증상이 악화될 수 있으므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 심장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">💗</span> 심장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 고용량 섭취하면 발작 증상이 나타날 수 있으므로 뇌전증 환자는 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🧠</span> 고용량 섭취하면 발작 증상이 나타날 수 있으므로 뇌전증 환자는 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 고용량 섭취하면 신장", "<span style=\"font-size: 27px;\">🚽</span> 고용량 섭취하면 신장");
	        caution = caution.replace("· 칼슘 흡수가 증가하므로 고칼슘혈증이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 칼슘 흡수가 증가하므로 고칼슘혈증이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 칼슘의 흡수를 높이기 때문에 심장 질환이 있는 경우 고용량 섭취", "<span style=\"font-size: 27px;\">💗</span> 칼슘의 흡수를 높이기 때문에 심장 질환이 있는 경우 고용량 섭취");
	        caution = caution.replace("· 수술 전후 지혈을 늦출 수 있어요.", "<span style=\"font-size: 27px;\">🩸</span> 수술 전후 지혈을 늦출 수 있어요.");
	        caution = caution.replace("· 고함량 복용 시 당뇨 환자의 심혈관질환 위험을 높일 수 있으므로 주의해야해요.", "<span style=\"font-size: 27px;\">💗</span> 고함량 복용 시 당뇨 환자의 심혈관질환 위험을 높일 수 있으므로 주의해야해요.");
	        caution = caution.replace("· 고용량 복용 시 일부 암의 재발 위험을 높일 수 있으므로 주의해야해요.", "<span style=\"font-size: 27px;\">🧬</span> 고용량 복용 시 일부 암의 재발 위험을 높일 수 있으므로 주의해야해요.");
	        caution = caution.replace("· 전립선 암에 악영향을 줄 수 있다는 우려가 있으므로", "<span style=\"font-size: 27px;\">🧬</span> 전립선 암에 악영향을 줄 수 있다는 우려가 있으므로");
	        caution = caution.replace("· 고용량 섭취시 복통 또는 설사 유발 가능하므로 주의해야해요.", "<span style=\"font-size: 27px;\">🚽</span> 고용량 섭취시 복통 또는 설사 유발 가능하므로 주의해야해요.");
	        caution = caution.replace("· 과도한 단백질 섭취시 신장과 간에 부담을 줄 수 있어요.", "<span style=\"font-size: 27px;\">🚽</span> 과도한 단백질 섭취시 신장과 간에 부담을 줄 수 있어요.");
	        caution = caution.replace("· 과도한 단백질 섭취시 당뇨 및 심혈관질환 발생가능성 증가","<span style=\"font-size: 27px;\">💗</span> 과도한 단백질 섭취시 당뇨 및 심혈관질환 발생가능성 증가");
	        caution = caution.replace("· 영양제를 통한 고용량 섭취 시 위장장애를 유발할 수 있으므로 주의해야해요.", "<span style=\"font-size: 27px;\">🚽</span> 영양제를 통한 고용량 섭취 시 위장장애를 유발할 수 있으므로 주의해야해요.");
	        caution = caution.replace("· 건강한 배변활동을 위해 충분한 수분섭취를 병행하는 것이 좋아요.", "<span style=\"font-size: 27px;\">💧</span> 건강한 배변활동을 위해 충분한 수분섭취를 병행하는 것이 좋아요.");
	        caution = caution.replace("· 과도한 식이섬유 섭취시 복통 또는 소화장애 등의 불쾌감을 유발할 수 있어요.", "<span style=\"font-size: 27px;\">🚽</span> 과도한 식이섬유 섭취시 복통 또는 소화장애 등의 불쾌감을 유발할 수 있어요.");
	        caution = caution.replace("· 식품으로 섭취했을 때 흡수되는 정도가 10~40%로 높지 않으므로", "<span style=\"font-size: 27px;\">💊</span> 식품으로 섭취했을 때 흡수되는 정도가 10~40%로 높지 않으므로");
	        caution = caution.replace("· 고용량 섭취시 두드러기 또는 가려움 유발", "<span style=\"font-size: 27px;\">🩹</span> 고용량 섭취시 두드러기 또는 가려움 유발");
	        caution = caution.replace("· 섭취량은 상황에 따라 개인차가", "<span style=\"font-size: 27px;\">🩺</span> 섭취량은 상황에 따라 개인차가");
	        caution = caution.replace("· 위장의 흡수 기능에", "<span style=\"font-size: 27px;\">🚽</span> 위장의 흡수 기능에");
	        caution = caution.replace("· 신장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 신장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 혈압이 너무 낮아질 수 있으므로", "<span style=\"font-size: 27px;\">🩸</span> 혈압이 너무 낮아질 수 있으므로");
	        caution = caution.replace("· 1000(μg) 이상으로 고용량 섭취", "<span style=\"font-size: 27px;\">🩺</span> 1000(μg) 이상으로 고용량 섭취");
	        caution = caution.replace("· 오메가-3와 오메가-6를", "<span style=\"font-size: 27px;\">⚖</span> 오메가-3와 오메가-6를");
	        
	        } 
	    else {
	        caution = "";
	    }
	    
	    return caution;
	}
	
	@Override
	public String editI_DESCbyIngredientName(String name) {
		
		String desc = mapper.getI_DESCbyIngredientName(name);

		if(desc != null) {
			desc = desc.replace("요.", "요.<br/><br/>");
			desc = desc.replace("해요!", "해요.<br/><br/>");
			desc = desc.replace("고용량 섭취했을 때 나타날 수 있는", "· 고용량 섭취했을 때 나타날 수 있는");
			desc = desc.replace("긴으을", "기능을");
			desc = desc.replace("이 부위가", "· 이 부위에");
			desc = desc.replace("운동과", "· 운동과");
			desc = desc.replace("3.66mg", "3.66(mg)");
			desc = desc.replace("0.111mg", "0.111(mg)<br/>");
			desc = desc.replace("따라서 하나의 통일된 기준으로", "· 따라서 하나의 통일된 기준으로");
			desc = desc.replace("· 건강기능식품으로 인증 받지", "<br/>· 건강기능식품으로 인증 받지");
			desc = desc.replace("이런 경우에는", "· 이런 경우에는");
			desc = desc.replace("의 기술 수준에 따라서 실제로 건강에 도움이 되는 성분 함량이 달라질 수 있어요. · ", "의 기술 수준에 따라서 실제로 건강에 도움이 되는 성분 함량이 달라질 수 있어요.");
			desc = desc.replace("항산화 작용을 통해 노화를 막고,", "· 항산화 작용을 통해 노화를 막고,");
			desc = desc.replace("제품에서 추천하는 섭취량을 따르고, 느껴지는 효과에 따라 섭취량", "· 제품에서 추천하는 섭취량을 따르고, 느껴지는 효과에 따라 섭취량");
			desc = desc.replace("만약 고용량을 드시려는 경우에는", "· 만약 고용량을 드시려는 경우에는");
			desc = desc.replace("1) 뼈 & 관절 건강: 0.5~1(g)","1) 뼈 & 관절 건강: 0.5~1(g)<br/><br/>");
			desc = desc.replace("HCA 함량이 표시되어 있다면", "· HCA 함량이 표시되어 있다면");
			desc = desc.replace("2) 혈행 개선:", "<br/><br/> 2) 혈행 개선:");
			desc = desc.replace("3) PMS 개선:", "<br/><br/> 3) PMS 개선:");
			desc = desc.replace("4) 면역과민반응에", "<br/><br/> 4) 면역과민반응에");
			desc = desc.replace("피부 상태 개선: 160~300(mg)", "피부 상태 개선: 160~300(mg)<br/><br/>");
			desc = desc.replace("의약품의 경우 자세한 복용 방법", "· 의약품의 경우 자세한 복용 방법");
			desc = desc.replace("2) 당뇨신경병증", "<br/><br/>2) 당뇨신경병증");
			desc = desc.replace("· 의약품으로는 하루 50~300(mg)이", "<br/><br/> · 의약품으로는 하루 50~300(mg)이");
			desc = desc.replace("건강기능식품으로 인정받은 녹차추출물은 주요 지표물질로 카테킨이 20% 이상 들어있어요.", "· 건강기능식품으로 인정받은 녹차추출물은 주요 지표물질로 카테킨이 20% 이상 들어있어요.");
	        desc = desc.replace("· 관련 연구에 따르면 하루 100~400(mg)", "<br/><br/>· 관련 연구에 따르면 하루 100~400(mg)");
	        desc = desc.replace("2) 인지질 중 포스파티딜콜린", "<br/><br/>2) 인지질 중 포스파티딜콜린");
	        desc = desc.replace("3) 레시틴으로서 1200~1800(mg)","<br/><br/>3) 레시틴으로서 1200~1800(mg)");
	        desc = desc.replace("2) 나린진(Naringin): 18.78(mg)", "<br/><br/>2) 나린진(Naringin): 18.78(mg)");
	        desc = desc.replace("4:1 정도의 비율이 적절하다고 알려져 있어요.", "· 4:1 정도의 비율이 적절하다고 알려져 있어요.");
	        desc = desc.replace("· '실리마린'이나 '실리빈' 함량이 표기되어 있는지 확인하시는 게 좋아요!", "· '실리마린'이나 '실리빈' 함량이 표기되어 있는지 확인하시는 게 좋아요!<br/><br/>");
	        desc = desc.replace("코로솔산 함량이 표시되어 있다면", "· 코로솔산 함량이 표시되어 있다면");
	        desc = desc.replace("1) 피부건강, 항산화: 8~150(mg)", "<br/><br/>1) 피부건강, 항산화: 8~150(mg)");
	        desc = desc.replace("2) 혈중 콜레스테롤 개선: 40~150(mg)", "<br/><br/>2) 혈중 콜레스테롤 개선: 40~150(mg)<br/><br/>");
	        desc = desc.replace("1) 퀘르세틴(Quercetin) 3.66(mg)", "1) 퀘르세틴(Quercetin) 3.66(mg)<br/><br/>");
	        desc = desc.replace("2) 이소람네틴(Isorhamnetin) 0.111(mg)", "2) 이소람네틴(Isorhamnetin): 0.111(mg)<br/>");
	        desc = desc.replace("몸에서 만들어지기도 하지만, 상황이","· 몸에서 만들어지기도 하지만, 상황이");
	        desc = desc.replace("1) 기억력 개선: 0.9~2(g)", "1) 기억력 개선: 0.9~2(g)<br/><br/>");
	        desc = desc.replace("2) 건조한 눈 개선: 0.6~2.24(g)", "2) 건조한 눈 개선: 0.6~2.24(g)<br/><br/>");
	        desc = desc.replace("3) 혈액순환 개선: 0.5~2(g)", "3) 혈액순환 개선: 0.5~2(g)<br/><br/>");
	        desc = desc.replace("4) 혈중 중성지방 개선: 0.5~2(g)", "4) 혈중 중성지방 개선: 0.5~2(g)<br/><br/>");
	        desc = desc.replace("속이 불편할 수 있으니 충분한 식사를 하신 후에 드세요.", "· 속이 불편할 수 있으니 충분한 식사를 하신 후에 드세요.");
	        desc = desc.replace("1) 긴장 완화: 150(mg) 이상, 알파에스1카제인으로 2.7(mg) 이상", "1) 긴장 완화: 150(mg) 이상, 알파에스1카제인으로 2.7(mg) 이상<br/><br/>");
	        desc = desc.replace("1) 장 건강: 6.4~20(g)", "1) 장 건강: 6.4~20(g)<br/><br/>");
	        desc = desc.replace("2) 혈중 콜레스테롤 개선: 7.2~20(g)", "2) 혈중 콜레스테롤 개선: 7.2~20(g)<br/><br/>");
	        desc = desc.replace("1) 면역력 증진, 피로개선: 진세노사이드 Rg1과 Rb1의 합계로서 3~80(mg)", "1) 면역력 증진, 피로개선: 진세노사이드 Rg1과 Rb1의 합계로서 3~80(mg)<br/><br/>");
	        desc = desc.replace("2) 뼈 건강 : 진세노사이드 Rg1과 Rb1의 합계로서 25(mg)", "2) 뼈 건강 : 진세노사이드 Rg1과 Rb1의 합계로서 25(mg)<br/><br/>");
	        desc = desc.replace("1) 후코잔틴 2.7(mg) (미역추출물 주성분)", "1) 후코잔틴 2.7(mg) (미역추출물 주성분)<br/><br/>");
	        desc = desc.replace("1) 혈중 콜레스테롤 개선: 5.5(g) 이상", "1) 혈중 콜레스테롤 개선: 5.5(g) 이상<br/><br/>");
	        desc = desc.replace("1) 건조 분말 형태: 하루 250~1600(mg)", "1) 건조 분말 형태: 하루 250~1600(mg)<br/><br/>");
	        desc = desc.replace("2) 추출물 형태: 하루 120~1600(mg)", "2) 추출물 형태: 하루 120~1600(mg)<br/><br/>");
	        desc = desc.replace("3) 주스 형태: 하루 120~750(mg)", "3) 주스 형태: 하루 120~750(mg)<br/><br/>");
	        desc = desc.replace("1) 피부건강, 항산화에 도움을 줄 수 있음 : 총 엽록소로서 8~150(mg)", "1) 피부건강, 항산화에 도움을 줄 수 있음 : 총 엽록소로서 8~150(mg)<br/><br/>");
	        desc = desc.replace("1) 혈중 콜레스테롤 개선: 1.2~4.5(g)", "1) 혈중 콜레스테롤 개선: 1.2~4.5(g)<br/><br/>");
	        desc = desc.replace("1) 혈중 콜레스테롤 개선: 5~20(mg)", "1) 혈중 콜레스테롤 개선: 5~20(mg)<br/><br/>");
	        desc = desc.replace("프로시아니딘으로 표준화 되어있는지 확인해보시는 것도 좋아요!", "프로시아니딘으로 표준화 되어있는지 확인해보시는 것도 좋아요!<br/><br/>");
	        desc = desc.replace("[피크노제놀 함량 기준]", "[피크노제놀 함량 기준]<br/><br/>");
	        desc = desc.replace("1) 항산화(활성산소 제거): 50~200(mg)", "1) 항산화(활성산소 제거): 50~200(mg)<br/><br/>");
	        desc = desc.replace("2) 갱년기 여성 건강: 60~200(mg)", "2) 갱년기 여성 건강: 60~200(mg)<br/><br/>");
	        desc = desc.replace("3) 혈액순환 개선: 100~200(mg)", "3) 혈액순환 개선: 100~200(mg)<br/><br/>");
	        desc = desc.replace("[프로시아니딘 함량 기준]", "[프로시아니딘 함량 기준]<br/><br/>");
	        desc = desc.replace("1) 항산화(활성산소 제거): 30~160(mg)", "1) 항산화(활성산소 제거): 30~160(mg)<br/><br/>");
	        desc = desc.replace("2) 갱년기 여성 건강: 36~160(mg)", "2) 갱년기 여성 건강: 36~160(mg)<br/><br/>");
	        desc = desc.replace("1) 면역력 증진, 피로개선: 3~80(mg)", "<br/><br/>1) 면역력 증진, 피로개선: 3~80(mg)<br/><br/>");
	        desc = desc.replace("2) 혈액 흐름, 기억력 개선, 항산화: 2.4~80(mg)", "2) 혈액 흐름, 기억력 개선, 항산화: 2.4~80(mg)<br/><br/>");
	        desc = desc.replace("3) 갱년기 여성 건강 개선: 25~80(mg)", "3) 갱년기 여성 건강 개선: 25~80(mg)<br/>");
	        
	        
		}
		else {
			desc = "";
		}
	    return desc;
	}
	
	
	@Override
	public String editI_CAUTIONbyIngredientName(String name) {
		
		String caution = mapper.getI_CAUTIONbyIngredientName(name);
	    
	    if (caution != null) {
	        caution = caution.replace("있음", "있어요.<br/><br/>");
	        caution = caution.replace("주의", "주의해야해요.<br/><br/>");
	        caution = caution.replace("권장함", "권장해요.<br/><br/>");
	        caution = caution.replace("기준으로 함", "기준으로 해요.<br/><br/>");
	        caution = caution.replace("상담 필요", "상담이 필요해요.<br/><br/>");
	        caution = caution.replace("추천", "추천해요.<br/><br/>");
	        caution = caution.replace("좋음", "좋아요.<br/><br/>");
	        caution = caution.replace("불쾌감 유발가능", "불쾌감을 유발할 수 있어요.<br/><br/>");
	        caution = caution.replace("· 신장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 신장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 수술 전후 지혈을 늦출 수 있어요.", "<span style=\"font-size: 27px;\">🩸</span> 수술 전후 지혈을 늦출 수 있어요.");
	        caution = caution.replace("· 임산부 대상 연구가 부족하므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🤰</span> 임산부 대상 연구가 부족하므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 수유부 대상 연구가 부족하므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">👶</span> 수유부 대상 연구가 부족하므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 발작 증상이 나타날 수 있으므로 뇌전증 환자는","<span style=\"font-size: 27px;\">🧠</span> 발작 증상이 나타날 수 있으므로 뇌전증 환자는");
	        caution = caution.replace("· 갑상선 질환이 있거나", "<span style=\"font-size: 27px;\">🩺</span> 갑상선 질환이 있거나");
	        caution = caution.replace("· 갑각류 알러지 주의해야해요.","<span style=\"font-size: 27px;\">🦞</span> 갑각류 알러지 주의해야해요.");
	        caution = caution.replace("· 천식 치료제의 효과", "<span style=\"font-size: 27px;\">😷</span> 천식 치료제의 효과");
	        caution = caution.replace("· 간 기능이 저하될 수 있으므로", "<span style=\"font-size: 27px;\">🩺</span> 간 기능이 저하될 수 있으므로");
	        caution = caution.replace("· 심장 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">💗</span> 심장 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 정신행동질환이 있는 경우", "<span style=\"font-size: 27px;\">🧠</span> 정신행동질환이 있는 경우");
	        caution = caution.replace("· 수술 전후 혈당 수치와", "<span style=\"font-size: 27px;\">🩸</span> 수술 전후 혈당 수치와");
	        caution = caution.replace("· 견과류 알러지가", "<span style=\"font-size: 27px;\">🥜</span> 견과류 알러지가");       
	        caution = caution.replace("· 대두 알러지", "<span style=\"font-size: 27px;\">🥫</span> 대두 알러지");       
	        caution = caution.replace("· 담낭 질환이", "<span style=\"font-size: 27px;\">🩺</span> 담낭 질환이");
	        caution = caution.replace("· 천식 환자는", "<span style=\"font-size: 27px;\">😷</span> 천식 환자는");
	        caution = caution.replace("· 요오드 조절에", "<span style=\"font-size: 27px;\">🩺</span> 요오드 조절에");
	        caution = caution.replace("· 위장을 자극할 수 있으므로", "<span style=\"font-size: 27px;\">🚽</span> 위장을 자극할 수 있으므로");
	        caution = caution.replace("· 당뇨가 있는 경우 전문가와 상담","<span style=\"font-size: 27px;\">🩺</span> 당뇨가 있는 경우 전문가와 상담");
	        caution = caution.replace("· 카페인이 함유되어", "<span style=\"font-size: 27px;\">☕</span> 카페인이 함유되어");
	        caution = caution.replace("· 혈당에 영향을 줄 수 있으므로", "<span style=\"font-size: 27px;\">🩺</span> 혈당에 영향을 줄 수 있으므로");
	        caution = caution.replace("· 혈압을 높일 수 있으므로", "<span style=\"font-size: 27px;\">🩸</span> 혈압을 높일 수 있으므로");
	        caution = caution.replace("· 안압을 높일 수 있어", "<span style=\"font-size: 27px;\">👀</span> 안압을 높일 수 있어");
	        caution = caution.replace("· 고지혈증약과 함께", "<span style=\"font-size: 27px;\">🩺</span> 고지혈증약과 함께");
	        caution = caution.replace("· 카페인이 모유를","<span style=\"font-size: 27px;\">👶</span> 카페인이 모유를");
	        caution = caution.replace("· 카페인이 혈액을 만드는","<span style=\"font-size: 27px;\">🩸</span> 카페인이 혈액을 만드는");
	        caution = caution.replace("· 카페인으로 인해 불안 증상을","<span style=\"font-size: 27px;\">😖</span> 카페인으로 인해 불안 증상을");
	        caution = caution.replace("· 고용량 섭취하면 발작 증상이 나타날 수 있으므로 뇌전증 환자는 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🧠</span> 고용량 섭취하면 발작 증상이 나타날 수 있으므로 뇌전증 환자는 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 카페인으로 인해 안압이 높아질","<span style=\"font-size: 27px;\">👀</span> 카페인으로 인해 안압이 높아질");
	        caution = caution.replace("· 고용량 섭취하면 설사를","<span style=\"font-size: 27px;\">🚽</span> 고용량 섭취하면 설사를");
	        caution = caution.replace("· 카페인으로 인해 칼슘 배설","<span style=\"font-size: 27px;\">🚽</span> 카페인으로 인해 칼슘 배설");
	        caution = caution.replace("· 카페인을 과도하게 섭취하면 심장 박동이","<span style=\"font-size: 27px;\">💗</span> 카페인을 과도하게 섭취하면 심장 박동이");
	        caution = caution.replace("· 여성호르몬 농도에 영향을 줄 수 있으므로","<span style=\"font-size: 27px;\">👩</span> 여성호르몬 농도에 영향을 줄 수 있어서");
	        caution = caution.replace("· 고용량 섭취하면 신장", "<span style=\"font-size: 27px;\">🚽</span> 고용량 섭취하면 신장");
	        caution = caution.replace("· 고용량 섭취하면 요오드 조절에", "<span style=\"font-size: 27px;\">🩺</span> 고용량 섭취하면 요오드 조절에");
	        caution = caution.replace("· 수술 전후 약물 대사에 영향을 줄 수 있어요.", "<span style=\"font-size: 27px;\">💊</span> 수술 전후 약물 대사에 영향을 줄 수 있어요.");
	        caution = caution.replace("· 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있어요.", "<span style=\"font-size: 27px;\">🚬</span> 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있어요.");
	        caution = caution.replace("· 마리골드 꽃을 원료로 하는 경우,", "<span style=\"font-size: 27px;\">🌼</span> 마리골드 꽃을 원료로 하는 경우,");
	        caution = caution.replace("· 통풍 환자는 증상이 악화될 수 있으므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 통풍 환자는 증상이 악화될 수 있으므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 임산부 대상 연구가 많지 않으나,", "<span style=\"font-size: 27px;\">🤰</span> 임산부 대상 연구가 많지 않으나,");
	        caution = caution.replace("· 국화과 식물 알러지", "<span style=\"font-size: 27px;\">🌼</span> 국화과 식물 알러지");
	        caution = caution.replace("· 혈당 조절에 영향을 줄 수 있으므로 수술 전후", "<span style=\"font-size: 27px;\">🩺</span> 혈당 조절에 영향을 줄 수 있으므로 수술 전후");
	        caution = caution.replace("· 자가면역질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 자가면역질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 혈압이 너무 낮아질 수 있으므로", "<span style=\"font-size: 27px;\">🩸</span> 혈압이 너무 낮아질 수 있으므로");
	        caution = caution.replace("· 중증 간질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 중증 간질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 헤르페스 감염증을 악화시킬 수 있으므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 헤르페스 감염증을 악화시킬 수 있으므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 중증 간 질환이 있는 경우", "<span style=\"font-size: 27px;\">🩺</span> 중증 간 질환이 있는 경우");
	        caution = caution.replace("· 아스피린과 유사한 영향을 미칠 수", "<span style=\"font-size: 27px;\">💊</span> 아스피린과 유사한 영향을 미칠 수");
	        caution = caution.replace("· 유제품 알러지 주의해야해요.", "<span style=\"font-size: 27px;\">🥛</span> 유제품 알러지 주의해야해요.");
	        caution = caution.replace("· 출산 시 혈액 응고에", "<span style=\"font-size: 27px;\">🤰</span> 출산 시 혈액 응고에");
	        caution = caution.replace("· 임신 준비 중에는 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🤰</span> 임신 준비 중에는 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 인삼/홍삼 알러지 주의해야해요.", "<span style=\"font-size: 27px;\">🌱</span> 인삼/홍삼 알러지 주의해야해요.");
	        caution = caution.replace("· 태아의 건강에 영향을 줄 수 있으므로 섭취 주의해야해요.", "<span style=\"font-size: 27px;\">👶</span> 태아의 건강에 영향을 줄 수 있으므로 섭취 주의해야해요.");
	        caution = caution.replace("· 고용량 섭취하면 수면을 방해할", "<span style=\"font-size: 27px;\">😴</span> 고용량 섭취하면 수면을 방해할");
	        caution = caution.replace("· 수면을 방해하여 증상을 악화시킬 수 있으므로 정신 질환이", "<span style=\"font-size: 27px;\">🧠</span> 수면을 방해하여 증상을 악화시킬 수 있으므로 정신 질환이");
	        caution = caution.replace("· 석류 알러지 주의해야해요.", "<span style=\"font-size: 27px;\">🩹</span> 석류 알러지 주의해야해요.");
	        caution = caution.replace("· 임산부와 태아 건강에 영향을 줄 수 있으므로 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🤰</span> 임산부와 태아 건강에 영향을 줄 수 있으므로 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 간 질환이 있는 경우 장기간", "<span style=\"font-size: 27px;\">🩺</span> 간 질환이 있는 경우 장기간");
	        caution = caution.replace("· 전립선 암에 악영향을 줄 수 있다는 우려가 있으므로", "<span style=\"font-size: 27px;\">🧬</span> 전립선 암에 악영향을 줄 수 있다는 우려가 있으므로");
	        caution = caution.replace("· 혈압에 영향을 줄 수 있으므로 혈압 조절에 민감한 경우 주의해야해요.", "<span style=\"font-size: 27px;\">🩸</span> 혈압에 영향을 줄 수 있으므로 혈압 조절에 민감한 경우 주의해야해요.");
	        caution = caution.replace("· 질환이 있거나 항생제 복용 시 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">💊</span> 질환이 있거나 항생제 복용 시 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 알레르기 체질은 개인에 따라 과민반응을 나타낼 수 있어요.", "<span style=\"font-size: 27px;\">🩹</span> 알레르기 체질은 개인에 따라 과민반응을 나타낼 수 있어요.");
	        caution = caution.replace("· 꽃가루 알러지 주의해야해요.", "<span style=\"font-size: 27px;\">🌼</span> 꽃가루 알러지 주의해야해요.");
	        caution = caution.replace("· 꿀 알러지 주의해야해요.", "<span style=\"font-size: 27px;\">🍯</span> 꿀 알러지 주의해야해요.");
	        caution = caution.replace("· 벌 알러지 주의해야해요.", "<span style=\"font-size: 27px;\">🐝</span> 벌 알러지 주의해야해요.");
	        caution = caution.replace("· 유당불내증 주의해야해요.", "<span style=\"font-size: 27px;\">🥛</span> 유당불내증 주의해야해요.");
	        caution = caution.replace("· 간 질환이 있는 경우 전문가와 상담이 필요해요.", "<span style=\"font-size: 27px;\">🩺</span> 간 질환이 있는 경우 전문가와 상담이 필요해요.");
	        caution = caution.replace("· 히알루론산 알러지 주의해야해요.", "<span style=\"font-size: 27px;\">🩹</span> 히알루론산 알러지 주의해야해요.");
	        
	    } 
	    else {
	        caution = "";
	    }
	    
	    return caution;
	}
	
	
	
	
	
	

}