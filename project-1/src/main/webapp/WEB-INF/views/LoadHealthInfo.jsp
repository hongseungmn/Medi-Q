<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
body{
	background-color: #fdfbf6;
}
   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .hr-class {
    	border : solid 3px #ccc;
    }
    /*ts 스타일 공간*/
    .my-title {
    	position:relative;
    	background-image: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
    	background-repeat: no-repeat;
    	background-size: cover;
    	margin-top: 70px;
    }
    .tsanalyze {
    	display: flex;
    	flex-direction:column;
    	justify-content:center;
    	border-radius: 40px 40px 0px 0px;
		box-shadow: rgba(108, 108, 108, 0.15) 0px -1px 10px;
		margin-top: 50px;
    }
    .jumbotron {
    	background-color: #f6f6f6;
    	border-radius:15px;
    	width:100%;
    	height:120px; 
    	padding: 24px 20px;
    }
    .inputValue {
    	width:100px;
    	text-align: right;
    	margin-right: 5px;
    	margin-left: 120px;
    }
    .inputValue1 {
    	width:100px;
    	text-align: right;
    	margin-right: 5px;
    	margin-left: 60px;
    }
    .inputValue2 {
    	width:100px;
    	text-align: right;
    	margin-right: 5px;

    }
    tr {
    	text-align: center;
    }
    tr td:last-child{
    	text-align: left;
    }

