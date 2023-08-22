<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="m" uri="/WEB-INF/tlds/common.tld" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>    
    <script src="https://kit.fontawesome.com/dedb6fdace.js" crossorigin="anonymous"></script>
    
    <!-- firebase -->
	<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/8.1.1/firebase-messaging.js"></script>

    <!-- fontaswem-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>    
  	
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value="/tsfolder/lib/animate/animate.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/tsfolder/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/tsfolder/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"/>" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet  누나꺼랑 겹침
    <link href="/tsfolder/css/bootstrap.min.css" rel="stylesheet">
     -->

    <!-- Template Stylesheet -->
    <link href="<c:url value="/tsfolder/css/style.css"/>" rel="stylesheet">
	
	<!-- Template Javascript -->
	<script src="<c:url value="/tsfolder/js/main.js"/>" ></script>
     
    <!-- googlefont -->
	<link rel="preconnect" href="https://fonts.googleapis.com" crossorigin> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2? family=Hahmlet&family=Nanum+Myeongjo&family=Stylish&display=swap" rel="stylesheet">
	<title>TemplateApplyingModule.jsp</title>
	<style>
        .bs-canvas-overlay {
            opacity: 0.85;
            z-index: 1100;
        }
        .bs-canvas {
            top: 0;
            z-index: 1110;
            overflow-x: hidden;
            overflow-y: auto;
            width: 330px;
            transition: margin .4s ease-out;
            -webkit-transition: margin .4s ease-out;
            -moz-transition: margin .4s ease-out;
            -ms-transition: margin .4s ease-out;
        }
        .bs-canvas-left {
            left: 0;
            margin-left: -330px;
        }
        .bs-canvas-right {
            right: 0;
            margin-right: -330px;
        }
        .bg-gra{
            background:white;
            z-index: 500;
            box-shadow: rgba(101, 101, 101, 0.3) 2px 2px 4px 4px;
        }
        .bg-gra1{
		    background: #FDCDBC;
            z-index: 500;
        }
        .text1{
            font-size: 3rem;
        }
        .text2{
        	font-size: 1.25rem;
        }
        /* 버튼 애니메이션 */
		.sidemenu a{
			display: block;
		    height: 60px;
		    line-height: 60px;
		    width: 100%;
		    position: relative;
		    margin-left: 17px;
		    color:black;
		    /*border-bottom: 3px dashed rgb(101, 101, 101, 0.3);*/
		}


.ditem {
	display:flex;
	flex-direction: column;
	justify-content: space-between;
	line-height: 30px;
	margin: 0px;
}
.ditem a {
	align-items:center;
	margin: 10px;
	padding: 3.5px;
	text-decoration: none;
}
.tsnavul {
	text-decoration: none;
	justify-content: center;
	align-items: center;
}
.tsnavli {
	margin: 0px 30px;
	color:black;
}
.tsnava1 {
	color: #FD9F28;
	font-weight: 600;
	align-items: center;
	font-size: 21px;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
}
.tsnava2 {
	color: #EF605D;
	font-weight: bold;
	font-size: 40px;
	align-items: flex-end;
    text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    margin-right: 5px;
    padding-top: 0px;
}
.tsnava3 {
	color: black;
	font-weight: bold;
	font-size: 16px;
    padding-top: 10px;
    margin-right: 20px;
}
.tsnava1:hover {
	color:black;
	text-decoration: none;
}
.tslogina span:hover {
	color:gray;
	text-decoration: none;
}

.tsnava2:after {
	display: none;
}
ul {
	list-style: none;
	margin-bottom: 0px;
}
		/* 드롭다운 버튼 스타일 */
        .dropdown-toggle {
            padding: 2px;
            cursor: pointer;
        }

        .dropdown-toggle:hover {
            color: black;
            text-decoration: none;
        }

        /* 드롭다운 메뉴 스타일 */
        .dropdown-menu {
        	width:1770px;
            border: none;
            background-color: rgba(0,0,0,0);
        }
