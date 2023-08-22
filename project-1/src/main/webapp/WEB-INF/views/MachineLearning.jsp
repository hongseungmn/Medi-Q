<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<style>
body {
	background-color: #fdfbf6;
}

.effect-custom-font {
	font-family: Noto Sans KR, sans-serif;
}

.hr-class {
	border: solid 3px #ccc;
}

/*ts 스타일 공간*/
.my-title {
	position: relative;
	background-image:
		url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	margin-top: 70px;
}

.jumbotron {
	display: flex;
	flex-direction: row;
	background-color: white;
	border-radius: 15px;
	width: 100%;
	height: 120px;
	padding: 24px 20px;
}

.tsai:hover {
	color: white;
	border: 3px solid #FD9F28;
	border-radius: 10px;
	padding: 10px;
}

.tsai {
	border: 3px solid white;
	box-shadow: 2px 2px 5px black;
	border-radius: 10px;
	padding: 10px;
}

.tsaibg {
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	position: absolute;
	top: 385px;
	right: 230px;

}
</style>

		<div class="container my-3" style="min-height: 880px; max-width: 1500px; background-color: white; border-radius: 15px;">
			<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
				<div class="" style="font-size:32px; margin-left: 180px;">인공지능을 통한<br/> <span style="color:#EF605D;">MEDI-Q</span> 질병예측 시스템</div>
			</div>

			<div class="container">
				<div class="jumbotron row m-2 effect-custom-font" style="position: relative; min-height: 650px;">
					<span style="font-size: 36px;">나의 질병 예측하기</span>
					<div class="tsai text-center" style="position: absolute; top:110px; left:-70px;">
						<a href="/DiabetesPredict.do?" style="color:black; font-weight: bold; text-decoration: none;">						
						<img alt="당뇨" style="border-radius:15px; width: 200px; height: 200px;" src="https://img.freepik.com/free-photo/covid-recovery-center-female-doctor-checking-elder-patient-s-oxygen-level_23-2148847834.jpg?size=626&ext=jpg&ga=GA1.1.236242110.1689157823&semt=sph">
						 <br/>당뇨병 예측</a>
					</div>
					<div class="tsai text-center" style="position: absolute; top:110px; left:180px;">
						<a href="/CardiovascularPredict.do?" style="color:black; font-weight: bold; text-decoration: none;">						
						<img alt="심장질환" style="border-radius:15px; width: 200px; height: 200px;" src="https://img.freepik.com/premium-photo/hands-holding-chest-with-symptom-heart-attack-disease_33807-784.jpg?size=626&ext=jpg&ga=GA1.1.236242110.1689157823&semt=sph">
						<br/>심장질환 예측</a>
					</div>
					<div class="tsai text-center" style="position: absolute; top:110px; left:430px;">
						<a href="/ParkinsonPredict.do?" style="color:black; font-weight: bold; text-decoration: none;">						
						<img alt="파킨슨병" style="border-radius:15px; width: 200px; height: 200px;" src="https://img.freepik.com/free-photo/old-patient-suffering-from-parkinson_23-2149370426.jpg?w=740&t=st=1691212317~exp=1691212917~hmac=3d8f58ce6f9c2097610d04da6d31dddc489ba25cfd9012dbc19d7ad57d000c43">
						<br/>파킨슨병 예측</a>
					</div>
					<div class="tsai text-center" style="position: absolute; top:380px; left:-70px;">
						<a href="/StrokePredict.do?" style="color:black; font-weight: bold; text-decoration: none;">						
						<img alt="뇌졸중" style="border-radius:15px; width: 200px; height: 200px;" src="https://img.freepik.com/premium-photo/handsome-depressed-man-in-casual-clothes_85574-5904.jpg?size=626&ext=jpg&ga=GA1.1.236242110.1689157823&semt=sph">
						<br/>뇌졸중 예측</a>
					</div>
					<div class="tsai text-center" style="position: absolute; top:380px; left:180px;">
						<a href="/SkinLesionPredict.do?" style="color:black; font-weight: bold; text-decoration: none;">						
						<img alt="피부질환" style="border-radius:15px; width: 200px; height: 200px;" src="https://img.freepik.com/free-photo/high-angle-hand-measuring-mole_23-2149359544.jpg?w=1380&t=st=1692320554~exp=1692321154~hmac=cdddd8519497c21824364e98f69b2fc3fa7db9385d300c5d030806790b8a6d36">
						<br/>피부질환 예측</a>
					</div>
					<div class="tsai text-center" style="position: absolute; top:380px; left:430px;">
						<a href="/LungCancerPredict.do?" style="color:black; font-weight: bold; text-decoration: none;">						
						<img alt="폐암" style="border-radius:15px; width: 200px; height: 200px;" src="https://img.freepik.com/free-photo/aching-young-ill-slavic-woman-with-scarf-around-her-neck-wearing-winter-hat-coughing-keeping-fist-close-to-mouth-sitting-on-couch-at-living-room_141793-105209.jpg?w=1380&t=st=1692608514~exp=1692609114~hmac=9057f895f81d4410f2fc0c386e01b03aa031a3add72d43a55a9ad469dc71125a">
						<br/>폐암 예측</a>
					</div>
				</div>
				<div class="tsaibg">
					<img alt="건강" style="width: 540px; height: 530px;" src="/images/nutrient_img/MLbg.png">
				</div>
			</div>
		</div>



	</body>
</html>