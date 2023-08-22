<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- MyPage.jsp -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-messaging.js"></script>

<%-- webpuch firebase 
<script src="../firebase-messaging-sw.js"></script>
 --%>
<!-- 로그인 후에만 들어올 수 있도록 -->
<style>
	a:hover{
		text-decoration: none;
		color: rgb(13, 184, 193);
	}
	a{
		color: black;
	}
	.borderline{
		border: solid 1.5px lightgrey;
	}
	.custom-file-input:lang(en)~.custom-file-label::after {
        content: "파일찾기";
    }
	body{
        padding: 0;
        margin: 0;
        list-style: none;
    }
</style>

<!-- datepicker css -->
<style>
		.ui-datepicker-trigger { width: 70px; cursor: pointer; }
		#ui-datepicker-div { left: 1120px !important; top: 280px !important; }
        .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 

        .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 

        .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 

        .ui-state-default,
        .ui-widget-content .ui-state-default,
        .ui-widget-header .ui-state-default,
        .ui-button,
        html .ui-button.ui-state-disabled:hover,
        html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 

        .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 

        .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 370px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 

        .ui-widget.ui-widget-content { border: 1px solid #eee; } 

        #datepicker:focus>.ui-datepicker { display: block; } 

        .ui-datepicker-prev,
        .ui-datepicker-next { cursor: pointer; } 

        .ui-datepicker-next { float: right; } 

        .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 

        .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 

        .ui-datepicker-calendar { width: 100%; } 

        .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 
        
        .ui-datepicker-calendar>tbody>tr { height: 48px;}

        .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

        .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 

        .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 36px; height: 36px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 

        .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 

        .ui-state-hover,
        .ui-widget-content .ui-state-hover,
        .ui-widget-header .ui-state-hover,
        .ui-state-focus,
        .ui-widget-content .ui-state-focus,
        .ui-widget-header .ui-state-focus,
        .ui-button:hover,
        .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 

        .ui-widget-header .ui-icon { background-image: url('<c:url value="/images/basic/btns.png"/>'); } 

        .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 

        .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 

        .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 

        .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 

        .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 

        .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 

        .ui-state-highlight,
        .ui-widget-content .ui-state-highlight,
        .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 
		.full-highlight { border: 0px; background: #fa264af8; border-radius: 100%; width: 10px; height: 10px;} 

        .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 

        .inp:focus { outline: none; background-color: #eee; } 
</style>
<body>
	<div class="container" style="margin-top: 50px">
	    <div style="height: 50px"></div>
		<div class="rounded-lg borderline p-3 mb-3 shadow">
			<div class="row d-flex px-3 py-3" >
				<c:if test="${info.prof_Img_Fl eq 'Y' }" var="isProfImg">
					<c:set var="uploadFolder" value="${fn:split(profImg.pi_Path,'\\\\')[fn:length(fn:split(profImg.pi_Path, '\\\\'))-1] }"/>
					<img class="rounded-circle" alt="사용자 이미지" src="<c:url value="/images/${uploadFolder }/${profImg.pi_Filename }.${profImg.pi_Ext }" />" style="width: 80px; height: 80px">
				</c:if>
				<c:if test="${not isProfImg }">
					<img class="rounded-circle" alt="기본 프로필" src="<c:url value="/images/basic/friend.png" />" style="width: 80px; height: 80px">
				</c:if>
				<span class="align-self-center mr-auto ml-2" id="id" style="font-weight: bold">${info.id }</span>
				<a type="button" class="btn btn-outline-info align-self-center mx-2" href='<c:url value="/project/MentalTest1.do"/>'>정신건강 테스트</a>
				<a type="button" class="btn btn-outline-info align-self-center" href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>">건강검진정보 불러오기</a>
				<input type="button" id="imgEdit" value="이미지 수정" class="btn btn-outline-info align-self-center mx-2" data-target="#modalView" data-backdrop="static"/>
				<c:if test='${info.social_Fl eq "Y"}' var="isSocial"><!-- 소셜용 -->
					<a type="button" href='<c:url value="/project/JoinEdit.do"/>' class="btn btn-outline-info align-self-center">회원정보 수정</a>
				</c:if>
				<c:if test="${not isSocial }"><!-- 일반 회원용 -->
					<a type="button" href="" id="infoEdit" class="btn btn-outline-info align-self-center" data-target="#modalView" data-backdrop="static">회원정보 수정</a>
				</c:if>
			</div>
		</div>
		
<!-- 건강기록 css -->
<style>
.acco img{
	width: 40px;
	margin-left: 5px;
	cursor: pointer;
}
.transition {
  transition: all 0.25s ease-in-out;
}
.flipIn {
  animation: flipdown 0.5s ease both;
}

.diaryStart{
	margin-left: 100px;
}

.diary{
	margin-top: 30px;
	margin-bottom: 50px;
	padding-top: 30px;
	padding-bottom: 50px;
  	background-color: #fff8b6;
  	box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1);
  	border: rgba(48, 69, 92, 0.8) solid 0;
}

h1, h2 {
  color: rgba(48, 69, 92, 0.8);
}
h1 {
  text-transform: uppercase;
  font-size: 30px;
  line-height: 42px;
  letter-spacing: 3px;
}
h2 {
  font-size: 20px;
  line-height: 34px;
  display: block;
  margin: 0;
  cursor: pointer;
}
.acco {
  color: rgba(48, 69, 92, 0.8);
  font-size: 17px;
  line-height: 26px;
  letter-spacing: 1px;
  position: relative;
  overflow: hidden;
  max-height: 800px;
  opacity: 1;
  transform: translate(0, 0);
  margin-top: 14px;
  z-index: 2;
  transition: all 0.5s ease-in-out;
}
ul {
  list-style: none;
  perspective: 900px;
  padding: 0;
  margin: 0;
}
form ul li {
  position: relative;
  padding: 0;
  margin: 0;
  padding-bottom: 4px;
  padding-top: 18px;
  border-top: 1px solid #01aa72a4;
  animation: flipdown 0.5s ease both;
}
ul li:nth-of-type(1) {
  animation-delay: 0.3s;
}
ul li:nth-of-type(2) {
  animation-delay: 0.5s;
}
ul li:nth-of-type(3) {
  animation-delay: 0.75s;
}
ul li:nth-of-type(4) {
  animation-delay: 1.0s;
}
ul li:nth-of-type(5) {
  animation-delay: 1.25s;
}
ul li:nth-of-type(6) {
  animation-delay: 1.5s;
}
ul li:last-of-type {
  padding-bottom: 0;
}

ul li input[type=checkbox] {
  position: absolute;
  cursor: pointer;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
}
ul li input[type=checkbox]:checked ~ .acco {
  margin-top: 0;
  max-height: 0;
  opacity: 0;
  transform: translate(0, 50%);
}

@keyframes flipdown {
  0% {
    opacity: 0;
    transform-origin: top center;
    transform: rotateX(-90deg);
  }
  5% {
    opacity: 1;
  }
  80% {
    transform: rotateX(8deg);
  }
  83% {
    transform: rotateX(6deg);
  }
  92% {
    transform: rotateX(-3deg);
  }
  100% {
    transform-origin: top center;
    transform: rotateX(0deg);
  }
}

/* 알림버튼 on/off */
.btn-onoff{
  position: relative;
  display: inline-block;
  vertical-align: middle;
  margin-left: 20px;
}
.btn-onoff input{
  position: absolute;
  opacity:0
}
.btn-onoff span{
	position: relative;
	display: block;
	width: 80px;
	height: 34px;
	border-radius: 40px;
	background: #ccc;
	border: 1px solid #ccc;
	-webkit-transition: 400ms;
	-moz-transition: 400ms;
	-ms-transition: 400ms;
	transition: 400ms
}
.btn-onoff input:checked ~ span{
  border: 1px solid #0084ff;
  background: #0084ff
}
.btn-onoff input ~ span:before{
	content: 'Off';
	display: block;
	width: 45px;
	height: 34px;
	position: absolute;
	right: 0px;
	font-size: 14px;
	font-family: "Arial";
	font-weight: bold;
	line-height: 34px;
	color: #444;
	padding: 0px 8px;
	letter-spacing: 1px;
	text-transform: uppercase;
	-webkit-transition: 500ms;
	-moz-transition: 500ms;
	-ms-transition: 500ms;
	transition: 500ms
}
.btn-onoff input:checked ~ span:before{
	content: 'On';
	right: 28px;
	color: #fff
}
.btn-onoff input ~ span:after{
	content: '';
	position: absolute;
	width: 26px;
	height: 26px;
	top: 4px;
	left: 4px;
	background: #fff;
	border-radius: 50%;
	-webkit-transition: 400ms;
	-moz-transition: 400ms;
	-ms-transition: 400ms;
	transition: 400ms
}
.btn-onoff:hover input ~ span:after{
	-webkit-transform:scale(0.9);
	-moz-transform:scale(0.9);
	-ms-transform:scale(0.9);
	transform:scale(0.9)
}
.btn-onoff input:checked ~ span:after{
	content: '';
	left: 51px;
}
</style>

		<div class="row diaryStart">	        
	        <div class="col diary" style="max-width: 600px">
	        	<form action="#">
	        		<div class="row justify-content-between align-items-center pb-2 pl-3 pr-3">		        		
		        		<!-- 다른 날짜 클릭하면 클릭한 날짜가 보이도록 -->
						<h1><span class="clickDate">${empty clickDate ? current : clickDate }</span> 건강 기록</h1>
						<input class="datepicker" placeholder="날짜를 선택해 주세요"/>
					</div>
					<ul>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">오늘의 컨디션</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<img alt="happy" src="/images/condition/happy.png" name="condition"/>
								<img alt="smile" src="/images/condition/smile.png" name="condition"/>
								<img alt="good" src="/images/condition/good.png" name="condition"/>
								<img alt="soso" src="/images/condition/soso.png" name="condition"/>
								<img alt="sad" src="/images/condition/sad.png" name="condition"/>
								<img alt="sosad" src="/images/condition/sosad.png" name="condition"/>
								<img alt="angry" src="/images/condition/angry.png" name="condition"/>
							</div>
						</li>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">증상체크</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="head">머리</div>
								<div id="head">
									<span class="btn btn-outline-secondary">두통</span>
									<span class="btn btn-outline-secondary">어지러움</span>
									<span class="btn btn-outline-secondary">발열</span>
									<span class="btn btn-outline-secondary">편두통</span>
									<span class="btn btn-outline-secondary">메스꺼움</span>
									<span class="btn btn-outline-secondary">구토</span>
								</div>
								<div class="respiratory">호흡기</div>
								<div id="resp">
									<span class="btn btn-outline-secondary">기침</span>
									<span class="btn btn-outline-secondary">가래</span>
									<span class="btn btn-outline-secondary">호흡곤란</span>
									<span class="btn btn-outline-secondary">코막힘</span>
								</div>
								<div class="stomach">배</div>
								<div id="stomach">
									<span class="btn btn-outline-secondary">복통</span>
									<span class="btn btn-outline-secondary">설사</span>
									<span class="btn btn-outline-secondary">변비</span>
									<span class="btn btn-outline-secondary">속쓰림</span>
									<span class="btn btn-outline-secondary">소화불량</span>
									<span class="btn btn-outline-secondary">경련</span>
									<span class="btn btn-outline-secondary">식욕감퇴</span>
									<span class="btn btn-outline-secondary">복부 팽만감</span>
								</div>
								<div class="mental">정신</div>
								<div id="mental">
									<span class="btn btn-outline-secondary">우울</span>
									<span class="btn btn-outline-secondary">불면증</span>
									<span class="btn btn-outline-secondary">스트레스</span>
									<span class="btn btn-outline-secondary">감정기복</span>
									<span class="btn btn-outline-secondary">무기력</span>
									<span class="btn btn-outline-secondary">피곤함</span>
									<span class="btn btn-outline-secondary">집중력 감퇴</span>
								</div>
								<div class="chest">가슴</div>
								<div id="chest">
									<span class="btn btn-outline-secondary">호흡곤란</span>
									<span class="btn btn-outline-secondary">가슴통증</span>
									<span class="btn btn-outline-secondary">압박감</span>
								</div>
								<div class="body">신체</div>
								<div id="body">
									<span class="btn btn-outline-secondary">근육경련</span>
									<span class="btn btn-outline-secondary">부종</span>
									<span class="btn btn-outline-secondary">피부발진</span>
									<span class="btn btn-outline-secondary">체중변화</span>
									<span class="btn btn-outline-secondary">가려움</span>
								</div>
							</div>
						</li>
<style>
	.add{
		display: flex;
		justify-content: between;
		align-items: center;
		margin-bottom: 5px;
	}
	.circle{
		border:3px solid skyblue;
		border-radius:100px 100px;
	}
</style>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">복용 영양제</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="add">
									<input class="form-control" value="비타민" style="height: 35px; width: 100px">
									<input class="form-control mx-2" type="number" min="1" max="6" style="height: 35px; width: 50px"> 정
									<i class="xmark fa-regular fa-circle-xmark ml-1"></i>
								</div>
								<div class="add">
									<input class="form-control" value="철분제" style="height: 35px; width: 100px">
									<input class="form-control mx-2" type="number" min="1" max="6" style="height: 35px; width: 50px"> 정
									<i class="xmark fa-regular fa-circle-xmark ml-1"></i>
								</div>
								<div class="add">
									<input class="form-control" value="엽산" style="height: 35px; width: 100px">
									<input class="form-control mx-2" type="number" min="1" max="6" style="height: 35px; width: 50px"> 정
									<i class="xmark fa-regular fa-circle-xmark ml-1"></i>
								</div>
								<a href="javascript:addList()" id="add">추가</a>	
							</div>							
						</li>
<!-- 알레르기 css -->				
<style>
	.full{
		background-color: coral;
		border-radius: 10%;
	}
	.allergy{
		padding-left: 0;
		padding-right: 0;
		margin: 5px 5px;
	}
	i,small{
		cursor: pointer;
	}
</style>	
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">알레르기</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="row mx-1">
									<div class="col allergy">
								    	<img class="d-block mx-auto" alt="알류" src='<c:url value="/images/allergy/egg.png"/>'>
								    	<small class="d-block text-center">알류</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="우유" src='<c:url value="/images/allergy/milk.png"/>'>
								    	<small class="d-block text-center">우유</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="메밀" src='<c:url value="/images/allergy/memil.png"/>'>
								    	<small class="d-block text-center">메밀</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="땅콩" src='<c:url value="/images/allergy/peanut.png"/>'>
								    	<small class="d-block text-center">땅콩</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="대두" src='<c:url value="/images/allergy/bean.png"/>'>
								    	<small class="d-block text-center">대두</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="밀" src='<c:url value="/images/allergy/wheat.png"/>'>
								    	<small class="d-block text-center">밀</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="고등어" src='<c:url value="/images/allergy/mackerel.png"/>'>
								    	<small class="d-block text-center">고등어</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="게" src='<c:url value="/images/allergy/crab.png"/>'>
								    	<small class="d-block text-center">게</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="새우" src='<c:url value="/images/allergy/shrimp.png"/>'>
								    	<small class="d-block text-center">새우</small>	
							    	</div>
							    </div>
							    <div class="row mx-1">
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="토마토" src='<c:url value="/images/allergy/tomato.png"/>'>
								    	<small class="d-block text-center">토마토</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="복숭아" src='<c:url value="/images/allergy/peach.png"/>'>
								    	<small class="d-block text-center">복숭아</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="호두" src='<c:url value="/images/allergy/walnut.png"/>'>
								    	<small class="d-block text-center">호두</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="돼지고기" src='<c:url value="/images/allergy/pork.png"/>'>
								    	<small class="d-block text-center mx-n2">돼지고기</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="닭고기" src='<c:url value="/images/allergy/chicken.png"/>'>
								    	<small class="d-block text-center">닭고기</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="쇠고기" src='<c:url value="/images/allergy/beef.png"/>'>
								    	<small class="d-block text-center">쇠고기</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="오징어" src='<c:url value="/images/allergy/squid.png"/>'>
								    	<small class="d-block text-center">오징어</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="조개류" src='<c:url value="/images/allergy/clam.png"/>'>
								    	<small class="d-block text-center">조개류</small>	
							    	</div>
							    	<div class="col allergy">
								    	<img class="d-block mx-auto" alt="잣" src='<c:url value="/images/allergy/pinenut.png"/>'>
								    	<small class="d-block text-center">잣</small>	
							    	</div>
							    </div>
							</div>
						</li>
						
<style>
   .c-bmi {
	  border-radius: .25rem;
	  box-sizing: border-box;
	  font-family: ui-sans-serif, system-ui, sans-serif;
	  padding: 1rem;
	  width: 40rem;
	  width: 100%;
	}
	.c-bmi__groups {
	  border: 0;
	  flex-wrap: wrap;
	  color: rgba(48, 69, 92, 0.8);
	  font-weight: bold;
	  font-size: medium;
	  padding: 0;
	  text-align: center;
	  width: 100%;
	  margin-top: 30px;
	  display: flex;
	  justify-content: center;
	}
	.c-bmi__groups label {
	  display: flex;
	  padding: .5rem;
	  position: relative;
	}
	
	[for="bmi-g0"] { background-color: #4691e2; }
	[for="bmi-g1"] { background-color: #0cb764; }
	[for="bmi-g2"] { background-color: #febf18; }
	[for="bmi-g3"] { background-color: #fc8711; }
	[for="bmi-g4"] { background-color: #ff6455; }
	[for="bmi-g5"] { background-color: #cc1100; color: #fff; }
	
	.c-bmi__groups input:checked + label::before {
	  background-color: #fff;
	  clip-path: polygon(0% 0%,0% 100%,75.00% 50.00%);
	  content: '';
	  display: inline-block;
	  height: 1rem;
	  left: 0.5rem;
	  position: absolute;
	  top: 0.35rem;
	  width: 1rem;
	}
	.c-bmi__groups input:checked + label + div {
	  display: block;
	  flex: 0 0 100%;
	}
	.c-bmi__label {
	  display: block;
	  font-size: medium;
	  margin: 0 0 1rem 0;
	  position: relative;
	}
	.c-bmi__label output {
	  position: absolute;
	  right: 0;
	  top: 0;
	}
	
	.c-bmi [type="radio"] { display: none; }
	
	/* RWD */
	@media (min-width: 600px) {
	  .c-bmi__groups { display: block; }
	  .c-bmi__groups input:checked + label::before {
	    background-color: inherit;
	    clip-path: polygon(0% 0%,100% 0%,50% 100%);
	    left: 50%;
	    top: -1rem;
	    transform: translateX(-50%);
	    width: 1.5rem;
	  }	
</style>
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">체중 키</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<div class="c-bmi">
									<div class="d-inline-flex align-items-center">
										<span>키</span>
						                <input class="form-control ml-3" name="h" style="height: 35px; width: 80px"> &nbsp;cm
						                <span class="mx-3">체중</span>
						                <input class="form-control" name="w" style="height: 35px; width: 80px"> &nbsp;kg
						                <a class="btn btn-primary h-100 ml-3" href="javascript:result()">BMI 계산</a>
									</div>
									<div class="c-bmi__groups" readonly style="display: none">
										<label >나의 체질량지수</label>
										<div class="d-flex">
								            <input type="radio" id="bmi-g0" name="g" />
								            <label for="bmi-g0" name="l">저체중</label>
								              
								            <input type="radio" id="bmi-g1" name="g" checked />
								            <label for="bmi-g1" name="l">정상</label>
								              
								            <input type="radio" id="bmi-g2" name="g" />
								            <label for="bmi-g2" name="l">과체중</label>
								              
								            <input type="radio" id="bmi-g3" name="g" />
								            <label for="bmi-g3" name="l">경도비만</label>
								              
								            <input type="radio" id="bmi-g4" name="g" />
								            <label for="bmi-g4" name="l">중등도비만</label>
							            </div>
						            </div>
						            <div class="c-bmi__group-text font-weight-bold" name="text"></div>
						        </div>
							</div>
						</li>
						
						<li>
							<input type="checkbox" checked>
							<div class="d-flex justify-content-between">
								<h2 class="flipIn">기타 메모</h2>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="acco">
								<textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요" rows="5"></textarea>
							</div>
						</li>
					</ul>
						<button type="submit" class="memoSend btn btn-outline-primary mt-3">확인</button>
						<button type="submit" class="memoSend btn btn-outline-primary mt-3">수정</button>
						<button type="submit" class="memoSend btn btn-outline-primary mt-3">삭제</button>
				</form>
			</div>
	    </div>
	    
	    <!-- 약복용 모달 시작 -->
	    <form action="#">
		    <div class="modal fade" id="myModal">
		    	<div class="modal-dialog modal-dialog-centered">
			      	<div class="modal-content">
			        	<div class="modal-header">
			          		<span class="modal-title font-weight-bold" style="font-size: 1.5rem">약 복용</span>
			        	</div>
				        <div class="modal-body">
				        	<div class="d-flex justify-content-between align-items-center">
				        		<div>
						         	<span>알람 여부</span>
						         	<label class="btn-onoff">
										<input type="checkbox" name="name" data-onoff="toggle"><span></span>
									</label>
								</div>
								<div class="d-inline-flex align-items-center">
									<span>복용 시간</span>
									<input type="time" class="form-control ml-3" name="pillTime" style="width: 150px"/>
								</div>
							</div>
							<div class="d-inline-flex align-items-center">
								<span>복용 정 수</span>
								<input type="number" class="form-control ml-3" name="pillCount" style="width: 100px"/>
							</div>
				        </div>
				        <div class="modal-footer">
				        	<button type="submit" class="btn btn-outline-info" data-dismiss="modal">확인</button>
				          	<button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
				        </div>
					</div>
			    </div>
		  	</div>
		</form><!-- 모달 끝 -->
	
		<!-- 수정/삭제시 사용할 모달 시작 -->
		<div class="modal fade" id="modalView">	
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h5 class="modal-title">모달 헤더</h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					
						<div class="modal-body d-flex justify-content-center" style="height: 130px">
							<form class="form-inline justify-content-center" action="" method="POST">
								<input type="hidden" name="mode" value="editBtn"/>		
								<input type="hidden" name="id" value="${empty info.id ? info.email :info.id }"/>
								<input type="password" name="password" class="form-control mx-2" placeholder="비밀번호를 입력하세요"/>
								<div class="custom-file" style="width: 250px; display: none">
						            <input type="file" class="custom-file-input" name="file" id="customFile" accept=".jpg,.img,.png,.bmp,.gif">
						            <label class="custom-file-label justify-content-start" for="customFile">${empty profImg ? "파일 선택" : profImg.pi_Filename+='.'+=profImg.pi_Ext }</label>
						        </div>
						        <a type="button" name="defaultImg" href="<c:url value="/project/ProfImgEdit.do"/>" class="btn btn-outline-info ml-3" style="display: none">기본이미지로 변경</a>	
							</div>
							<div class="modal-footer justify-content-right">
								<input type="submit" class="btn btn-info mx-2" value="확인" />
					          	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				          	</form>
			          	</div>
		          	
				</div>
			</div>
		</div>
		<!-- 수정/삭제시 사용할 모달 끝 -->
	</div><!-- 컨테이너 -->
	<c:set var="current" value="${current}"/>
	
	<c:set var="date" value="${memo.mm_Date}"/>
	<c:set var="condition" value="${memo.mm_Condition}"/>
	<c:set var="head" value="${memo.mm_Head}"/>
	<c:set var="resp" value="${memo.mm_Resp}"/>
	<c:set var="stom" value="${memo.mm_Stomach}"/>
	<c:set var="ment" value="${memo.mm_Mental}"/>
	<c:set var="chest" value="${memo.mm_Chest}"/>
	<c:set var="body" value="${memo.mm_Body}"/>
	<c:set var="nutr" value="${memo.mm_Nutrients}"/>
	<c:set var="allergy" value="${memo.mm_Allergy}"/>
	<c:set var="height" value="${memo.mm_Height}"/>
	<c:set var="weight" value="${memo.mm_Weight}"/>
	<c:set var="content" value="${memo.mm_Content}"/>
	
	<c:set var="date" value=""/>
	<c:forEach var="diary" items="${memos }">
		<c:set var="date" value="${date } ${diary.mm_Date }"/>
	</c:forEach>
</body>
</html>
<script>
(function($){
	var dates_ = '<c:out value="${date}"/>'
	var dates = dates_.substring(1);
	//console.log('dates:',dates)
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    beforeShowDay:function(date){ //달력 클릭 시 저장된 값이 있을 때 클래스 추가하기
	    	var month = date.getMonth().toString().length==1?'0'+(date.getMonth()+1).toString():(date.getMonth()+1).toString()
	    	var day = date.getDate().toString().length==1?'0'+date.getDate().toString():date.getDate().toString()
	    	var fulldate = date.getFullYear()+'-'+month+'-'+day;
	    	var isFull = "";
	    	dates.split(" ").forEach(function(d){
	    		//console.log('d:',d)
	    		//console.log('f:',fulldate)
	    		if(d==fulldate){
	    			isFull =  true;
	    			//return [true, isFull ? "full" : ""];
	    		}
	    	})
	    	return [true, isFull ? "full-highlight ui-datepicker-days-cell-over" : ""]; // 다른 날짜는 기본값 반환
	    },//날짜 선택 전 이벤트 주기
	    yearSuffix: '년',
	    maxDate: new Date(), //오늘 날짜 이 후만 선택가능
	    showOn : 'button',
        buttonImageOnly: true,
        buttonImage: '/images/basic/calendar.png',
	});
	
	$(function(){
		 $('.datepicker').datepicker().toggle('.datepicker');
	})
	//console.log('test:',$('.add').slice('3'))
	$('.datepicker').change(function(){
		//console.log('datepicker:',$(this).val())
		var clickDate = $(this).val()
		if(confirm('날짜를 변경하시면 해당 날짜의 정보가 저장되지않습니다.\r\n변경하시겠습니까?')){
			location.href='/project/ClickDate.do?clickDate='+clickDate;
			/*
			$('.clickDate').html($(this).val());
			$('.acco:eq(0)').find('[name=condition]').removeClass();
			$('.acco:eq(1)').find('span').each(function(){
				$(this).removeClass()
				$(this).addClass('btn btn-outline-secondary');
			});
			$('.add:eq(0)').find('input:eq(0)').val('비타민').end().find('input:eq(1)').val('').end();
			$('.add:eq(1)').find('input:eq(0)').val('철분제').end().find('input:eq(1)').val('').end();
			$('.add:eq(2)').find('input:eq(0)').val('엽산').end().find('input:eq(1)').val('').end();
			$('.add').slice('3').remove();
			$('.allergy').removeClass('full');
			$('[name=h]').val('');
			$('[name=w]').val('');
			$('#content').val('');
			$('.datepicker').css('display','none');
			*/
			//확인,수정,삭제 어떻게 보일 지
			var isExist = false;
			console.log('저장된 날짜:',dates.split(" "))
			console.log('클릭한 날짜:',$('.clickDate').html())
			dates.split(" ").forEach(function(d){
				if($('.clickDate').html()==d){//클릭한 날짜에 기록이 있을 시
					return isExist = true;
				}	
			});//////////forEach
			if(isExist){
				$('.memoSend:eq(0)').css('display','none');
				$('.memoSend').slice(1).css('display','');
			}
			else{//클릭한 날짜에 기록이 없을 시
				$('.memoSend:eq(0)').css('display','');
				$('.memoSend').slice(1).css('display','none');
			}
			
		}
	});
	
	//컨드롤러에서 가져온 정보 꾸리기(기본값=오늘날짜)
	var current_ = '<c:out value="${current}"/>';
	var current = current_.length==0 ? '<c:out value="${clickDate}"/>' : current_;
	//console.log('click:',$('.clickDate').html())
	//console.log('dates:',dates.length)
	if(dates.length && $('.clickDate').html()==current){//기본값=오늘날짜
		var info_con = '<c:out value="${condition}"/>';
		if(info_con.length && $('.acco').find('[alt='+info_con+']')){
			$('.acco').find('[alt='+info_con+']').addClass('circle');
		}
		var info_head = '<c:out value="${head}"/>';
		//console.log('head:',info_head)
		$('#head').children().each(function(){
			if(info_head.includes($(this).html())){
				$(this).removeClass('btn-outline-secondary')
				$(this).addClass('btn-danger');
				$(this).toggleClass('headSelcted');
			}
		});
		var info_resp = '<c:out value="${resp}"/>';
		//console.log('resp:',info_resp)
		$('#resp').children().each(function(){
			if(info_resp.includes($(this).html())){
				$(this).removeClass('btn-outline-secondary')
				$(this).addClass('btn-danger');
				$(this).toggleClass('respSelcted');
			}
		});
		var info_stom = '<c:out value="${stom}"/>';
		//console.log('stom:',info_stom)
		$('#stomach').children().each(function(){
			if(info_stom.includes($(this).html())){
				$(this).removeClass('btn-outline-secondary')
				$(this).addClass('btn-danger');
				$(this).toggleClass('stomachSelcted');
			}
		});
		var info_ment = '<c:out value="${ment}"/>';
		//console.log('ment:',info_ment)
		$('#mental').children().each(function(){
			if(info_ment.includes($(this).html())){
				$(this).removeClass('btn-outline-secondary')
				$(this).addClass('btn-danger');
				$(this).toggleClass('mentalSelcted');
			}
		});
		var info_chest = '<c:out value="${chest}"/>';
		//console.log('chest:',info_chest)
		$('#chest').children().each(function(){
			if(info_chest.includes($(this).html())){
				$(this).removeClass('btn-outline-secondary')
				$(this).addClass('btn-danger');
				$(this).toggleClass('chestSelcted');
			}
		});
		var info_body = '<c:out value="${body}"/>';
		//console.log('body:',info_body)
		$('#body').children().each(function(){
			if(info_body.includes($(this).html())){
				$(this).removeClass('btn-outline-secondary')
				$(this).addClass('btn-danger');
				$(this).toggleClass('bodySelcted');
			}
		});
		var info_nutr = '<c:out value="${nutr}"/>';
		console.log('info_nutr:',info_nutr.split('$').length)
		var nutr;
		var count;
		if(info_nutr.length && info_nutr.split('$').length!=3){
			var clone = $('.add:eq(0)').clone();
			$('.add').remove()
			var k = info_nutr.split('$').length;
			var target = $("#add");
			var appendedList = Array(k).fill(null).map(_ => clone.clone());
			target.before(appendedList);
			
			info_nutr.split('$').forEach(function(item,index){
				nutr = item.split('/')[0];
				count = item.split('/')[1];
				$('.add:eq('+index+')').children(':eq(0)').val(nutr).end().children(':eq(1)').val(count);
			});
		}
		else if(info_nutr.length){ //0개가 아닐 때 일 때
			info_nutr.split('$').forEach(function(item,index){
				nutr = item.split('/')[0];
				count = item.split('/')[1];
				if(info_nutr.split('$').length==3){
					$('.add:eq('+index+')').children(':eq(0)').val(nutr).end().children(':eq(1)').val(count);
				}
			});
		}
		
		var info_allergy = '<c:out value="${allergy}"/>';
		info_allergy.split(' ').forEach(function(item){
			$('.allergy').children('small').each(function(){			
				//console.log('name:',$(this).html())
				//console.log('item:',item)
				if(item==$(this).html()){
					//console.log('allergy:',$(this).html())
					$(this).parent().addClass('full');
				}
			});
		});
		var info_h = '<c:out value="${height}"/>';
		$('[name=h]').val(info_h);
		var info_w = '<c:out value="${weight}"/>';
		$('[name=w]').val(info_w);
		var info_content = '<c:out value="${content}"/>';
		$('#content').val(info_content);
	}

	//확인,수정,삭제 어떻게 보일 지
	var isExist = false;
	dates.split(" ").forEach(function(d){
		if($('.clickDate').html()==d){//클릭한 날짜에 기록이 있을 시
			return isExist = true;
		}	
	});//////////forEach
	if(isExist){
		$('.memoSend:eq(0)').css('display','none');
		$('.memoSend').slice(1).css('display','');
	}
	else{//클릭한 날짜에 기록이 없을 시
		$('.memoSend:eq(0)').css('display','');
		$('.memoSend').slice(1).css('display','none');
	}
	
	//건강기록 저장하기
	$('.diaryStart').find('.memoSend').click(function(){
		//console.log('길이:',$('.acco').find('.circle').prop('alt')==undefined)
		var type;
		if($(this).html()=='확인'){
			type = 'submit';
		}
		else if($(this).html()=='수정'){
			type = 'edit';
		}
		else{
			type = 'delete';
		}
		console.log('type:',type)
		var condition = $('.acco').find('.circle').prop('alt') == undefined ? '' : $('.acco').find('.circle').prop('alt');
		
		var head='',respiratory='',stomach='',mental='',chest='',body = '';
		
		$('.acco').find('.headSelcted').each(function(){
			head += $(this).html()+' ';
		});
		head = head.substring(0,parseInt(head.length)-1);

		$('.acco').find('.respSelcted').each(function(){
			respiratory += $(this).html()+' ';
		});
		respiratory = respiratory.substring(0,parseInt(respiratory.length)-1);

		$('.acco').find('.stomachSelcted').each(function(){
			stomach += $(this).html()+' ';
		});
		stomach = stomach.substring(0,parseInt(stomach.length)-1);

		$('.acco').find('.mentalSelcted').each(function(){
			mental += $(this).html()+' ';
		});
		mental = mental.substring(0,parseInt(mental.length)-1);

		$('.acco').find('.chestSelcted').each(function(){
			chest += $(this).html()+' ';
		});
		chest = chest.substring(0,parseInt(chest.length)-1);

		$('.acco').find('.bodySelcted').each(function(){
			body += $(this).html()+' ';
		});
		body = body.substring(0,parseInt(body.length)-1);
		
		//복용 영양제+정 수
		var nutrients = '';
		$('.add').find('input').each(function(index){
			//console.log('count:',count)
			if(index%2==0){
				nutrients += $(this).val();
			}
			else{
				nutrients += '/'+$(this).val()+'$';
			}		
		});
		nutrients = nutrients.substring(0,parseInt(nutrients.length)-1);
		console.log('allergy:',$('.acco').find('input.allergy'))
		//알레르기
		var allergy = '';
		$('.acco').find('.full').each(function(){
			allergy += $(this).find('small').html()+' ';
		});
		$('.acco').find('input.allergy').each(function(){
			allergy += $(this).val()+' ';
		});
		allergy = allergy.substring(0,parseInt(allergy.length)-1);

		$.ajax({
			data:{
				type:type,
				mm_Date:$('.clickDate').html(),
				mm_Id:$('#id').html(),
				mm_Condition:condition,
				mm_Head:head,
				mm_Resp:respiratory,
				mm_Stomach:stomach,
				mm_Mental:mental,
				mm_Chest:chest,
				mm_Body:body,
				mm_Nutrients:nutrients,
				mm_Allergy:allergy,
				mm_Height:height.value,
				mm_Weight:weight.value,
				mm_Content:$('[name=content]').val()
			},
			url:'/project/Memo.do',
			dataType:'json',
			method:'post'
		}).done(function(data){
			console.log('success',data);
			if(data.type=='submit'){
				alert('건강기록이 저장되었습니다');//swal 수정하기!!!!!!!!!!!!!!!!!!!!!!!!
			}
			else if(data.type=='edit'){
				alert('건강기록이 수정되었습니다');
			}
			else{
				alert('건강기록이 삭제되었습니다');
			}
			location.href='/project/MyPage.do';
		}).fail(function(){
			console.log('fail');
		});
		return false;
	});

/*
	//'+' 아이콘에 속성 추가(모달,마진)
	$('.fa-plus').each(function(){
		$(this).attr({'data-toggle':"modal",'data-target':"#myModal",style:'margin-left: 5px; cursor: pointer;'});
	})
*/
	//증상체크
	$('.head').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('headSelcted');
		});
	});
	$('.respiratory').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('respSelcted');
		});
	});
	$('.stomach').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('stomachSelcted');
		});
	});
	$('.mental').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('mentalSelcted');
		});
	});
	$('.chest').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('chestSelcted');
		});
	});
	$('.body').next().children().each(function(){
		$(this).click(function(){
			$(this).toggleClass('btn-outline-secondary');
			$(this).toggleClass('btn-danger');
			$(this).toggleClass('bodySelcted');
		});
	});
	
	//컨디션 아이콘 클릭 이벤트
	$('.acco:eq(0)').children().click(function(){
		$('.acco:eq(0)').children().removeClass('circle');
		$(this).toggleClass('circle');
	});
	
	//알레르기 아이콘 클릭 이벤트
	$('.allergy').click(function(){
		$(this).toggleClass('full');
	});
	
	//복용 영양제 삭제하기
	$('.xmark').click(function(){
		$(this).parent().remove()
	});
	
	//이미지 수정하기
	$('#imgEdit').click(function(){
		$(this).attr('data-toggle','modal');
		$('form').attr('action','<c:url value="/project/ProfImgEdit.do"/>');
		$('form').attr('enctype','multipart/form-data');
		$('.modal-title').html('수정할 프로필 이미지를 선택해주세요');
		$('input[type=password]').css('display','none');
		$('.custom-file').css('display','');
		$('a[name=defaultImg]').css('display','');
		
		$(".custom-file-input").on("change", function() {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings().html(fileName);
        });
	})

	//회원 정보 수정하기
	$('#infoEdit').click(function(){
		$(this).attr('data-toggle','modal');
		$('form').attr('action','<c:url value="/project/Password.do"/>');
		$('.modal-title').html('회원정보 수정을 위해 비밀번호를 입력해주세요');
		$('.custom-file').css('display','none');
		$('a[name=defaultImg]').css('display','none');
		$('input[type=password]').css('display','');
	});
})(jQuery)

	//복용 영양제 추가하기
	function addList(){
		var origin = $('#add').prev();
		var clone = origin.clone();
		origin.after(clone.children(':eq(0)').val('').end().children(':eq(1)').val('').end())
		//복용 영양제 삭제하기
		$('.xmark').click(function(){
			$(this).parent().remove()
		});
	}
	
	//bmi 계산
 	var bmi = document.querySelector('.c-bmi');
 	var height = bmi.querySelector('input[name=h]');
 	var weight = bmi.querySelector('input[name=w]');
 	var gram = bmi.querySelectorAll('input[name=g]');
 	function result(){
 		bmi.querySelector('.c-bmi__groups').style.display='';
		var e=parseInt(height.value), //키 숫자타입으로 구하기
			t=parseInt(weight.value),//체중 숫자타입으로 구하기
		    i=parseFloat(t/(e/100)**2).toFixed(2),//bmi계산
		    h=[[0,18.49],[18.5,22.99],[23,24.99],[25,29.99],[30,100]]
	    	.findIndex(e=>
	        	e[0]<=i && i<e[1]
	        );            
	    gram[h].checked=!0
	
	    /*
	    [표준체중 계산 방법]
	    - 남성: 키(m) × 키(m) × 22
	   - 여성: 키(m) × 키(m) × 21
	    */
	   m=((e/100)*(e/100)*22).toFixed(2) //남자 표준 체중
	   f=((e/100)*(e/100)*21).toFixed(2) //여자 표준 체중

	   //성별 먼저 확인하기**************************
	   if(h!=1){
	   		//console.log('당신의 적정 체중은'+(m-t)+'kg 입니다');
	        bmi.lastElementChild.innerHTML='당신의 BMI 지수는 <span class="text-info">'+i+'</span>이고<br/>적정 체중은 <span class="text-info">'+((m-t)>=0?"+"+(m-t).toFixed(2):(m-t).toFixed(2))+'kg</span> 입니다';
	   }
	   else{
	   		bmi.lastElementChild.innerHTML='정상입니다'
	   }
	   	bmi.addEventListener('submit', result);
		bmi.dispatchEvent(new Event('input'));   
	}

	
	/*
	//알레르기 추가하기
	function addInput(name){
		var valueTag = name.length==0 ?
				`<input class="form-control allergy" placeholder="알레르기명" style="height: 35px; width: 110px">` : 
				`<input class="form-control allergy" value=name style="height: 35px; width: 110px">`;
		var inputTag = `<div class="row m-1">`
						+ valueTag +
						`<i class="xmark fa-regular fa-circle-xmark ml-2 align-self-center"></i>
					</div>`;
		$('#addInput').prev().after(inputTag);
		
		//추가한 알레르기 삭제하기
		$('.xmark').click(function(){
			$(this).parent().remove()
		});
	}
	*/