/*탑 메뉴 토글바 */
#ts__menu {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    z-index: 100;
    box-sizing: border-box;
}
#ts__menu .ts__menu__bg {
    position: fixed;
    width: 100%;
    height: 100%;
    left:0;
    background-color: rgba(0,0,0,0.32);
}
#ts__menu .pc__ts__menu {
    position: absolute;
    top: 20px;
    left: 260px;
    width: 1400px;
    background-color: #fff;
    padding-bottom: 20px;
    background-image: url(https://www.bundangcheil.com/images/pc_ham_menu_bg.svg);
    background-repeat: no-repeat;
    background-position: 95% 100%;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
    border-radius: 50px 0px 50px 50px;
    border: 2px solid #EF605D;
}
#ts__menu .ts__box {
    width: 100%;
    max-width: 1500px;
    margin: 0 auto;
    display: flex;
    border: 1px solid rgba(112,112,112,0.15);
    border-top: 0;
    border-bottom: 0;
    min-height: 390px;
    height: 100%;
}
#ts__menu .ts__box .left__wr {
    width: calc(100% - 400px);
    display: flex;
}
#ts__menu .ts__box .left__wr li {
    width: 25%;
    border-right: 1px solid rgba(112,112,112,0.15);
    padding: 45px 34px;
    list-style: none;
}
#ts__menu .ts__box .left__wr li .title {
    font-size: 22px;
    font-weight: bold;
    color: #152358;
    padding-bottom: 30px;
}
#ts__menu .ts__box .left__wr li a {
    display: block;
    width: 100%;
    text-decoration: none;
    line-height: 50px;
    color: black;
    font-size: 16px;
    font-weight: bold;
}
#ts__menu .ts__box .right__wr {
    width: 400px;
    padding-top: 20px;
    margin-bottom: 20px;
    text-align: center;
    position: relative;
}
#ts__menu .ts__box .right__wr div a {
    text-decoration: none;
    font-weight:bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    color: black;
}
#ts__menu .ts__box .right__wr .home__btn {
    display: inline-block;
    width: 102px;
    height: 40px;
    line-height: 40px;
    border: none;
    border-radius: 50px;
    background-color: #FDCDBC;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    margin-top: 26px;
}
.down__btn{
	display: inline-block;
    width: 125px;
    height: 40px;
    line-height: 40px;
    border: none;
    border-radius: 50px;
    background-color: #FDCDBC;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    margin-top: 26px;
    margin-left: 5px;
}
	/* 챗봇 관련 CSS */
	/* 버튼 관련 디자인*/
       #btnBot{
            position: fixed;
            right: 40px;
            bottom: 40px;
            z-index:3000;
            cursor:pointer;
        }
        .clickBtn{
            list-style: none;
            position: relative;
            display: inline-block;
            width: 60px;
            height: 60px;
        }
        @-moz-keyframes rotate {
            0% {transform: rotate(0deg);}
            100% {transform: rotate(-360deg);}
        }
        @-webkit-keyframes rotate {
            0% {transform: rotate(0deg);}
            100% {transform: rotate(-360deg);}
        }
        @-o-keyframes rotate {
            0% {transform: rotate(0deg);}
            100% {transform: rotate(-360deg);}
        }
        @keyframes rotate {
            0% {transform: rotate(0deg);}
            100% {transform: rotate(-360deg);}
        }
        .round {
            display: flex;
            align-items :center;
            justify-content :center;
            position: absolute;
            left: 0;
            top: 0;
            width: 70px;
            height: 67px;
            padding-bottom : 4px;
            text-decoration: none;
            text-align: center;
            font-size: 20px;
            text-shadow: 0 1px 0 rgba(255,255,255,.7);
            letter-spacing: -.065em;
            -webkit-transition: all .25s ease-in-out;
            -o-transition: all .25s ease-in-out;
            -moz-transition: all .25s ease-in-out;
            transition: all .25s ease-in-out;
            box-shadow: 2px 2px 7px rgba(0,0,0,.2);
            border-radius: 300px;
            z-index: 3500;
            border-width: 4px;
            border-style: solid;
        }
        .round:hover {
            width: 130%;
            height: 130%;
            left: -15%;
            top: -15%;
            font-size: 15px;
            padding-top: 20px;
            -webkit-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
            -o-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
            -moz-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
            box-shadow: 5px 5px 10px rgba(0,0,0,.3);
            z-index: 4000;
            -webkit-transform: rotate(-360deg);
            -moz-transform: rotate(-360deg);
            -o-transform: rotate(-360deg);
            transform: rotate(-360deg);
        }
        .colorBtn {
            background-color: #FF6666;
            color: white;
            border-color: #EF605D;
        }
        .colorBtn:hover {
            color: rgb(255, 92, 33);
        }
        .round span.round {
            display: block;
            opacity: 0;
            -webkit-transition: all .5s ease-in-out;
            -moz-transition: all .5s ease-in-out;
            -o-transition: all .5s ease-in-out;
            transition: all .5s ease-in-out;
            font-size: 1px;
            border: none;
            padding: 40% 20% 0 20%;
            color: #fff;
            animation-name: btn_ani;
        }
        .round span:hover {
            opacity: .85;
            font-size: 12px;
            -webkit-text-shadow: 0 1px 1px rgba(0,0,0,.5);
            -moz-text-shadow: 0 1px 1px rgba(0,0,0,.5);
            -o-text-shadow: 0 1px 1px rgba(0,0,0,.5);
            text-shadow: 0 1px 1px rgba(0,0,0,.5);	
        }
        .colorBtn span {
            background: #FF928C;		
        }
        @keyframes btn_ani{
            0%{
                transform: translate(500px,500px);
            }
            100%{

            }
        }
        /* 챗창 내부 디자인 */
        .textdialog{
            width: 100%;
            height: 423px;
            background-color: #FFEDD4;
            overflow:auto;
        }
        .skeleton-user{
        	max-width:300px;
            background-color:#FFDACC;
            border-radius: 15px 0px 15px 15px;
		    position: relative;
		    padding: 10px;
		    margin: 0;
		    color: black !important;
        }

        .skeleton-gpt{
        	max-width:300px;
            background-color:#FFC7B2;
            border-radius: 0px 15px 15px 15px;
		    position: relative;
		    padding: 10px;
		    margin: 0;
		    color: black !important;
        }
        .gtp_ans_img{
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #BFDAFF;
        }
        .bot_title{
            width: 40%;
        }
        .btn_x{
            width:40px;
            position: relative;
            left:190px;
        }
        .chatbot-line{
        	background-color: rgba(255, 124, 76, 0.3); 
        	width: 400px;
        	height: 2px;
        	margin-left: 5px;
        }
        .usersQuestion, .gptAnswer{
            font-size: 16px;
            
        }
        .chatbot{
            width: 450px;
            height: 580px;
            position:fixed;
            background-color: #ffedd4;
            border: 4px solid #FFB499;
            border-radius: 4%;
            top:215px;
            right:70px;
            display: none;
            z-index: 5000;
            animation-name: box_ani;
            animation-duration: 1.5s;
        }
        @keyframes box_ani {
            0% {
                transform: scale(0,0);
            }
            50% {
                transform: scale(1,0.002);
            }
            100% {
                transform: scale(1,1);
            }
        }
        .form-control:focus {
		    box-shadow: none !important;
		    outline: none; 
		    border: 1px solid gray !important;
		}
		.search_btn{
			padding: 0 !important; 
		    width: 0px; 
		    height: 0px;
		    margin-left: 5px !important;
		}
		.search_btn:focus{
			box-shadow: none !important;
		}
        /* 검색시 대기시간동안 띄우는 로딩 애니메이션 */
        .loading_dot{
            display: none;
            width: 155px;
            height: 50px;
            background: #ffffff;
            position: relative;
            border-radius: 10px;
            top:-280px;
            left: 120px;
            z-index: 6000;
            box-shadow: 3px 3px 5px gray;
        }
        .loading_dot span {
            display: inline-block;
            vertical-align: middle;
            width: .6em;
            height: .6em;
            margin: .19em;
            background: #007DB6;
            border-radius: .6em;
            animation: loading_b 1s infinite alternate;
        }
        .loadbar{
            color: #383838;
            margin: 0;
            font-size: .8em;
        }

        .loading_dot span:nth-of-type(2) {
            background: #008FB2;
            animation-delay: 0.2s;
        }
        .loading_dot span:nth-of-type(3) {
            background: #009B9E;
            animation-delay: 0.4s;
        }
        .loading_dot span:nth-of-type(4) {
            background: #00A77D;
            animation-delay: 0.6s;
        }
        .loading_dot span:nth-of-type(5) {
            background: #00B247;
            animation-delay: 0.8s;
        }
        .loading_dot span:nth-of-type(6) {
            background: #5AB027;
            animation-delay: 1.0s;
        }
        .loading_dot span:nth-of-type(7) {
            background: #A0B61E;
            animation-delay: 1.2s;
        }
        @keyframes loading_b {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        
		/*STT & TTS*/
		#startBtn, #startTtsBtn, #stopTtsBtn{
		     background-color: transparent; 
		     border: none; 
		     cursor: pointer; 
		     transition-property: outline-offset, outline-color, background-color;
		     transition-duration: .3s; 
		     padding: 0;
		}
	  	#startBtn:hover, #startTtsBtn:hover, #stopTtsBtn:hover{
             outline-offset: 4px;
        }
		#startBtn:hover img, #startTtsBtn:hover img, #stopTtsBtn:hover img{
		     animation: shake .3s; 
		}
		@keyframes shake { 
		     10%{transform: rotate(15deg);}
		     20%{transform: rotate(-15deg);}
		     30%{transform: rotate(15deg);}
		     40%{transform: rotate(-15deg);}
		}
		
		#voice{
			display : block;
			font-weight: 600;
			min-width : 160px;
			border-radius: 8px;
			overflow : scroll !important;
		}
		.skeleton-gpt:hover,
		#voice:hover,
		.hide-des:hover{
			cursor: pointer; 
		}
		.skeleton-gpt.active-color {
		    color: #C24A1F !important;
		}
		.scrollbar { 
		  width: 100%;
          height: 423px;
		  overflow-y: scroll;
		}
		
		.scrollbar::-webkit-scrollbar {
		    width: 10px;  
		}
		
		.scrollbar::-webkit-scrollbar-thumb {
		    background: rgba(255, 128, 128, 1);
		    border-radius: 10px;
		}
		
		.scrollbar::-webkit-scrollbar-track {
		    background: rgba(255, 128, 128, .1);
		    border-radius: 10px;
		    margin-top: 10px;
		}
		
		/*Q-bot 내부 메뉴바*/	
		#ham-menu {
		  display: none;
		}
		label[for="ham-menu"] {
		  display: block;
		  position: fixed;
		  z-index: 999;
		  width: 30px;
		  height: 28px;
		  border-radius: 11px;
		  border: 2px solid #FF7E00;
		}
		.ham-menu {
		  position: fixed;
		  visibility: hidden;
		  transform: translate(30%);
		  z-index: 800;
		  transition: 1s;
		  bottom: 165px;
		}
		#ham-menu:checked ~ div.ham-menu {
		  transform: translate(0px);
		  visibility: visible;
		}
		
		[for="ham-menu"] > div {
		  width: 100%;
		  height: 100%;
		  display: flex;
		  flex-flow: column wrap;
		  align-content: center;
		  align-items: center;
		}
		.menu-line {
		  width: 8px;
		  height: 2px;
		  margin-top : 4px;
		  margin-bottom : 1px;
		  background-color: #FF7E00;
		  transition: 400ms;
		  transform-origin: right center;
		}
		.ham-menu-text{
			font-size: 12px;
			color: black !important;
		}
		[for="ham-menu"] > div > span:nth-child(4),
		[for="ham-menu"] > div > span:nth-child(5),
		[for="ham-menu"] > div > span:nth-child(6) {
		  transform-origin: left center;
		}
		#ham-menu:checked + label span {
		  background-color: #FF7E00;
		}
		#ham-menu:checked + label span:nth-child(2),
		#ham-menu:checked + label span:nth-child(5) {
		  transform: scale(0);
		}
		#ham-menu:checked + label span:nth-child(1) {
		  transform: translateY(7px) rotate(45deg);
		}
		#ham-menu:checked + label span:nth-child(4) {
		  transform: translateY(7px) rotate(-45deg);
		}
		#ham-menu:checked + label span:nth-child(3) {
		  transform: translateY(-7px) rotate(-45deg);
		}
		#ham-menu:checked + label span:nth-child(6) {
		  transform: translateY(-7px) rotate(45deg);
		}
		.tset {
			border: 0px;
			border-radius:20px;
			background-color: rgba(0, 0, 0, 0.0);
			color: #FD9F28;
			font-weight: 600;
			align-items: center;
			font-size: 21px;
			text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
		}

			
    </style>
