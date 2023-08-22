<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>TemplateApplyingModule.jsp</title>
    <style>
        /*점보트론 세로폭 및 마진바툼 줄이기*/
        .jumbotron{
            padding-top:1rem;
            padding-bottom:1rem;            
            margin-bottom: .5rem;
            
            border-top-left-radius:0;
            border-top-right-radius:0;
        }
        .nav-link:hover{
          color: rgba(174, 174, 174, 0.971) !important;/*navbar-dark 때문에 안먹음*/
        }
        button > span:hover{
          border:  rgba(174, 174, 174, 0.971) 2px solid ;
          border-radius: 10%;
        }
    </style>
</head>
<script>
	//쿠키값 가져오는 함수
	function getCookieValue(cookieName) {
		//debugger
		var cookies = document.cookie.split("; ");
	  	for (var i = 0; i < cookies.length; i++) {
	    	var cookie = cookies[i].split("=");
	    	var name = cookie[0];
	    	var value = cookie[1];
	    	if (name === cookieName) {
	      		return value;
	    	}
	  	}
	  	return "";
	}
	
	document.addEventListener("DOMContentLoaded", function() {
		//쿠키값 가져와서 로그인 상태 확인 함수
		function checkLoginStatus() {
		var token = getCookieValue("User-Token");
		console.log("token",token);
		  	if(token) {
		    	// 토큰이 존재하면 로그인 상태로 간주
		    	// 로그아웃 버튼 보이기
		    	document.querySelector(".logout").style.display = "";
		    	document.querySelector(".login").style.display = "none";
		  	} else {
		    	// 토큰이 존재하지 않으면 로그아웃 상태로 간주
		    	// 로그아웃 버튼 숨기기
		    	document.querySelector(".logout").style.display = "none";
		    	document.querySelector(".login").style.display = "";
		  	}
		}
		
		// 페이지 로딩 시 로그인 상태 확인
		checkLoginStatus();
	});
</script>
<body>
	<nav class="navbar navbar-expand-md bg-info text-nowrap py-1 fixed-top">
      	<a class="navbar-brand" href="/"><i class="fa-brands fa-font-awesome text-white" style="font-size: 28px;"></i></a>
      	<span class="navbar-text mr-2 text-white">
        	Welcome To My Site!!!
      	</span>
      	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        	<i class="fa-solid fa-circle-dot text-white"></i>
      	</button>
      	<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
      		<ul class="navbar-nav">
	            <li class="nav-item">
	              	<a class="nav-link text-white" href="<c:url value="/project/MyPage.do" />">마이페이지 <i class="fa-solid fa-paper-plane"></i></a><!-- 마이페이지 -->
      			</li>
      			<li class="nav-item logout">
			        <a class="nav-link text-white active" href="<c:url value="/project/Logout.do" />">로그아웃 <i class="fa-regular fa-face-smile"></i></a><!-- 로그아웃(토큰) -->
			    </li>
			  	<li class="nav-item login">
			        <a class="nav-link text-white active" href="<c:url value="/project/Login.do" />">로그인 <i class="fa-regular fa-face-meh"></i></a><!-- 로그인(토큰) -->
			    </li>
          	</ul>
        </div>
    </nav>