</script>
<script>
	const firebaseConfig = {
        apiKey: "AIzaSyBVyjlJuzy9Qd41-v2meIh79Ti7OEm0TSc",
        authDomain: "my-project-a3614.firebaseapp.com",
        projectId: "my-project-a3614",
        storageBucket: "my-project-a3614.appspot.com",
        messagingSenderId: "337911613778",
        appId: "1:337911613778:web:707752d0cacb5e27eed28b",
        measurementId: "G-D28J07Z2PH"
    };
	
	firebase.initializeApp(firebaseConfig);
	
	document.addEventListener('DOMContentLoaded', function() {
		if ('serviceWorker' in navigator) {
			const messaging = firebase.messaging();        	
	        navigator.serviceWorker.register("../firebase-messaging-sw.js")
                    .then(register => {         
                    	//console.log('register:',register)
                         messaging.requestPermission()
                        .then(function() {
                            return messaging.getToken();  
                        })
                        .then(async function(token) {
                        	//Firebase콘솔에 앱과 웹 두개를 추가하고 그래야 메시지 전송버튼이 보임
                            //아래 토큰을 복사해서 파이어베이스 콘솔에서 메시지를 보낸다
                            //혹은 스프링 REST API에서 메시지를 보낸다
                        	await fetch('/webpush', { method: 'post', body: token})
                        	
                        	//포그라운드일 때
                            messaging.onMessage(payload => {
                            	var dts = new Date(2023, 6, 22, 19, 51, 0, 0);
                                const title = payload.notification.title
                                const options = {
                                    body : payload.notification.body,
                                    icon: payload.notification.icon,
                                    timestamp: dts
                                }
                                //const notification = new Notification(title,options);
								
                                navigator.serviceWorker.ready.then(registration => {
                                    registration.showNotification(title, options);
                                    console.log('time:',options.timestamp)
                                })
                                
                            })
                        })
                        .catch(function(err) {
                            console.log("Error Occured");
                        })
                    })
		}
	})
</script>