</head>
<body>
<div class="container-fluid position-relative p-0" style="width:100%;">
	 <nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="justify-content:space-around; padding:0px;" id="navbar">

        <a class="navbar-brand" href="<c:url value='/' />">
        	<img src="<c:url value='/images/mainicon.png' />" width="50" height="40">
        	<img src="<c:url value='/images/maintitle.png' />" width="160" height="40">
        </a>
        
        <ul class="tsnavul d-flex" style="margin-bottom: 2px;">
        	<c:if test="${empty mainpagenum}">
        	<li class="tsnavli">
	            <a class="tsnava1" href="<c:url value="/NutrientSelect.do"/>">
	             영양소 검색
	            </a>
	       </li>
	       <li class="tsnavli">
	            <a class="tsnava1" href="<c:url value="/ranking/selectfood.do"/>">
	             영양제 검색
	            </a>
	       </li>
	       <li class="tsnavli" >
	            <a class="tsnava1" href="<c:url value="/magazineindex.do"/>">
	             메디큐 칼럼
	            </a>
	       </li>
	       <li class="tsnavli">
	            <a class="tsnava1" href="<c:url value="/board/List.do" />">
	             맞춤 상담 Q&A
	            </a>
	       </li>
	       </c:if>
	       <c:if test="${mainpagenum == 1}">
	       	  <li class="tsnavli"><button class="tset" id="tssection1" type="button">홈</button></li>
	       	  <li class="tsnavli"><button class="tset" id="tssection2" type="button">영양소</button></li>
			  <li class="tsnavli"><button class="tset" id="tssection3" type="button">영양제</button></li>
			  <li class="tsnavli"><button class="tset" id="tssection4" type="button">분석</button></li>
			  <li class="tsnavli"><button class="tset" id="tssection5" type="button">질병예측</button></li>
			  <li class="tsnavli"><button class="tset" id="tssection6" type="button">Q&A</button></li>
			  <li class="tsnavli"><button class="tset" id="tssection7" type="button">매거진</button></li>
			  <li class="tsnavli"><button class="tset" id="tssection8" type="button">지도</button></li>
	       </c:if>
        </ul>
        
        <fmt:bundle basename="config.tokens">
			<fmt:message key="secret-key" var="key"/>
        </fmt:bundle>
        <c:set var="token" value="${cookie['User-Token'].value }"/>
        <c:set var="payload" value='${m:getTokenPayloads(token,key) }' />
        <ul class="d-flex" style="margin:0px 30px 7px 0px;">
        	<li class="text2 mx-1 dropdown mt-1" style="display:flex; align-items: center;">
        		<c:if test="${not empty token}" var="isLogin">       
                    <a class="tslogina" style="text-decoration: none;" href="<c:url value="/project/MyPage.do"/>"><span class="tsnava3" >마이페이지</span></a>
                    <a class="tslogina" style="text-decoration: none;" href="<c:url value="/project/Logout.do"/>"><span class="tsnava3" >로그아웃</span></a>
                </c:if>
                <c:if test="${not isLogin}">
                    <a class="tslogina" style="text-decoration: none;" href="<c:url value="/project/Login.do"/>"><span class="tsnava3" >로그인</span></a>
                    <a class="tslogina" style="text-decoration: none;" href="<c:url value="/project/Join.do"/>"><span class="tsnava3" >회원가입</span></a>        
                </c:if>
        	</li>
	        <li class="text2 mx-2 dropdown">
	            <!--<a class="tsnava2 dropdown-toggle" role="button" id="navbarDropdown" data-toggle="dropdown">${empty token ? "로그인 후 이용해 주세요" : payload.name+="님 반갑습니다" }</a>-->
	             <a class="tsnava2 dropdown-toggle" role="button" id="navbarDropdown" data-toggle="dropdown">&#9776;</a>
	            <div class="dropdown-menu dropdown-menu-right" style="text-align: center;" aria-labelledby="navbarDropdown">
	            	<div id="ts__menu" class="on" style="display: block;">
						<div class="ts__menu__bg"></div>
						<div class="pc__ts__menu">
							<div class="ts__box">
								<ul class="left__wr">
									<li>
										<p class="title">영양소 찾기</p>
										<a href="<c:url value="/NutrientSelect.do"/>">인기 영양소</a>
							            <a href="<c:url value="/NutrientSelectVitamin.do"/>">비타민</a>	   
							            <a href="<c:url value="/NutrientSelectMineral.do"/>">미네랄 및 기타영양소</a>	         
							            <a href="<c:url value="/NutrientSelectFunctional.do"/>">기능성 원료</a>
									</li>
									<li>
										<p class="title">영양제 찾기</p>
										<a href="<c:url value="/ranking/selectfood.do"/>">전체 검색</a>
							            <a href="<c:url value="/ranking/selectfoodnutrient.do"/>">성분 검색</a>	 			
							            <a href="<c:url value="/ranking/selectfoodcompany.do"/>">제품명/브랜드 검색</a>
							            <a href="<c:url value="/ranking/HealthSelect.do"/>">건강고민 검색</a>											
									</li>
									<li>
										<p class="title">정신건강 테스트</p>
										<a href="<c:url value="/project/MentalTest1.do"/>">심리적 스트레스</a>
										<a href="<c:url value="/project/MentalTest2.do"/>">흡연 유형 평가</a>			
										<a href="<c:url value="/project/MentalTest3.do"/>">알코올 의존(AUDIT-K)</a>				
										<a href="<c:url value="/project/MentalTest4.do"/>">우울증(CES-D)</a>									
									</li>
									<li>
										<p class="title">분석 / 추천</p>
										<a href="<c:url value="/analyzeMyFood.do"/>">건강 및 분석</a>
										<a href="<c:url value="/loadHealthInfo.do?userId=${payload.sub}"/>">발병위험도 예측</a>
										<c:if test="${payload.activeFl eq 'A' }">
											<a href="<c:url value="/AdminMain.do"/>">관리자</a>
										</c:if>
										<!--<a href="<c:url value="/functionfood/selectissue.do"/>">테스트1</a>  -->
										<c:if test="${payload.activeFl eq 'A' }">
										<a href="<c:url value="/food/test2.do"/>">식단 관리</a>
										</c:if>
									</li>
								</ul>
								<div class="right__wr">
									<img id="mascotImage" src="<c:url value="/images/tsimages/mascot.png"/>" style="height: 230px; width: 400px;" >
									<img id="qrImage" src="<c:url value="/images/tsimages/QR.png"/>" style="height: 200px; width: 250px; margin-left:75px; margin-top:30px; display:none;" >
									<!--  
									<div class="d-flex">
						                <c:if test="${not empty token}" var="isLogin">       
						                    <a class="dropdown-item" href="<c:url value="/project/MyPage.do"/>">마이 페이지</a>
						                    <a class="dropdown-item" href="<c:url value="/project/Logout.do"/>">로그아웃</a>
						                </c:if>
						                <c:if test="${not isLogin}">
						                    <a class="dropdown-item" href="<c:url value="/project/Login.do"/>">로그인</a>        
						                    <a class="dropdown-item" href="<c:url value="/project/Join.do"/>">회원가입</a>       
						                </c:if>
					                </div>
					                -->
									<a href="<c:url value='/' />" class="home__btn">Home<img src="https://www.bundangcheil.com/images/pcham_menu_arrow.svg" alt="이동"></a>
									<a href="<c:url value='#' />" class="down__btn" id="downloadButton">Download<img src="https://www.bundangcheil.com/images/pcham_menu_arrow.svg" alt="이동"></a>
								</div>
							</div>
						</div>
					</div>
	            </div>
	        </li>
	    </ul>
    </nav>
    
	<!-- 챗봇 파트 -->
	<!-- 챗봇 버튼 -->
	<div id="btnBot">
        <!-- <button class="btn btn-secondary" id="btnBot">MEDI-Q Bot</button> -->
        <div class="clickBtn">
            <div class="round colorBtn " onclick="showChatbot()">Q-Bot<span class="round font-weight-bold">무엇이든<br/>물어보세요</span></div>
        </div>
    </div>
	<!-- 챗봇 바디 -->
    <div class="chatbot" id="chatbot">
        <div class="container">
            <div class="p-2 mx-3 mt-3 mb-2">
                <img src="/images/chatbot/bot_title.png" class="bot_title mr-2"/>
                <img src="/images/chatbot/bot_x.png" class="btn btn_x"/>
            </div>
			<div class="chatbot-line"></div>
            <div class="textdialog scrollbar">
            	<!-- STT와 TTS 지원여부 확인 -->
	            <div class="alert alert-danger alert-dismissible fade show mb-0 mt-1">
				    <button type="button" class="close py-1" data-dismiss="alert">&times;</button>
				    <strong id="stt-msg" style="font-size: 12px; margin-left: 10px;"> </strong><br/>
				    <strong id="tts-msg" style="font-size: 12px; margin-left: 10px;"> </strong>
				</div>
                <div class="py-2 pl-2">
                    <div class="mt-2">
                    	<div class="d-inline-flex justify-content-center align-items-center p-0 m-1">
                                <img src="<c:url value="/images/chatbot/mascot_Bot.png"/>" class="gtp_ans_img"/>
                        </div>
                        <div class="skeleton-gpt row d-inline-flex align-content-center p-2 m-0">
                            <h6 class="gptAnswer d-flex justify-content-start align-items-center p-1 m-1">안녕하세요 큐봇입니다!<br/>무엇을 도와드릴까요?</h6>
                        </div>
                    </div>
                </div>
                <div class="userDialog py-2 pr-4" style="display:none;">
                    <div class="user_dialog d-flex flex-row-reverse p-1 m-0">
                        <div class="skeleton-user d-inline-flex p-1 m-0">
                        	<div class="usersQuestion d-flex justify-content-center align-items-center text-break p-0 m-2"></div>
                        </div>
                    </div>
                </div>
                <div class="gptDialog py-2 pl-2"style="display:none;">
               		<div class="d-flex">
	                	<div class="p-0 mx-1">
		                    <img src="<c:url value="/images/chatbot/mascot_Bot.png"/>" class="gtp_ans_img"/>
		                </div>
                        <div class="skeleton-gpt d-inline-flex align-content-center p-1 mx-1 mt-2">
                            <div class="gptAnswer d-flex justify-content-center align-items-center text-break pl-2 m-2">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="chatbot-line" style="margin-top: 10px;"></div>
            <div class="inputDIV input-group" style="margin-top: 10px;">
            	<input type="checkbox" id="ham-menu">
				<label for="ham-menu" class="ml-2 hamMenu" style="margin-top: 6px;">
				  <div class="hide-des">
				    <span class="menu-line"></span>
				    <span class="menu-line"></span>
				    <span class="menu-line"></span>
				    <span class="menu-line"></span>
				    <span class="menu-line"></span>
				    <span class="menu-line"></span>
				  </div>
				</label>
    			<div class="chatbotBottom d-flex">
				    <div class="position-relative" style="margin-left: 53px;">                   
				        <input type="text" class="form-control rounded-start bg-light" id="userInput" placeholder="무엇이든 물어보세요" style="width: 310px; height: 40px; padding-right: 45px; border-radius:45px;">
				        <button class="btn search_btn" type="button" style="position: absolute; right: 39px; bottom:88%; transform: translateY(-50%);"><img src="<c:url value='/images/chatbot/upload.png'/>" style="width: 35px; height: 35px;"></button>
				    </div>
				    <div class="input-group-append">
				    	<button id="startBtn" class="ml-2 mb-1"><img src="<c:url value='/images/chatbot/mike.png'/>" style="width: 37px;height: 37px; border-radius: 50%;"></button>
				    </div>
			    </div>
			    <div class="ham-menu ml-1" id="hamMenuContent">
			    	<b class="ham-menu-text" style="margin-left: 15px;">ON</b>
					<b class="ham-menu-text" style="margin-left: 23px;">STOP</b>
					<b class="ham-menu-text" style="margin-left: 23px;"><img src="<c:url value='/images/chatbot/microphone.png'/>" style="width: 23px;height: 27px; padding-bottom: 4px;">
					음성을 선택해주세요</b>
			    	<div class="d-flex">
					    <button id="startTtsBtn" class="mx-2"><img src="<c:url value='/images/chatbot/mikeON.png'/>" style="width: 35px;height: 36px; border-radius:15px;"></button>
			        	<button id="stopTtsBtn" class="mx-2"><img src="<c:url value='/images/chatbot/mikeStop.png'/>" style="width: 35px;height: 36px; border-radius:15px;"></button>
						<label for="voice" style=" margin-top: 8px;" class="mx-2">
						<select class="form-control p-1 ml-1" id="voice" style="width: 150px; height: 26px; font-size: 11px;"></select></label> 
					</div>
				</div>
			</div>
            
            <!-- 
            <div class="inputDIV input-group p-1 mt-1">
                <input type="text" class="form-control rounded-start bg-light" id="userInput" placeholder="무엇이든 물어보세요">
                <div class="input-group-append">
                    <button class="btn btn-warning search_btn font-weight-bold text-light" type="button">검색</button>
                </div>
            </div>
            -->
        </div>
        <!-- 내부 로딩바 -->
        <div class="loading_dot" tabindex="-1" role="dialog" aria-labelledby="loadingModalLabel" aria-hidden="true">
            <h2 class="pt-2 pl-3 loadbar">답변을 준비중입니다</h2>
            <div class="pl-2" role="document">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
   
