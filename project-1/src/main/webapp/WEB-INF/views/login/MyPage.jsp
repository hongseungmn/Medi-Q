<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<style>
body {
    display: block;
    background-color: white;
    background-size: 100px;
    position: fixed;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;
    -webkit-text-size-adjust: 100%;
    -webkit-tap-highlight-color: transparent;
}

@media (min-width:700px) {
    .mpmain{
        width: 1500px;
        height: 800px;
        margin: 80px auto;
        padding: 30px 20px 0px 20px;
        position: absolute;
        left: 13%;
        background-color: white;
        border-radius: 10px;
    }
    /*
    .mpsidebar {
        display: inline-block;
        width: 20%;
        height: 780px;
        position: relative;
        background-color: white;
        box-shadow: 2px black;
        border-radius: 10px;
    }
    .mpcontainer {
        display: inline-block;
        width: 75%;
        height: 780px;
        background-color: white;
        position: relative;
        box-shadow: 2px black;
        border-radius: 10px;
    }
    테두리 점박이 형태
    .bookdot {
        border-radius: 10px;
        border: 2px dashed rgb(236, 236, 236);
        width: 1200px;
        height: 800px;
        position: absolute;
        top: 95px;
        left: 350px;
    }*/
    .page {
	    border-radius: 10px;
	    width: 1400px;
	    height: 770px;
	    position: absolute;
	    top: 15px;
	    left: 10px;
	    display: flex;
    }
    /*왼쪽 다이브 스타일*/
    .left-container {
        flex: 0.2;
        flex-direction: column;
        margin: 40px 0px 20px 40px;
        display: flex;
    }
    .profile_box {
        flex: 1;
        background-color: #fc79529f;
        border-radius:10px 0px 0px 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 2px 2px 4px gray;
    }
    .profile_box .img {
        margin: 80px 0px 10px 0px;
        border-radius: 50%;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과를 추가합니다 */
    }
    .profile_box span {
        font-weight: bold;
        color:white;
        font-size: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 적용 */
        padding: 5px 10px;
    }
    .profilemenu li a {
        text-decoration-line: none;
        color: white;
        font-weight: bold;
        font-size: 18px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
    }
    .profilemenu {
        display: flex;
        flex-direction: column;
        list-style: none;
        align-items: end;
        margin: 100px 40px 30px 0px;
    }
    .profilemenu li {
        margin: 10px 0px;
    }

    .profilemenu a:hover {
        color:#483D8B;
    }

    /*오른쪽 다이브 스타일*/
    .right-container {
        flex: 0.76;
        flex-direction: column;
        margin: 40px 0px 20px 0px;
        display: flex;
    }

    .layout_box {
        flex: 1;
        border-radius: 0px 10px 10px 0px;
        background: linear-gradient(to bottom, #FFFFFF, #fceae4);
        box-shadow: 2px 2px 5px gray;
        display: flex;
        flex-direction: column;
    }
    .body_box {
        display: flex;
        flex-direction: row;
        margin: 0px 30px;
    }
    .topbtn {
        margin: 10px 0px 0px 20px;
    }
    
    .update_box {
        display: flex;
        flex-direction: column;
        width: 370px;
    }
    /*
    .update_font {
        font-size: 24px;
        color: #FDCDBC;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    }
*/
    .fontinfo {
        color: #EF605D;
        font-weight: bold;
        font-size: 38px;
        margin: 5px 30px;
        border-bottom: 2px solid #FDCDBC;
        max-width: 100%;
    }
    .fontinfotap a {
        color: #EF605D;
        text-decoration: none;
        font-weight: bold;
        font-size: 22px;
        vertical-align: bottom;
        margin: 10px 0px 10px 40px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
    }
    .fontinfotap a:hover {
        color:#483D8B;
    }
    .recently {
        /*display: flex;*/
        flex-direction: row;
        min-height: 270px;
    }
    .news {
        flex: 0.8;
        display: flex;
        flex-direction: column;
        font-size: 14px;
    }
    .news .board {
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
        margin-top: 15px;
        margin-bottom: 15px;
    }
    .secnews {
        margin-left: 20px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .secnews .board{
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
        width: 560px;
        height: 580px;
    }
    .miniroom_box {
        flex: 0.8;
    }
    /*
    .miniroom_font {
        font-size: 24px;
        color: #FDCDBC;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.5);
    }
    */
    .miniroom img {
        margin: 20px 0px 0px 20px;
    }
    /*써클로직*/
    .circle {
        width: 300px;
        margin: 40px 0px;
        padding-right: 0;
        display: inline-block;
        position: relative;
        text-align: center;
        line-height: 1.2;
    }
    .circle canvas {
        width: 150px;
        height: 150px;
    }
    .circle strong {
        position: absolute;
        top: 50px;
        left: 0px;
        width: 100%;
        text-align: center;
        line-height: 40px;
        font-size: 30px;
    }
    .recently div {
    	color: rgba(48, 69, 92, 0.8);
    	font-size: 18px;
    	font-weight: bold;
    	display: flex;
		justify-content: center;
        margin-top: 15px;
    }
    .health {
    	width: 200px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
}

/* datepicker css */
		.ui-datepicker-trigger { width: 70px; cursor: pointer; }
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

        .ui-datepicker { display: none; line-height:0.5; background-color: #fff; border-radius: 10px; margin: 0px; padding: 10px; padding-bottom: 10px; width: auto; max-height: 310px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 

        .ui-widget.ui-widget-content { border: 1px solid #eee; } 

        #datepicker:focus>.ui-datepicker { display: block; } 

        .ui-datepicker-prev,
        .ui-datepicker-next { cursor: pointer; } 

        .ui-datepicker-next { float: right; } 

        .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 

        .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 

        .ui-datepicker-calendar { width: 100%; } 

        .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 
        
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
        .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; height:40px; padding-top: 17px; } 
		
        .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 

        .inp:focus { outline: none; background-color: #eee; }
        .full-highlight,.full-highlight a  { background: #fc79529f; clip-path: circle(30% at 50% 50%);}

/* 건강 기록 */
.diary .acco img{
	width: 32px;
	margin-left: 5px;
	cursor: pointer;
}
/*
.transition {
  transition: all 0.25s ease-in-out;
}
*/
.diary .flipIn {
  animation: flipdown 0.5s ease both;
}

.diaryStart{
	margin-top: 5px;
	margin-left: 30px;
	overflow-y: scroll;
}

.diary{
	border-radius: 10px;
	padding-top: 30px;
	padding-bottom: 50px;
  	background-color: #fff8b6;
  	box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1);
  	border: rgba(48, 69, 92, 0.8) solid 0;
  	height: 1200px;
}

.diaryStart::-webkit-scrollbar {
    display: none; /* 크롬, 사파리, 오페라, 엣지 */
}
.diary h5{
	font-weight: 550;
}
.diary h5,.flipIn {
  color: rgba(48, 69, 92, 0.8);
}

.diary .acco {
  color: rgba(48, 69, 92, 0.8);
  font-size: 17px;
  line-height: 26px;
  letter-spacing: 1px;
  position: relative;
  max-height: 800px;
  opacity: 1;
  transform: translate(0, 0);
  margin-top: 14px;
  z-index: 2;
  transition: all 0.5s ease-in-out;
}

.diary ul {
  list-style: none;
  perspective: 900px;
  padding: 0;
  margin: 0;
}
.diary form ul li {
  position: relative;
  padding: 0;
  margin: 0;
  padding-bottom: 4px;
  padding-top: 18px;
  border-top: 1px solid #01aa72a4;
  animation: flipdown 0.5s ease both;
}
.diary ul li:nth-of-type(1) {
  animation-delay: 0.3s;
}
.diary ul li:nth-of-type(2) {
  animation-delay: 0.5s;
}
.diary ul li:nth-of-type(3) {
  animation-delay: 0.75s;
}
.diary ul li:nth-of-type(4) {
  animation-delay: 1.0s;
}
.diary ul li:nth-of-type(5) {
  animation-delay: 1.25s;
}
.diary ul li:nth-of-type(6) {
  animation-delay: 1.5s;
}
.diary #btn li:nth-of-type(1) {
  animation-delay: 1.75s;
}
.diary ul li:last-of-type {
  padding-bottom: 0;
}

.diary ul li input[type=checkbox] {
  position: absolute;
  cursor: pointer;
  width: 100%;
  height: 100%;
  z-index: 1;
  opacity: 0;
}
.diary ul li input[type=checkbox]:checked ~ .acco {
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

.diary .btn{
	padding: 0.3rem 0.5rem;
	font-size: .8rem;
}

/* add / condition */
	.diary .add{
		display: flex;
		justify-content: between;
		align-items: center;
		margin-bottom: 5px;
	}
	.diary .condition{
		border:3px solid skyblue;
		border-radius:100px 100px;
	}
	
/* bmi */
.diary .c-bmi {
	  border-radius: .25rem;
	  box-sizing: border-box;
	  font-family: ui-sans-serif, system-ui, sans-serif;
	  padding: 1rem;
	  width: 40rem;
	  width: 100%;
	}
	.diary .c-bmi__groups {
	  border: 0;
	  flex-wrap: wrap;
	  color: rgba(48, 69, 92, 0.8);
	  font-weight: bold;
	  font-size: medium;
	  padding: 0;
	  text-align: center;
	  width: 100%;
	  margin-top: 20px;
	  display: flex;
	  justify-content: center;
	}
	.diary .c-bmi__groups label {
	  /*display: flex;*/
	  padding: 5px;
	  position: relative;
	}
	
	.diary [for="bmi-g0"] { background-color: #4691e2; width: 100px;}
	.diary [for="bmi-g1"] { background-color: #0cb764; width: 100px;}
	.diary [for="bmi-g2"] { background-color: #febf18; width: 100px;}
	.diary [for="bmi-g3"] { background-color: #fc8711; width: 100px;}
	.diary [for="bmi-g4"] { background-color: #ff6455; width: 100px;}
	.diary [for="bmi-g5"] { background-color: #cc1100; color: #fff; }
	
	.diary .c-bmi__groups input:checked + label::before {
	  /*background-color: #fff;
	  clip-path: polygon(0% 0%,0% 100%,75.00% 50.00%);*/
	  content: '';
	  display: inline-block;
	  height: 1rem;
	  /*left: 0.5rem;*/
	  position: absolute;
	  /*top: 0.35rem;*/
	  width: 1rem;
	}
	.diary .c-bmi__groups input:checked + label + div {
	  display: block;
	  flex: 0 0 100%;
	}
	.diary .c-bmi__label {
	  display: block;
	  font-size: medium;
	  margin: 0 0 1rem 0;
	  position: relative;
	}
	.diary .c-bmi__label output {
	  position: absolute;
	  right: 0;
	  top: 0;
	}
	
	.diary .c-bmi [type="radio"] { display: none; }
	
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
	  
/* 건강 데이터 아코디언 */
		*{
            margin: 0;
            padding: 0;
            font-family: 'lato';
            list-style: none;
            text-decoration: none;
        }
        #healthRegi .item a:hover{
            text-decoration: none;
            color: #ffffff;
        }
        #healthRegi .wrapper{/*위치(가운데 정렬)*/
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        #healthRegi .mainMenu{
            width: 620px;
            display: block;
            border-radius: 10px;
            overflow: hidden;
        }
        #healthRegi .item{
            border-top: 1.5px solid #ef584a;
            overflow: hidden;
        }
        #healthRegi .button{
            display: block;
            padding: 15px 20px;
            background-color: #ff9e81;
            color: #ffffff;
            position: relative;
        }
        #healthRegi .button:before{
            content: '';
            position: absolute;
            width: 0;
            height: 0;
            border-left: 8px solid transparent;
            border-right:8px solid transparent;
            border-top:10px solid #ff9e81;
            right: 15px;
            bottom: -10px;
            z-index: 9;  
        }
        #healthRegi .subMenu{
            display: flex;
            justify-content: center;
            background: #ffffff;
            overflow: hidden;
            transition: max-height 0.7s;
            max-height: 0;
            border-left: #ddc2c2 .2px solid;
            border-right: #ddc2c2 .2px solid;
        }
        #healthRegi .subMenu span{
            border: #ddc2c2 .2px solid;
            margin: 3px;
            word-break: break-all;
        }
        #healthRegi .subMenu span:before{
            content: '';
            opacity: 0;
            transition: opacity 0.3s;

        }
        #healthRegi .subMenu span:hover:before{
            content: '';
            position: absolute;
            height: 0;
            width: 6px;
            left: 0;
            top:0;
            opacity: 1;
            border-top: 24px solid transparent;
            border-bottom: 24px solid transparent;
        }
        #healthRegi .subMenu span:after{
            content: '';
            opacity: 0;
            transition: opacity 0.3s;
        }
        #healthRegi .subMenu span:hover:after{
            content: '';
            position: absolute;
            height: 0;
            width: 6px;
            right: 0px;
            top:0;
            opacity: 1;

            border-top: 24px solid transparent;
            border-bottom: 24px solid transparent;
        }
        #healthRegi .subMenu span:hover{
            background: #ffa798;
            transition: all 0.3s;
            border-bottom: 1px solid #ffa798;
        }
        #healthRegi .item:target .subMenu{
            max-height: 30em;
        }
        
        #healthRegi .item:last-child{
            background-color: white;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        
    #healthRegi .col{
    	max-width: 65px !important;
    	
    }
	#healthRegi #allergy .subMenu{
		height: 60px;
		padding: 0 5px;
	}
	#healthRegi .allergy{
		width: 55px;
		padding-right: 0;
		padding-left: 0;
		margin-right: 2px;
		margin-left: 2px;
	}
    #healthRegi .allergy img{
    	margin-top: 2px;
    	margin-bottom: 2px;
        width: 30px;
    }
    #healthRegi small{
    	font-size: 13px;
    }
	#healthRegi .allergy,small{
		cursor: pointer;
	}
	
	#healthRegi .full{
		border: #ff9e81 .2px solid;
		border-radius: 10%;
		box-sizing: border-box;
	}
	
	#healthRegi .fullClick{
		background-color: #ff9e81;
	}
	
	/* modal 사이즈 지정 */
	#healthRegi modal-fullsize {
	  width: 800px;;
	  height: 500px;
	  margin: 0;
	  padding: 0;
	  border-radius: 10px;
	}

	/* 영양제 검색 */
	.food-li {
	  width: 120px;
      background-color: white;
      color: black;
      border-radius: 15px;
      flex: 0 0 25%;
    }
	#searchFoodList .food-li:hover {
      border: #ff4b4b solid 2px;
    }
    #select-div .food-li:hover{
    	border: rgb(197, 197, 197) solid 2px;
    }
    #healthRegi .food-li-checked {
      border: #ff4b4b solid 2px;
    }

	#healthRegi #food .subMenu{
		overflow-y: scroll;
	}
	#healthRegi #food .subMenu::-webkit-scrollbar {
	    display: none; /* 크롬, 사파리, 오페라, 엣지 */
	}
	
	.health a,.health a:hover{
		text-decoration: none;
		color: rgb(255, 125, 125);
    	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
	}
	
	.ui-autocomplete { z-index:2147483647; }