</style>

		<div class="container my-3" style="min-height: 880px; max-width: 1100px; background-color: white; border-radius: 15px;">
			<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
				<div class="" style="font-size:32px; margin-left: 180px;"><span style="font-size:40px; color:#FDCDBC;">${userId} </span> 님의 건강정보</div>
			</div>
			
			
	<div class="container mt-3 effect-custom-font" >
		<div class="load-way d-flex justify-content-around my-5">
			<div id="LoadhealthInfoByOCRBtn"><input type="file" name="files" class="btn btn-info"/></div>
			<!--  <div class="btn btn-warning">건강검진 API로 불러오기</div> -->
		</div>
		<div class="mt-5 mb-2 ml-5">&#x1F601; 올바르게 불러왔는지 값을 확인한 후 저장을 눌러주세요!</div>
		<div class="health-info-table ml-3 mt-3 effect-custom-font row">
					<c:if test="${empty loadHealthInfo}" var="emptyInfo">
					<table class="table table-bordered col-8">
				<form action="<c:url value="/saveHealthData.do"/>" method="POST" onsubmit="preventSubmit(event)" id="sendHealthData">
					<input type="hidden" name="userId" value="${userId}"/>
			        <colgroup>
			            <col width=12%>
			            <col width=20%>
			            <col width=40%>
			        </colgroup>
			        <tr class="table-primary">
			            <th>목표 질환</th>
			            <th>검사항목</th>
			            <th>결과</th>
			        </tr>
			        <tr>
			            <th rowspan="4">비만</th>
			            <td>신장</td>
			            <td><input class="inputValue" type="text" value="0" name="height">cm</td>
			     
			        </tr>
			        <tr>
			            <td>체중</td>
			            <td><input class="inputValue" type="text" value="0" name="weight">kg</td>
			     
			        </tr>
			        <tr>
			            <td>허리둘레</td>
			            <td><input class="inputValue" type="text" value="0" name="waistline">cm</td>
			         
			        </tr>
			        <tr>
			            <td>체질량지수</td>
			            <td><input class="inputValue" type="text" value="0" name="bmi">kg/m2</td>
			        </tr>
			        <tr>
			    		<th>시각 이상</th>
			            <td>시력(좌/우)</td>
			            <td><input class="inputValue" type="text" value="0" name="vision"></td>
			        </tr>
			        <tr>
			    		<th>청각 이상</th>
			            <td>청력(좌/우)</td>
			            <td><input class="inputValue" type="text" value="0" name="listen"></td>
			        </tr>
	      		    <tr>
			    		<th>고혈압</th>
			            <td>혈압(최저/최고)</td>
			            <td><input class="inputValue1" type="text" value="0" name="bloodPressure_low"> / <input class="inputValue2" style="margin-top: 5px;" type="text" value="0" name="bloodPressure_high">mmHg</td>
			        </tr>
	           		<tr>
			    		<th>신장질환</th>
			            <td>요단백</td>
			            <td><input class="inputValue" type="text" value="0" name="proteinuria"></td>
			        </tr>
			   		<tr>
			    		<th>빈혈 등</th>
			            <td>혈색소</td>
			            <td><input class="inputValue" type="text" value="0" name="hemoglobin">g/dL</td>
			        </tr>
			        <tr>
			    		<th>당뇨병</th>
			            <td>식전혈당</td>
			            <td><input class="inputValue" type="text" value="0" name="bloodSugar">mg/dL</td>
			        </tr>
			        <tr>
			    		<th rowspan="4">고혈압</th>
			            <td>총 콜레스테롤</td>
			            <td><input class="inputValue" type="text" value="0" name="total_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			            <td>HDL - 콜레스테롤</td>
			            <td><input class="inputValue" type="text" value="0" name="HDL_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			            <td>트리글리세라이드</td>
			            <td><input class="inputValue" type="text" value="0" name="triglyceride">mg/dL</td>
			        </tr>
			        <tr>
			            <td>(LDL - 콜레스테롤)</td>
			            <td><input class="inputValue" type="text" value="0" name="LDL_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			        	<th>만성신장질환</th>
			            <td>혈청크레아타닌</td>
			            <td><input class="inputValue" type="text" value="0" name="serum_creatinine">mg/dL</td>
			        </tr>	
			        <tr>
			        	<th rowspan="3">간장질환</th>
			        	<td>AST(SGOT)</td>
			        	<td><input class="inputValue" type="text" value="0" name="ast">U/L</td>
			        </tr>	     
			        <tr>
			        	<td>ALT(SGPT)</td>
			        	<td><input class="inputValue" type="text" value="0" name="alt">U/L</td>
			        </tr>  
			        <tr>
			        	<td>감마지피티(a - GPT)</td>
			        	<td><input class="inputValue" type="text" value="0" name="gpt">U/L</td>
			        </tr> 
			    </form>
		    </table>
		    <div class="col-4"><canvas id="canvas"></canvas></div>
		</div>
		<button class="btn btn-warning mb-5" style="width:100%;" id="sendHealthDataBtn">저장하기</button>
			        </c:if>
			        <c:if test="${not emptyInfo}">
			        					<table class="table table-bordered col-8">
				<form action="<c:url value="/updateHealthData.do"/>" method="POST" onsubmit="preventSubmit(event)" id="sendHealthData">
					<input type="hidden" name="userId" value="${userId}"/>
			        <colgroup>
			            <col width=12%>
			            <col width=18%>
			            <col width=38%>
			        </colgroup>
			        <tr class="table-primary">
			            <th>목표 질환</th>
			            <th>검사항목</th>
			            <th>결과</th>
			        </tr>
			        <tr>
			            <th rowspan="4">비만</th>
			            <td>신장</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.height}" name="height">cm</td>
			     
			        </tr>
			        <tr>
			            <td>체중</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.weight}" name="weight">kg</td>
			     
			        </tr>
			        <tr>
			            <td>허리둘레</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.waistline}" name="waistline">cm</td>
			         
			        </tr>
			        <tr>
			            <td>체질량지수</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.bmi}" name="bmi">kg/m2</td>
			        </tr>
			        <tr>
			    		<th>시각 이상</th>
			            <td>시력(좌/우)</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.vision}" name="vision"></td>
			        </tr>
			        <tr>
			    		<th>청각 이상</th>
			            <td>청력(좌/우)</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.listen}" name="listen"></td>
			        </tr>
	      		    <tr>
			    		<th>고혈압</th>
			            <td>혈압(최저/최고)</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.bloodPressure_low}" name="bloodPressure_low"> / <input class="inputValue" style="margin-top: 5px;" type="text" value="${loadHealthInfo.bloodPressure_high}" name="bloodPressure_high"> mmHg</td>
			        </tr>
	           		<tr>
			    		<th>신장질환</th>
			            <td>요단백</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.proteinuria}" name="proteinuria"></td>
			        </tr>
			   		<tr>
			    		<th>빈혈 등</th>
			            <td>혈색소</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.hemoglobin}" name="hemoglobin">g/dL</td>
			        </tr>
			        <tr>
			    		<th>당뇨병</th>
			            <td>식전혈당</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.bloodSugar}" name="bloodSugar">mg/dL</td>
			        </tr>
			        <tr>
			    		<th rowspan="4">고혈압</th>
			            <td>총 콜레스테롤</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.total_cholesterol}" name="total_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			            <td>HDL - 콜레스테롤</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.HDL_cholesterol}" name="HDL_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			            <td>트리글리세라이드</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.triglyceride}" name="triglyceride">mg/dL</td>
			        </tr>
			        <tr>
			            <td>(LDL - 콜레스테롤)</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.LDL_cholesterol}" name="LDL_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			        	<th>만성신장질환</th>
			            <td>혈청크레아타닌</td>
			            <td><input class="inputValue" type="text" value="${loadHealthInfo.serum_creatinine}" name="serum_creatinine">mg/dL</td>
			        </tr>	
			        <tr>
			        	<th rowspan="3">간장질환</th>
			        	<td>AST(SGOT)</td>
			        	<td><input class="inputValue" type="text" value="${loadHealthInfo.ast}" name="ast">U/L</td>
			        </tr>	     
			        <tr>
			        	<td>ALT(SGPT)</td>
			        	<td><input class="inputValue" type="text" value="${loadHealthInfo.alt}" name="alt">U/L</td>
			        </tr>  
			        <tr>
			        	<td>감마지피티(a - GPT)</td>
			        	<td><input class="inputValue" type="text" value="${loadHealthInfo.gpt}" name="gpt">U/L</td>
			        </tr> 
			        </form>
		    </table>
		    <div class="col-4"><canvas id="canvas"></canvas></div>
		</div>
		<button class="btn btn-warning mb-5" style="width:80%; border-radius: 10px; margin-left: 110px;" id="updateHealthDataBtn">수정하기</button>
			        </c:if>
		</div>
	</div>