</div>
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
    });

	//스크롤을 내리면 값에 변화에 따라 배경색 주기
	jQuery(document).ready(function ($) {
	    $(window).scroll(function () {
	        var $this = $(window);
	
	        if ($this.scrollTop() > 200) {
	            $('#navbar').addClass('bg-gra');
	        } else {
	            $('#navbar').removeClass('bg-gra');
	        }
	    });
	});
	

    //chatGTP 값 전달
    function sendToChatGPT(content){
        var cloneUserDialog = document.querySelector(".userDialog").cloneNode(true);
        var cloneGptDialog = document.querySelector(".gptDialog").cloneNode(true);
            
        cloneUserDialog.querySelector(".usersQuestion").innerHTML = content;//사용자가 입력한 값 받기
        cloneUserDialog.style.display='';
        document.querySelector(".textdialog").appendChild(cloneUserDialog);//사용자가 입력한 값 출력
            
        $.ajax({
            data:{content:content},
            url:'http://192.168.0.37:8080/chatGPT?content:'+content
        }).done(function(answer){
            console.log('success',answer)
            cloneGptDialog.querySelector(".gptAnswer").innerText = answer;
            cloneGptDialog.style.display='';
            document.querySelector(".textdialog").appendChild(cloneGptDialog);//입력값 출력
            document.querySelector(".textdialog").scrollTop = document.querySelector(".textdialog").scrollHeight;//스크롤 올라가는 부분
            $('.loading_dot').css("display","none");
        }).fail(function(e){
            console.log('error',e)
        });
    }
            
    //엔터 누르면 이동
    document.querySelector('#userInput').onkeypress = function(e){
        if(e.target.value !== '' && e.keyCode === 13){
            $('.loading_dot').css("display","block");//로딩창 생성
            sendToChatGPT(e.target.value);
            document.querySelector("#userInput").value = "";
        }
        else if(e.target.value === '' && e.keyCode === 13){
            var cloneGptDialog = document.querySelector(".gptDialog").cloneNode(true);
            cloneGptDialog.querySelector(".gptAnswer").innerHTML = "질문을 입력해주세요";
            cloneGptDialog.style.display='';
            document.querySelector(".textdialog").appendChild(cloneGptDialog);//입력값 출력
            document.querySelector(".textdialog").scrollTop = document.querySelector(".textdialog").scrollHeight;//스크롤 올라가는 부분
            document.querySelector("#userInput").value = "";
         }
     };
        
     //검색버튼 누르면 이동
     $(".search_btn").click(function(){
        var button = document.querySelector("#userInput").value;
        //console.log(button);
        if(button !== ''){
            $('.loading_dot').css("display","block");
            sendToChatGPT(button);
            document.querySelector("#userInput").value = "";
        }
        else{
            var cloneGptDialog = document.querySelector(".gptDialog").cloneNode(true);
            cloneGptDialog.querySelector(".gptAnswer").innerHTML = "질문을 입력해주세요";
            cloneGptDialog.style.display='';
            document.querySelector(".textdialog").appendChild(cloneGptDialog);//입력값 출력
            document.querySelector(".textdialog").scrollTop = document.querySelector(".textdialog").scrollHeight;//스크롤 올라가는 부분
            document.querySelector("#userInput").value = "";
        }
    });
        
    $(".btn_x").click(function(){
        var userDialogElements = document.querySelectorAll(".userDialog");
        var gptDialogElements = document.querySelectorAll(".gptDialog");

        for (var i = 1; i < userDialogElements.length; i++) {
            userDialogElements[i].remove();
        }
        for (var j = 1; j < gptDialogElements.length; j++) {
            gptDialogElements[j].remove();
        }
        $("#chatbot").css("display","none");
        $("#btnBot").css("display","block");
        $('.loading_dot').css("display","none");
    });
            
    function showChatbot() {
        document.getElementById('btnBot').style.display = 'none';
        document.getElementById('chatbot').style.display = 'block';
        document.querySelector("#userInput").focus();
    }
    
    /*stt,tts시작  */
	function startSynthesis() {
	    var selectedAnswers = document.querySelectorAll('.skeleton-gpt.active-color');
	    var voiceSelect = document.querySelector('#voice');
	    
	    selectedAnswers.forEach(function (selectedAnswer) {
	        //var utterance = new SpeechSynthesisUtterance(selectedAnswer.value);
	        var gptAnswerElement = selectedAnswer.parentElement;
	        var utterance = new SpeechSynthesisUtterance(gptAnswerElement.textContent);
	        console.log("문제해결중");
	        if (voiceSelect.value) {
	            console.log("문제해결중2");
	            var selectedVoice = speechSynthesis.getVoices().filter(function (voice) {
	                return voice.voiceURI == voiceSelect.value;
	            })[0];
	            console.log("selectedAnswer.value:", selectedAnswer.value);
	            utterance.voiceURI = selectedVoice.voiceURI;
	            utterance.lang = selectedVoice.lang;
	            /*
		         // 음성 합성이 완료된 후에 호출될 이벤트 핸들러
		            utterance.onend = function() {
		                startTtsBtn.style.display = "inline";
		                stopTtsBtn.style.display = "none";
		            };
	            */
	        }
	        window.speechSynthesis.speak(utterance);
	    });
	}/////////////////////////////////startSynthesis
	

    $(document).ready(function () {
    	
	    var startBtn = document.querySelector('#startBtn');
	    var startTtsBtn = document.querySelector('#startTtsBtn');
	    var stopTtsBtn = document.querySelector('#stopTtsBtn');
	
	    var sttMsg = document.querySelector('#stt-msg');
	    var ttsMsg = document.querySelector('#tts-msg');
	    var result = document.querySelector('#userInput');//질문
	    var chatGpt = document.querySelector('.gptAnswer');//응답
	    var voiceSelect = document.querySelector('#voice');
	    var skeletonGpt = document.querySelector('.skeleton-gpt');
	    
	    
	    var isRecognizing = false;
	    var recognition;
	
	    //대화상자(답변) 선택시 색상 변경
	    $(skeletonGpt).click(function() {
	        $(this).toggleClass("active-color");
	    });
	    $(document).on("click", ".gptDialog .skeleton-gpt", function() {
	        $(this).toggleClass("active-color");
	    });
	    /*
	    //startTtsBtn, stopTtsBtn 동작
	    function isColorChanged() {
	        return getComputedStyle(skeletonGpt).color === "rgb(255, 126, 0)";
	    }
	    startTtsBtn.addEventListener("click", function () {
	        const activeAnswer = document.querySelector(".gptDialog .skeleton-gpt.active-color");
	        if (activeAnswer || isColorChanged(activeAnswer)) {
	            startTtsBtn.style.display = "none";
	            stopTtsBtn.style.display = "inline";
	        }
	    });
	    stopTtsBtn.addEventListener("click", function () {
	        stopTtsBtn.style.display = "none";
	        startTtsBtn.style.display = "inline";
	    });
	    stopTtsBtn.style.display = "none";
	    */    
	    if (!('webkitSpeechRecognition' in window)) {
	        sttMsg.innerHTML = '현재의 브라우저는 <strong>STT</strong>를 지원하지 않습니다.';
	        startBtn.disabled = true;
	        result.placeholder = '음성인식이 안되는 브라우저입니다.아래 버튼이 비활성화 되었습니다'
	    } else {
	        sttMsg.innerHTML = '<img src="<c:url value="/images/magazine_images/basic/check.png"/>" style="width: 17px;height: 30px; padding-bottom:7px;"/>오늘의 건강 고민, 실시간으로 Q-Bot이 해결해드려요.';
	        startBtn.addEventListener('click', startRecognition);
	        initRecognition();
	    }//////else
	
	    if ('speechSynthesis' in window) {
	        ttsMsg.innerHTML = '<img src="<c:url value="/images/magazine_images/basic/check.png"/>" style="width: 17px;height: 30px; padding-bottom:7px;"/>Q-Bot을 통해 받은 답변은 음성 지원이 가능합니다.';
	        loadVoices();
	        window.speechSynthesis.onvoiceschanged = function (e) {
	            loadVoices();
	        };
	        startTtsBtn.addEventListener('click', startSynthesis);
	        stopTtsBtn.addEventListener('click', stopSynthesis);
	    } else {
	        ttsMsg.innerHTML = '현재의 브라우저는 <strong>TTS</strong>를 지원하지 않습니다.<br/><a href="http://www.google.co.uk/intl/en/chrome/browser/canary.html">다운로드</a>.';
	    }///////else
	        
	    function initRecognition() {
	        recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition || window.mozSpeechRecognition || window.msSpeechRecognition)();
	        recognition.lang = 'ko-KR';
	        recognition.maxAlternatives = 30000;
	        recognition.interimResults = true;
	        recognition.onspeechstart = () => console.log('Recognition Start!');
	        recognition.onspeechend = stopRecognition;
	        recognition.onresult = function (event) {
	            var transcript = Array.from(event.results).map(results => results[0].transcript).join("");
	            result.value = transcript;
	            for (let i = event.resultIndex; i < event.results.length; ++i) {
	                	
	                if (event.results[i].isFinal) {
	                    $('.loading_dot').css("display","block");
	                    sendToChatGPT(transcript);
	                    	
	                }
	            }
	        };
	        recognition.onerror = function (event) {
	            console.error('음성 인식 오류가 발생했습니다: ' + event.error);
	        };
	    }////////initRecognition()

	
	    function startRecognition() {
	    	//console.log('음성인식 메소드');
	        startBtn.innerHTML = "<img src='<c:url value="/images/chatbot/mike2.png"/>' style='width: 40px;height: 40px; border-radius: 50%;'>"
	        result.value = '';
	        recognition.start();
	        isRecognizing = true;
	    }//////startRecognition()
	
	    function stopRecognition() {
	    	//console.log("음성인식 멈춤");
	        startBtn.innerHTML = "<img src='<c:url value="/images/chatbot/mike.png"/>' style='width: 37px;height: 37px; border-radius: 50%;'>"
	        recognition.stop();
	        isRecognizing = false;
	    }//////stopRecognition()
	    
	    function stopSynthesis() {
	        if (window.speechSynthesis.speaking) window.speechSynthesis.cancel();
	    }////stopSynthesis()
	
	    function loadVoices() {
	        var voices = window.speechSynthesis.getVoices();
	        voices.forEach(function (voice, i) {
	            var option = document.createElement('option');
	            option.value = voice.voiceURI;
	            option.dataset.lang = voice.lang;
	            option.innerHTML = voice.name;
	            voiceSelect.appendChild(option);
	        });
	    }//////loadVoices()
	    
	    
	
	});/////////$(document).ready(function ()
	//Q-bot 내부 메뉴바
	document.addEventListener("DOMContentLoaded", function () {
	    const hamMenu = document.getElementById("ham-menu");
	    const chatbot = document.getElementById("chatbot");
	    const hamMenuContent = document.getElementById("hamMenuContent");
	    const chatbotBottom = document.querySelector('.chatbotBottom');
	    const hamMenu_ = document.querySelector('.hamMenu');
	    let isOpen = false;
	    
	    hamMenu.addEventListener("click", function () {
	        if (isOpen) {
	            chatbot.style.height = "580px";
	            hamMenuContent.style.display = "none";
	            chatbotBottom.style.marginTop = "1px";
	            hamMenu_.style.marginTop = "6px";
	            
	        } else {
	            chatbot.style.height = "650px";
	            hamMenuContent.style.display = "block";
	            chatbotBottom.style.marginTop = "75px";
	            hamMenu_.style.marginTop = "80px";
	        }
	        
	        isOpen = !isOpen;
	    });
	});
			
	//QR
	document.addEventListener("DOMContentLoaded", function() {
	    var mascotImage = document.getElementById("mascotImage");
	    var qrImage = document.getElementById("qrImage");
	    var downloadButton = document.getElementById("downloadButton");
	    var dropdownToggle = document.querySelector(".dropdown-toggle");
	    var dropdownMenu = document.querySelector(".dropdown-menu");
	
	    downloadButton.addEventListener("click", function(event) {
	        event.preventDefault(); 
	
	        if (mascotImage.style.display === "none") {
	            mascotImage.style.display = "block";
	            qrImage.style.display = "none";
	        } else {
	            mascotImage.style.display = "none";
	            qrImage.style.display = "block";
	        }
	
	        
	        if (dropdownToggle.getAttribute("aria-expanded") === "true") {
	            dropdownMenu.style.display = "block";
	        }
		    });
	    
	    dropdownToggle.addEventListener("click", function(event) {
	    	if (dropdownMenu.style.display === "block") {
	            dropdownMenu.style.display = "none";
	            mascotImage.style.display = "block";
	            qrImage.style.display = "none";
	        } else {
	            dropdownMenu.style.display = "block";
	        }
	    });
	});
</script>