</style>

<!-- 메인 바디 부분 -->
<div id="tsmain">
    <div class="mpmain"><!--큰틀 다이브-->
        <div class="bookdot"><!-- 점박이 다이브-->
            <div class="page"><!--몸통 다이브-->
                <div class="left-container"><!--왼쪽 다이브-->
                    <div class="profile_box">
                        <c:if test="${info.prof_Img_Fl eq 'Y' }" var="isProfImg">
							<c:set var="uploadFolder" value="${fn:split(profImg.pi_Path,'\\\\')[fn:length(fn:split(profImg.pi_Path, '\\\\'))-1] }"/>
							<img class="img" alt="사용자 이미지" src="<c:url value="/images/${uploadFolder }/${profImg.pi_Filename }.${profImg.pi_Ext }" />" style="width: 180px; height: 180px">
						</c:if>
						<c:if test="${not isProfImg }">
							<img class="img" alt="기본 프로필" src="<c:url value="/images/basic/friend.png" />" style="width: 180px; height: 180px">
						</c:if>
                        <span id="id">${info.id }</span>
                        
                        <ul class="profilemenu ml-auto">
                        	<li><a href="" id="" class="sidenava1" data-toggle="modal" data-target="#healthModal" data-backdrop="static">나의 건강 정보 등록</a></li>
                        	<li><a class="sidenava2" href="<c:url value="/loadHealthInfo.do?userId=${info.id}"/>">건강검진정보 불러오기</a></li>
                            <li><a href="" id="imgEdit" class="sidenava3"  data-target="#modalView" data-backdrop="static">프로필 이미지수정</a></li>
                            <c:if test='${info.social_Fl eq "Y"}' var="isSocial"><!-- 소셜용 -->
								<li><a href='<c:url value="/project/JoinEdit.do"/>' class="sidenava4">회원정보 수정</a></li>
							</c:if>
							<c:if test="${not isSocial }"><!-- 일반 회원용 -->
								<li><a href="" id="infoEdit" class="sidenava4" data-target="#modalView" data-backdrop="static">회원정보 수정</a></li>
							</c:if>
                            <li><a class="sidenava5" id="inactive" href="#" data-target="#modalView" data-backdrop="static">회원탈퇴</a></li>
                        </ul>
                        <div>
                            <img alt="로고" src='<c:url value="/images/mainicon.png"/>' style="width: 30px"/>
                            <img alt="로고2" src='<c:url value="/images/maintitle.png"/>' style="width: 80px"/>
                        </div>
                    </div>
                </div>
                <!--왼쪽 다이브 끝-->
                <div class="right-container"><!--오른쪽다이브-->
                    <div class="layout_box">
                        <div class="fontinfo d-flex justify-content-between">
                        	<div>My page</div>
                            <div class="tab-menu fontinfotap mr-3">
                                <a href="#" class="tab-button" style="color:#fa7a7ab9">건강 다이어리</a>
                                <a href='<c:url value="/project/MyPage2.do"/>' class="tab-button">찜방&리뷰관리</a>
                                <a href="<c:url value="/project/MyPage3.do"/>" class="tab-button"><img alt="pill" src='<c:url value="/images/basic/pills.png"/>' style="width: 21px"/>${fn:substring(info.name,1,3) }님의 약장</a>
                            </div>
                        </div>
                        <div class="body_box">
                            <div class="update_box">
                                <div class="news">
                                    <div class="board recently" style="flex:1;">
                                    	<div>${fn:split(current,"-")[1] }월의 건강 달성 프로젝트</div>
                                    	<div>
	                                        <div class="second circle">
	                                            <strong></strong>
	                                        </div>
	                                        <div class="health mr-3 mb-4"style="font-size: 18px; font-weight: bold; ">
	                                            <a href="javascript:progressDiary()"><span class="badge rounded-pill text-white py-2 px-3" style="background-color: #fc79529f; font-size: 17px;">건강 다이어리</span></a>
	                                            <a class="mt-3 mb-2" href="javascript:progressProfile()"><span class="badge rounded-pill text-white py-2 px-3" style="background-color: #fc79529f; font-size: 17px;">건강 프로필</span></a>
	                                        </div>
	                                    </div>
                                    </div>  
                                    
                                    <div class="board num" style="flex:1; max-height: 310px;">
                                        <div class="line1" style="max-height: 300px;">
                                            <div class="datepicker"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="secnews">
                                
                                <div class="board diaryStart">
                                    <div class="col diary" style="width: 600px">
							        	<form action="#">
							        		<div class="row justify-content-between align-items-center pb-2 pl-3 pr-3">		        		
								        		<!-- 다른 날짜 클릭하면 클릭한 날짜가 보이도록 -->
												<h5><span class="clickDate">${empty clickDate ? current : clickDate }</span> 건강 기록</h5>
											</div>
											<ul>
												<li>
													<input type="checkbox" checked>
													<div class="d-flex justify-content-between">
														<div class="flipIn">오늘의 컨디션</div>
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
														<div class="flipIn">증상체크</div>
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
						
												<li>
													<input type="checkbox" checked>
													<div class="d-flex justify-content-between">
														<div class="flipIn">체중 키</div>
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
																<label class="mb-3">나의 체질량지수</label>
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
														<div class="flipIn">기타 메모</div>
														<i class="fa-solid fa-angle-down"></i>
													</div>
													<div class="acco">
														<textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요" rows="5"></textarea>
													</div>
												</li>
											</ul>
											<ul id="btn">
												<li>
													<button type="submit" class="memoSend btn btn-outline-primary mt-3">확인</button>
													<button type="submit" class="memoSend btn btn-outline-primary mt-3">수정</button>
													<button type="submit" class="memoSend btn btn-outline-primary mt-3">삭제</button>
												</li>
											</ul>
										</form>
									</div>
	    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<!-- 건강정보 등록 모달 시작 -->
    <div class="modal fade" id="healthModal">	
		<div class="modal-dialog modal-dialog-centered modal-fullsize">
			<div class="modal-content modal-fullsize" style="width: 800px">
				
				<!-- Modal body -->
				<div class="modal-body d-flex justify-content-center">
					<form id="healthRegi" class="form-inline justify-content-center" action='<c:url value="/project/healthInfo.do"/>' method="POST">
						<div class="wrapper">
					        <ul class="mainMenu">
					        
						        <li class="item">
					                <div class="bg-light font-weight-bold py-3 pl-2" style="color: #ef584a;">나의 건강 정보 등록</div>
					            </li>
					            
					            <li class="item" id="worry">
					                <a href="#worry" class="button">나의 건강고민</a>
					                <div class="subMenu">
					                    <span class="btn text-black-50">간 건강</span>
					                    <span class="btn text-black-50">뼈 건강</span>
					                    <span class="btn text-black-50">두뇌활동</span>
					                    <span class="btn text-black-50">피부 건강</span>
					                    <span class="btn text-black-50">면역 기능</span>
					                    <span class="btn text-black-50">운동 능력</span>  
					                </div>
					                <div class="subMenu">
					                    <span class="btn text-black-50">눈 건강</span>
					                    <span class="btn text-black-50">혈중 콜레스테롤</span>
					                    <span class="btn text-black-50">수면</span>
					                    <span class="btn text-black-50">혈액 순환</span>
					                    <span class="btn text-black-50">장 건강</span> 
					                    <span class="btn text-black-50">체지방</span>
					                </div>
					            </li>
					
					            <li class="item" id="disease">
					                <a href="#disease" class="button">기저질환</a>
					                <div class="subMenu">
					                    <span class="btn text-black-50">고중성지방혈증</span>
					                    <span class="btn text-black-50">고혈압</span>
					                    <span class="btn text-black-50">비타민D 부족</span>
					                    <span class="btn text-black-50">당뇨</span>
					                    <span class="btn text-black-50">변비</span>
					                    <span class="btn text-black-50">신장 질환</span>
					                </div>
					                <div class="subMenu">
					                    <span class="btn text-black-50">과체중/비만</span>
					                    <span class="btn text-black-50">저체중</span>
					                    <span class="btn text-black-50">수면장애(불면증)</span>
					                    <span class="btn text-black-50">위장 질환</span>
					                    <span class="btn text-black-50">대장 질환</span>                   
					                </div>
					                <div class="subMenu">
					                    <span class="btn text-black-50">고지혈증(콜레스테롤)</span>                    
					                    <span class="btn text-black-50">빈혈</span>
					                    <span class="btn text-black-50">간 질환</span>
					                    <span class="btn text-black-50">관절염</span>
					                    <span class="btn text-black-50">골감소증/골다공증</span>                   
					                </div>
					            </li>
					
					            <li class="item" id="allergy">
					                <a href="#allergy" class="button">알러지</a>
					                <div class="row subMenu">
					                    <div class="col allergy">
					                        <img class="d-block mx-auto" alt="알류" src='<c:url value="/images/allergy/egg.png"/>'>
					                        <small class="d-block text-center">알류</small>	
					                    </div>
					                    <div class="col allergy">
					                        <img class="d-block mx-auto" alt="우유" src='<c:url value="/images/allergy/milk.png"/>'>
					                        <small class="d-block text-center">우유</small>	
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
					                </div>
					                <div class="row subMenu">
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
					            </li>
					            <li class="item" id="food">
					                <a href="#food" class="button">영양제 선택하기</a>
					                <div class="subMenu d-block">
					                    <p id="search-myFood" class="my-2" style=" font-size: 15px; display:flex; align-items: center; justify-content: center; font-weight: bold;">섭취중인 영양제를 등록해주세요</p>
					                    <div class="input-group" style="text-align: center;">
						      				<input id=searchText class="form-control" type="text" placeholder="브랜드명 혹은 제품명을 입력해주세요" style="border-radius:10px; width:350px;">
						          		</div>
						          		<div class="h">
								          	<ul class="list-unstyled d-flex justify-content-center px-2" id="searchFoodList" style="flex-wrap: wrap;">
								            	<li class="food-li m-2 px-2" style="text-align: center;flex-basis: 100px;display:None">
								              		<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="width:100px;height:100px;border-radius: 15px;">
								              		<div style="font-size: 15px;color: #939393;"></div>
								            	</li>
								          	</ul>
							          	</div>
					                </div>
					           	
						            <a href="#select-food" class="button">내가 먹는 영양제</a>
						            <div class="subMenu" id="select-div">
						              	<div class="d-block">
							              	<!-- 여기에 영양제 검색->선택 시 이미지 꾸리기 -->
							               	<ul class="list-unstyled d-flex justify-content-center px-2" style="flex-wrap: wrap;">
							                		
							               	</ul>
						               	</div>
						            </div>
						        </li>
					            
					            <li class="item" id="special">
					                <a href="#special" class="button">건강 특수 상태</a>
					                <div class="subMenu">
					                    <span class="btn text-black-50">흡연 중</span>
					                    <span class="btn text-black-50">임신 중</span>
					                    <span class="btn text-black-50">수유 중</span>
					                    <span class="btn text-black-50">6개월 내 자녀계획 있음</span>
					                    <span class="btn text-black-50">폐경기</span>
					                </div>
					            </li>
					            
					            <li class="item button d-flex justify-content-end py-1">
					                <input type="submit" class="btn btn-outline-info mx-2" value="확인"/>
									<button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
					            </li>
					        </ul>
					    </div>
				    </form>
				</div>
			</div>
		</div>
	</div>
    <!-- 건강정보 등록 모달 끝 -->
    
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
						<p id="text"></p>
						<input type="hidden" name="mode" value="editBtn"/>		
						<input type="hidden" name="id" value="${info.id }"/>
						<div class="d-flex justify-content-center align-items-center">
							<span style="display: none;">비밀번호 :</span>
							<input type="password" name="password" class="form-control mx-2" placeholder="비밀번호를 입력하세요" style="max-width: 200px"/>
						</div>
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
		
