<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<c:url value="/tsfolder/css/drawStyle.css"/>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


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
	margin-top: 20px;
	margin-bottom: 50px;
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
	border: 2px solid #FD9F28;
	border-radius: 10px;
	padding: 10px;
}

.tsai {
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

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    max-width: 80%;
}

.close1 {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close1:hover,
.close1:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
ul {
    list-style: none;
}
.pakinul {
    margin-left: 20px;
    padding: 0px;
    font-size: 16px;
    line-height: 28px;
    color: #595959;
    word-break: break-all;
    vertical-align: top;
    border: 0px;
    text-decoration: none;
}
.pakinul span {
	display: inline-block;
    margin-top: 13px;
    position: absolute;
    left: 0;
    top: 0;
    width: 5px;
    height: 2px;
    background-color: #111111;
    opacity: 0.3;
    margin-right: 6px;
}
.pakinul li {
	width: 100%;
    display: block;
    position: relative;
    box-sizing: border-box;
    padding-left: 10px;
    padding-right: 30px;
    margin-top: 7px;
    text-align: justify;
    font-size: 12px;
}
.pakinul1 {
	color: #6866ab;
    font-weight: bold;
}

	/* 업로드된 이미지의 스타일 */
    .uploaded-image {
        max-width: 70%;
	    max-height: 70%;
	    display: block;
	    position: absolute;
	    top: 45%; 
	    left: 50%; 
	    transform: translate(-50%, -50%); /* 이미지의 중심을 기준으로 위치 조정 */
	}
	
	/* HR 스타일 */
	hr {
	    border: none;
	    height: 2px;  /* 굵기 설정 */
	    background-color: grey;  /* 색상 설정 */
	    margin: 20px 0;
	}
	
	/* 테이블 스타일 */
	.table-disease {
	    border-collapse: collapse;
	    margin: 0 auto;
	}
	
	.table-disease th, .table-disease td {
	    border: 1px solid #ddd;
	    padding: 10px;
	    text-align: left;
	    font-size: 12px;
	}
	
	.table-disease th {
	    background-color: #f2f2f2;
	}
</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1200px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px; font-weight: bold; line-height: 50px;">인공지능을 통한<br/> <span style="color:#EF605D;">MEDI-Q</span> 질병예측 시스템</div>
		</div>
		<div class="mx-5 my-4 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7); font-weight: bold;">피부질환 발병확률 예측하기</div>
		<div class="model-score  mx-2 pt-5 mb-4" style="width:80%;height:80px; font-weight: bold;background-color:">※ 현재 딥러닝의 예측능력(F1-Score)은 약 <kbd class="px-2" style="font-weight: normal;">90%</kbd> 입니다</div>
		<div class="d-flex" style="flex-direction: row; position: relative;">
			<div id="imageContainer" class="canvas" style="position: relative; border:3px solid black; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.68);">
				<div class="controls__btns" style="margin-top: 600px; text-align: center; justify-content: center; display: flex;">
			        <button id="jsUpload" style="width:110px; height: 30px; font-size: 14px; margin-right: 50px;">사진 업로드</button>
			        <button id="jsSave" style="width:110px; height: 30px; font-size: 14px;">결과보기</button>
			    </div>
			</div>
			<div style="border:2px solid gray; margin-left:50px; width:450px; border-radius: 10px;">
				<div class="controls" style="height: 100%; width: 100%; margin-top: 15px;">
					<div class="d-flex mx-2" style="height: 665px; width:95%; flex-direction: column; border: solid 4px #f0ebf6;">
						<h4 style="margin-top:5px; padding-bottom:5px; border-bottom: solid 1px rgba(0, 0, 0, 0.3); display: flex; align-items: center; height: 60px;">
							<img src="https://www.kumc.or.kr/seasonPress/KUMM_vol17/img_sub/KS11_box_t1.png" style="margin-left:25px; width: 50px; height: 50px;" >
							<span style="margin-left:20px; color:#222222; font-size: 22px; font-weight: bold; line-height: 45px;">7가지 피부질환 AI 자가진단</span>
						</h4>
						<ul class="pakinul">
							<li>
								<b style="font-weight: bold; font-size: 14px;">1. 갈색 세포모반</b><br/>
								피부에 생기는 갈색의 작은 반점으로 대체로 안전합니다.<br/>흔히 '점' 또는 '모반'으로 불립니다.</li>
							<li>
								<b style="font-weight: bold; font-size: 14px;">2. 지루성 각화증</b><br/>
								피부에 생기는 붉은색 또는 갈색의 반점으로 대체로 안전합니다. 흔히 '검버섯'으로 불립니다.</li>
							<li>
								<b style="font-weight: bold; font-size: 14px;">3. 피부 섬유종</b><br/>
								피부에 생기는 작은 적갈색 돌기 형태로 대체로 안전합니다.<br/>흔히 '쥐젖'으로 불립니다.</li>
							<li>
								<b style="font-weight: bold; font-size: 14px;">4. 혈관종</b><br/>
								피하 혈관에서 발생하는 발생하는 붉은색의 반점으로 대체로 안전합니다.</li>
							<li>
								<b style="font-weight: bold; font-size: 14px;">5. 광선 각화증</b><br/> 
								자외선에 많이 노출되면 생기는 반점으로 피부암 초기 단계일 수 있습니다.</li>
							<li>
								<b style="font-weight: bold; font-size: 14px;">6. 기저세포암</b><br/> 
								가장 흔한 피부암의 종류로 초기 발견시 치료가 가능합니다.</li>
							<li>
								<b style="font-weight: bold; font-size: 14px;">7. 흑색종</b><br/>
								검은색의 악성 종양으로 조기 발견과 치료가 중요합니다.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="modal" class="modal">
	    <div class="modal-content" style="width:900px; height:500px; display: flex; flex-direction: column;">
	        <div style="display: flex; justify-content: flex-end; margin-right: 30px;"><span class="close1">&times;</span></div>
	        <div class="row" style="flex-grow: 1; display: flex;">
	            <div class="col-6" style="display: flex; align-items: center; justify-content: center; width: 400px; height: 400px; flex-grow: 1;">
	                <div id="modal-content" style="text-align: center; width: 350px;"></div>
	            </div>
	            <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
	                <ul class="pakinul">
	                	<li class="text-center" style="font-weight:bold; font-size: 25px; margin-bottom: 40px; margin-top: 0px;"><b>피부질환 예측과정</b></li>
						<li style="font-size: 15px;"><span></span><b style="color: #EF605D">MEDI-Q는 다양한 피부질환 사례를 훈련한 딥러닝 모델을 활용하여</b> 사용자의 피부 사진을 분석하고 질환을 예측합니다.</li>
						<li style="font-size: 15px;"><span></span>제공된 사진 내의 <b style="color: #EF605D">피부 병변(또는 점)을 확인해 7가지 주요 피부질환 중 하나로 식별합니다.</b></li>
						<li style="font-size: 15px;"><span></span>이 시스템은 피부의 초기 진단 정보를 제공하지만, 정확한 진단과 치료를 위해서는 전문의와의 상담이 필수적입니다.</li>
					</ul>
	            </div>
	        </div>
	    </div>
	</div>

<script>

	//이미지 업로드
	document.getElementById('jsUpload').addEventListener('click', function() {
	    var input = document.createElement('input');
	    input.type = 'file';
	    input.addEventListener('change', function(event) {
	        var file = event.target.files[0];
	        if (file) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                var img = document.createElement('img');
	                img.src = e.target.result;
	                img.classList.add('uploaded-image');
	                var imageContainer = document.getElementById('imageContainer');
	             	
	                // 기존의 img 태그를 선택하고 삭제
	                var oldImg = imageContainer.querySelector('img');
	                if (oldImg) {
	                    imageContainer.removeChild(oldImg);
	                }
	                
	                imageContainer.appendChild(img);
	            };
	            reader.readAsDataURL(file);
	        }
	    });
	    input.click();
	});
	
	// 결과보기 버튼 클릭 이벤트
	document.getElementById("jsSave").addEventListener("click", function() {
	    
		var uploadedImage = document.querySelector(".uploaded-image");
	    if (!uploadedImage) {
	        alert('이미지를 업로드해주세요.');
	        return;
	    }
		
		// 모달 창 열기
	    document.getElementById("modal").style.display = "block";

	    // base64 데이터 URL을 Blob 객체로 변환
	    var blob = dataURLtoBlob(uploadedImage.src);

	    // 이미지를 서버로 보내기 위한 AJAX 요청
	    var formData = new FormData();
	    formData.append("image", blob, "uploaded_image.jpg");
	    
	    //질병의 한글 이름과 해당하는 코드를 매핑
	    var diseaseNamesKorean = {
    	    "akiec": "광선 각화증",	//"광선 각화증/보웬병(자외선 노출, 초기 피부암)",
    	    "bcc": "기저세포암",	//"기저세포암(가장 흔한 피부암)",
    	    "bkl": "지루성 각화증",	//"지루성 각화증(검버섯)",
    	    "df": "피부 섬유종",	//"피부 섬유종(쥐젖)",
    	    "mel": "흑색종",		//"흑색종(피부암)",
    	    "nv": "갈색 세포모반",	//"갈색 세포모반(점)",
    	    "vasc": "혈관종"		//"혈관종"
    	};

	    $.ajax({
	        url: "http://192.168.0.16/SkinLesionModel",
	        data: formData,
	        method: "post",
	        processData: false,
	        contentType: false
	    }).done(function(response) {
	        // 모든 확률 값을 포함하는 리스트 생성
	        var allProbabilities = [];
	        for (var disease in response.all_probabilities) {
	            allProbabilities.push({
	                disease: disease,
	                probability: parseFloat(response.all_probabilities[disease])
	            });
	        }
	        
	        // 확률 값에 따라 내림차순으로 정렬
	        allProbabilities.sort(function(a, b) {
	            return b.probability - a.probability;
	        });
	        
	        // "akiec", "bcc", "mel"의 확률을 더함
    		var predictionResult = Math.round(((response.all_probabilities.akiec || 0) * 100 + 
                           					   (response.all_probabilities.bcc || 0) * 100 + 
                           					   (response.all_probabilities.mel || 0) * 100) * 10) / 10;

	        // AJAX 요청을 사용하여 predictionResult 값을 서버에 저장
	        $.ajax({
	            type: 'post',
	            url: "<c:url value='/savePrediction'/>",
	            contentType: 'application/json',
	            data: JSON.stringify({
	                p_disease: 'SkinLesion',
	                p_result: predictionResult
	            }),
	            success: function () {
	                console.log("데이터 저장 완료");
	            }
	        });
	        
	     	// 결과 문자열 생성
	        var result = "<p style='font-size:20px; font-weight:bold;'>예측된 피부 질환</p><br/>";
	        result += "<span style='color:#EF605D; font-weight:bold;'>" + diseaseNamesKorean[allProbabilities[0].disease] + " </span>";
	        result += "<span style='color:#EF605D; font-weight:bold;'>(확률: " + (allProbabilities[0].probability * 100).toFixed(2) + "%)</span>";
	        result += "<hr>";
	        result += "<p style='font-size:20px; font-weight:bold;'>피부 질환별 예측 확률</p>";

	        // 테이블 시작
	        result += "<table class='table-disease'>";
	        result += "<thead><tr><th class='text-center' style='width:180px;'>피부 질환 종류</th><th class='text-center' style='width:100px;'>확률</th></tr></thead><br/>";
	        result += "<tbody>";
	        allProbabilities.forEach(function(item) {
	            result += "<tr><td class='text-center'>" + diseaseNamesKorean[item.disease] + "</td><td class='text-center'>" + (item.probability * 100).toFixed(2) + "%</td></tr>";
	        });
	        result += "</tbody></table>";  // 테이블 종료

	        document.getElementById("modal-content").innerHTML = result;
	    });
	});

	// 데이터 URL에서 base64 문자열 분리 및 Blob 객체 반환 함수
	function dataURLtoBlob(dataurl) {
	    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1];
	    var bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
	    while(n--){
	        u8arr[n] = bstr.charCodeAt(n);
	    }
	    return new Blob([u8arr], {type:mime});
	}
	
	// 모달창 닫기 버튼 클릭 이벤트
	document.querySelector(".close1").addEventListener("click", function() {
	    document.getElementById("modal").style.display = "none";
	});
	   

</script>
	</body>
</html>