<script>
	$("input[name=files]").change(function(e) {
		 var fileInput = document.querySelector('input[name=files]');
		  var file = fileInput.files[0];
		  var reader = new FileReader();
		  reader.onload = function(e) {
		    var base64Result = e.target.result.split(",")[1];
		    // 변환된 Base64 데이터를 사용하여 필요한 작업을 수행
		    console.log(base64Result);
		    $.ajax({
		    	url: '<c:url value="/loadHealthInfoByOCR.do"/>',
		    	method : "post",
	          	data : "base64="+ encodeURIComponent(base64Result),
	          	dataType : 'json'
		    })
		    .done(function(data) {
		    	var array;
		    	var healthArray =Array();
		    	var string_health = data['responses'][0]['fullTextAnnotation']['text'];
		    	array = string_health.split('\n');
		    	var flag = false;
	          	for(var str of array) {
	              var juminRule=/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-8][0-9]{6}$/;
	              if(juminRule.test(str)) {flag=false;}
	              if(flag) {healthArray.push(str);}
	              if(str === '결과') {flag = true;}
	          	}
	          	console.log(healthArray);
	          	var values = [];
	          	healthArray.forEach(function(item) {
          	  		item = item.replace('m2','m');
          	  		var numbers = item.match(/\d+(\.\d+)?/g);
          	 		if (numbers) {
          	    		values = values.concat(numbers);
          	  		}
          		});
	          	var inputItems = document.querySelectorAll(".inputValue");
	          	inputItems.forEach(function(item,index) {
	          		item.value = values[index];
	          	});
	          	
	          	//이미지에 그림 그리기
	          	var point = data['responses'][0]['fullTextAnnotation']['pages'][0]['blocks'];
				
				var canvas = document. getElementById ( "canvas" );
				var context = canvas.getContext( "2d" );
				var img = new Image (); //이미지 객체 생성
				img.src = e.target.result; //code.jpg라는 이미지 파일을 로딩 시작
				img.onload = function () {
					//(20,20)을 중심으로 100*100의 사이즈로 이미지를 그림 
					canvas.width = img.width;
					canvas.height = img.height;
					context.drawImage(img,0,0);
					point.forEach(function(item) {
						context.strokeStyle = '#00ff00';
						context.lineWidth = 3;
						var paragraph =  '';
						item['paragraphs'].forEach(function(code) {
							code['words'].forEach(function(text) {
								text['symbols'].forEach(function(last) {
									paragraph += last['text'];
								});
							});
						});
						let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
						let reg2 = /[a-zA-Z0-9]/gim;
						let resultData = paragraph.replace(reg, "");
						resultData = resultData.replace(reg2,"");
						console.log("resultData",resultData);
						
						var start_x = item['boundingBox']['vertices'][0]['x'];
						var start_y = item['boundingBox']['vertices'][0]['y'];
						var end_x = item['boundingBox']['vertices'][2]['x'] - item['boundingBox']['vertices'][0]['x'];
						var end_y =  item['boundingBox']['vertices'][3]['y']- item['boundingBox']['vertices'][0]['y'];
						context.strokeRect(start_x,start_y,end_x,end_y);
					});
				}
	          	
	          	
		    })
		  };
		  reader.readAsDataURL(file);
	});
  function preventSubmit(event) {
	    event.preventDefault(); // 전송을 막는 메소드
	  }
  $("#sendHealthDataBtn").click(function() {
	  Swal.fire({
		  icon: 'success',
		  title: '저장되었습니다!',
		  showConfirmButton: false,
		  timer: 1500
	    }).then((result) => {
	        document.querySelector("#sendHealthData").submit();
	    })
  });
  $("#updateHealthDataBtn").click(function() {
	  Swal.fire({
		  icon: 'success',
		  title: '수정되었습니다!',
		  showConfirmButton: false,
		  timer: 1500
	    }).then((result) => {
	        document.querySelector("#sendHealthData").submit();
	    })
  });
</script>
	</body>
</html>