</div>

<!-- 건강 다이어리 -->
<c:set var="current" value="${current}"/>
	
<c:set var="date" value="${memo.mm_Date}"/>
<c:set var="condition" value="${memo.mm_Condition}"/>
<c:set var="head" value="${memo.mm_Head}"/>
<c:set var="resp" value="${memo.mm_Resp}"/>
<c:set var="stom" value="${memo.mm_Stomach}"/>
<c:set var="ment" value="${memo.mm_Mental}"/>
<c:set var="chest" value="${memo.mm_Chest}"/>
<c:set var="body" value="${memo.mm_Body}"/>
<c:set var="height" value="${memo.mm_Height}"/>
<c:set var="weight" value="${memo.mm_Weight}"/>
<c:set var="content" value="${memo.mm_Content}"/>
	
<c:set var="date" value=""/>
<c:forEach var="diary" items="${memos }">
	<c:set var="date" value="${date } ${diary.mm_Date }"/>
</c:forEach>

<!-- 건강 정보 등록 -->
<c:set var="worry" value="${my.worry}"/>
<c:set var="disease" value="${my.disease}"/>
<c:set var="allergy" value="${my.allergy}"/>
<c:set var="food" value="${food}"/>
<c:set var="special" value="${my.special}"/>

</body>

<script>
	var dates_ = '<c:out value="${date}"/>'
	var dates = dates_.substring(1);
	//console.log('dates:',dates)
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
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
			return [true, isFull ? "full-highlight" : ""]; // 다른 날짜는 기본값 반환
		},//날짜 선택 전 이벤트 주기
		yearSuffix: '년',
		maxDate: new Date(), //오늘 날짜 이 후만 선택가능
		
	});
	
	$('.datepicker').change(function(){
		//console.log('datepicker:',$(this).val())
		var clickDate = $(this).val()
		if(confirm('날짜를 변경하시면 해당 날짜의 정보가 저장되지않습니다.\r\n변경하시겠습니까?')){
			location.href='/project/ClickDate.do?clickDate='+clickDate;
			
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
	
	var worry = '<c:out value="${worry}"/>';
	var disease = '<c:out value="${disease}"/>';
	var allergy = '<c:out value="${allergy}"/>';
	var food = '<c:out value="${food}"/>';
	var special = '<c:out value="${special}"/>';
	
	//건강정보 불러오기
	$('#worry').find('span').each(function(){
		if(worry.includes($(this).html())){
			$(this).addClass('fullClick');
		}
	});
	$('#disease,#special,.allergy').find('span,small').each(function(){
		if(disease.includes($(this).html())){
			$(this).addClass('fullClick');
		}
		if(special.includes($(this).html())){
			$(this).addClass('fullClick');
		}
		if(allergy.includes($(this).html())){
			$(this).parent().addClass('full');
		}
	});
	var foodli = document.querySelector('#select-div ul');
	var foodList = food=='[]' ? "" :food.split('},');

	for(var i=0;i<foodList.length;i++){
		var foodname = foodList[i].split(',')[1].split('=')[1];
		var foodimg = i==foodList.length-1 ? foodList[i].split(',')[2].split('=')[1].split('}')[0] : foodList[i].split(',')[2].split('=')[1];
		var li = document.querySelector('.food-li').cloneNode(true);
		li.style.display='';
		console.log('check:',foodimg)
		if (!foodimg.length) {
			foodimg = 'http://localhost:9090/images/thumbnail_img/NO_IMG.jpeg';
		}
		li.querySelector('img').src = foodimg;
		li.querySelector('div').innerHTML = foodname;
		foodli.appendChild(li);
	}
	//내가 선택한 영양제 클릭 시 삭제
	$('#select-div .food-li').click(function(e){
		console.log('영양제 추가하기 전')
		var click = $(this);
		var foodList = food=='[]' ? "" :food.split('},');

		for(var i=0;i<foodList.length;i++){
			var alarm_fl = foodList[i].split(',')[3].split('=')[1];
			var food_name = foodList[i].split(',')[1].split('=')[1];
			if(food_name==click.find('div').html() && alarm_fl=='Y'){
				alert('해당 영양제에 알람이 등록되어있습니다\r\n알람을 먼저 해제해주세요');
				break;
			}
			else if(food_name===click.find('div').html() && alarm_fl !== 'Y'){
				click.remove();
			}
		}
	});

	//건강정보 저장
	$('#healthRegi').submit(function(e){
		e.preventDefault();
		
		var healthRegi = new Array(5);

		for(var i=0;i<healthRegi.length;i++){
			healthRegi[i] = new Array();
		}
		$('.fullClick,.full,#select-div .food-li').each(function(){
			var id = $(this).parent().parent().prop('id');
			switch(id){
				case 'worry': healthRegi[0].push($(this).html()); break;
				case 'disease' : healthRegi[1].push($(this).html()); break;
				case 'allergy' : healthRegi[2].push($(this).find('small').html()); break;
				case 'special' : healthRegi[4].push($(this).html()); break;
				default : healthRegi[3].push($(this).find('div').html());
			}
		});
		console.log('healthRegi:',healthRegi)
		
		$.ajax({
			data:{'healthRegi':healthRegi},
			method:'post',
			url:'<c:url value="/project/healthInfo.do"/>',
			traditional : true,
			dataType:'json'
		}).done(function(data){
			alert('건강 정보가 저장되었습니다.');
			location.href = window.location.href.split('#')[0];
		}).fail(function(){
			console.log('fail');
		});		
	});

	//알레르기 아이콘 클릭 이벤트
	$('.allergy').click(function(){
		$(this).toggleClass('full');
	});
	
	//span 클릭 이벤트
	$('.subMenu span').click(function(){
		$(this).toggleClass('fullClick');
		$(this).toggleClass('text-white');
	});
	
	//영양제 검색
	const ulDiv = document.querySelector('#searchFoodList');
	$( "#searchText" ).autocomplete({
	   source : function(request,response) {
		   $.ajax({
			   url: "<c:url value='/searchMyFood.do'/>",
			   data : { "searchWord" : $( "#searchText" ).val()},
		   }).done(function(searchFood) {
			   /*
			    var p = document.createElement('p');
			    //var empty = document.querySelector('#empty');
			    p.setAttribute('style','font-size:15px;margin-left: 85px;');
			    //p.setAttribute('id','empty');
			    
			    if(searchFood.length){*/
				   	var nameList = searchFood.map(function(item){return item['PRODUCTNAME'];});
				   	response(nameList);
				   	var imgList = searchFood.map(function(item){return item['IMGURL'];});
				   	while (ulDiv.childElementCount > 1) {
				   		ulDiv.removeChild(ulDiv.lastChild); // 마지막 자식 요소를 제거
				   		//ulDiv.removeChild(empty);
				   	}
				   	
				   	searchFood.forEach(function(item) {
				   		var li = document.querySelector('.food-li').cloneNode(true);
				   		li.style.display = '';
				   		document.querySelector('.h').style.height='322px';
				   		li.classList.replace('food-li-checked','food-li');
				   		if (item['IMGURL']===undefined) {
				   			item['IMGURL'] = 'http://localhost:9090/images/thumbnail_img/NO_IMG.jpeg';
				   		}
				   		li.querySelector('img').src = item['IMGURL'];
				   		li.querySelector('div').innerHTML = item['PRODUCTNAME'];
				   		ulDiv.appendChild(li);
				   	});
			   /* }
			    else{
			    	while (ulDiv.childElementCount >= 1) {
				   		ulDiv.removeChild(ulDiv.lastChild);
				   	}
			    	p.textContent='입력한 제품과 동일한 제품이 없습니다';
			    	ulDiv.appendChild(p);
			    }*/
		   }).fail(function(error) {
			   	console.log(error);
		   });
	   }
	});
	$("#healthModal").on("shown.bs.modal", function() {
	    // 자동완성 기능 초기화
	    $("#searchText").autocomplete("option", "appendTo", "#healthModal");
  	});

	//내가 선택한 영양제 등록
	$(document).on('click', '#searchFoodList .food-li', function() {
	    var foodContainer = $('#select-div ul');
	    var selectFood = foodContainer.find('.food-li');
	    var click = $(this).find('div').html();
	    var target = $(this);
	    var equalFlag = false;

	    selectFood.each(function(){
	    	if(click === $(this).find('div').html()){
	    		alert('이미 등록된 영양제입니다');
	    		equalFlag = true;
		    	return false;
	    	}
	    });
	    if(!selectFood.length || !equalFlag){
	    	target.clone(true).appendTo(foodContainer);
	    }
	    
	  	//내가 선택한 영양제 클릭 시 삭제
		$('#select-div .food-li').click(function(){
			//console.log('영양제 추가한 후')
			var click = $(this);
			//console.log('click',click)
			var foodList = food=='[]' ? "" :food.split('},');
			var flag = false;
			//console.log('list',foodList)
			for(var i=0;i<foodList.length;i++){
				var alarm_fl = foodList[i].split(',')[3].split('=')[1];
				var food_name = foodList[i].split(',')[1].split('=')[1];
				var last_child = $(this).parent().children().slice(foodList.length).find('div').html();
				console.log('length',foodList.length)
				console.log('last',last_child)
				//console.log('this',$(this).find('div').html())
				//console.log('food_name:',food_name)
				if(food_name===click.find('div').html()){
					if(alarm_fl==='Y'){
						//console.log('alert 창 뜨기')
						//alert('해당 영양제에 알람이 등록되어있습니다\r\n알람을 먼저 해제해주세요')
						flag = false;
						return false;
					}
					else if(alarm_fl !== 'Y'){
						//console.log('삭제')
						flag = true;
					}
				}
				else if(last_child===click.find('div').html()){
					//console.log('마지막 자식 클릭')
					if(food_name !== last_child){
						//console.log('삭제...')
						flag = true;
					}
				}
			}
			if(flag){
				click.remove();
			}
		});
	});
	
	
	//컨드롤러에서 가져온 정보 꾸리기(기본값=오늘날짜)
	var current_ = '<c:out value="${current}"/>';
	var current = current_.length==0 ? '<c:out value="${clickDate}"/>' : current_;
	console.log('click:',$('.clickDate').html())
	console.log('current',current)
	//console.log('dates:',dates)
	if(dates.length){//기본값=오늘날짜
		var info_con = '<c:out value="${condition}"/>';
		if(info_con.length && $('.acco').find('[alt='+info_con+']')){
			$('.acco').find('[alt='+info_con+']').addClass('condition');
		}
		var info_head = '<c:out value="${head}"/>';
		console.log('head:',info_head)
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
		var info_h = '<c:out value="${height}"/>';
		$('[name=h]').val(info_h);
		var info_w = '<c:out value="${weight}"/>';
		$('[name=w]').val(info_w);
		var info_content = `<c:out value="${content}"/>`;
		$('#content').html(info_content);
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
		//console.log('길이:',$('.acco').find('.condition').prop('alt')==undefined)
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
		var condition = $('.acco').find('.condition').prop('alt') == undefined ? '' : $('.acco').find('.condition').prop('alt');
		
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
		$('.acco:eq(0)').children().removeClass('condition');
		$(this).toggleClass('condition');
	});
	
	//bmi 계산
	 var bmi = document.querySelector('.c-bmi');
	 var height = bmi.querySelector('input[name=h]');
	 var weight = bmi.querySelector('input[name=w]');
	 var gram = bmi.querySelectorAll('input[name=g]');
	 
	 function result(){
		if(!weight.value || !height.value){
			alert('키와 체중을 입력해주세요');
			return false;
		}
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
		    bmi.lastElementChild.innerHTML='당신의 BMI 지수는 <span class="text-info">'+i+'</span>이고<br/>적정 체중은 현재 체중에서 <span class="text-info">'+((m-t)>=0?"+"+(m-t).toFixed(2):(m-t).toFixed(2))+'kg</span> 입니다';
		}
		else{
		    bmi.lastElementChild.innerHTML='정상입니다'
		}
		bmi.addEventListener('submit', result);
		bmi.dispatchEvent(new Event('input'));   
	}
	
	
	//이미지 수정하기
	$('#imgEdit').click(function(){
		$(this).attr('data-toggle','modal');
		$('form').attr('action','<c:url value="/project/ProfImgEdit.do"/>');
		$('form').attr('enctype','multipart/form-data');
		$('.modal-title').html('수정할 프로필 이미지를 선택해주세요').parent().parent().css('height','');
		$('#text').html('');
		$('[name=mode]').val('editBtn');
		$('input[type=password]').css('display','none').prev().css('display','none');
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
		$('.modal-title').html('회원정보 수정을 위해 비밀번호를 입력해주세요').parent().parent().css('height','');
		$('#text').html('');
		$('[name=mode]').val('editBtn');
		$('.custom-file').css('display','none');
		$('a[name=defaultImg]').css('display','none');
		$('input[type=password]').css('display','').prev().css('display','');
	});
	
	//회원 탈퇴 하기
	$('#inactive').click(function(){
		$(this).attr('data-toggle','modal');
		$('#modalView .modal-dialog').children(':eq(0)').css('height','330px');
		$('form:eq(1)').removeClass('form-inline');
		$('form').attr('action','<c:url value="/project/Password.do"/>');
		$('.modal-title').html('회원정보 확인을 위해 비밀번호를 입력해주세요');
		$('#text').html('회원 탈퇴시 모든 데이터가 삭제됩니다.<br/>90일 이내에 사용자 계정과 동일한 이메일로 재가입 할 수 없습니다.<br/><br/> 계속 하시겠습니까?');
		$('[name=mode]').val('inactive');
		$('.custom-file').css('display','none');
		$('a[name=defaultImg]').css('display','none');
		$('input[type=password]').css('display','').prev().css('display','');
	});
	
</script>

<script src="https://rawgit.com/kottenator/jquery-circle-progress/1.2.2/dist/circle-progress.js"></script>
<script>
	var lastDate;
	$(function(){
		 $('.datepicker').datepicker();
		 lastDate = $('.ui-state-default:last').html();
		 progressDiary(lastDate);
	})

	//벨류 값이 원테두리에 들어가는 수치 math.round는 안에 들어가는 확률 값
	function progressDiary(lastDate){ //건강다이어리 수행률
		var today = new Date();
		var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0).toString().split(" ")[2];
		var diaryCount = $('.full-highlight').length;
		$('.second.circle').circleProgress({
		    value: diaryCount/lastDate
		}).on('circle-animation-progress', function(event, progress) {
		  	$(this).find('strong').html(Math.round((diaryCount/lastDate*100) * progress) + '<i>%</i>');
		});
	}
	
	function progressProfile(){//건강 프로필 수행률
		$.ajax({
			data:{id:'${info.id}'},
			url:'<c:url value="/project/ProgressProfile.do"/>',
			method:'post',
			dataType:'json'
		}).done((data)=>{
			console.log('success:',data);
			var sum = data.arc + data.hi + data.mh + data.mt;
			$('.second.circle').circleProgress({
			    value: sum/100
			}).on('circle-animation-progress', function(event, progress) {
			  	$(this).find('strong').html(Math.round((sum/100*100) * progress) + '<i>%</i>');
			});
		}).fail(()=>{
			$('.second.circle').circleProgress({
			    value: 0
			}).on('circle-animation-progress', function(event, progress) {
			  	$(this).find('strong').html(Math.round(0 * progress) + '<i>%</i>');
			});
		});
	}
</script>