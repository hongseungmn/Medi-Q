<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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
    .profilemenu  li {
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
        width: 420px;
    }
    .update_font {
        font-size: 21px;
        color: #483D8B;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
    }

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
        display: flex;
        flex-direction: row;
        min-height: 180px;
        overflow-y: scroll;
    }
    .recently::-webkit-scrollbar {
	    display: none; /* 크롬, 사파리, 오페라, 엣지 */
	}
    .health {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    .news {
        flex: 0.8;
        display: flex;
        flex-direction: column;
        font-size: 14px;
        height: 618px;
    }
    .news .board {
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
    }
    .board{
    	padding: 10px;
    	overflow-y: scroll;
    }
    .board::-webkit-scrollbar {
	    display: none; /* 크롬, 사파리, 오페라, 엣지 */
	}
    .secnews {
        margin-left: 20px;
    }
    .secnews .board{
        background-color: white;
        border-radius: 10px;
        box-shadow: .1rem .1rem .3rem gray;
        width: 540px;
        height: 570px;
    }
    .miniroom_box {
        flex: 0.8;
    }
    .miniroom_font {
        font-size: 21px;
        color: #483D8B;
        font-weight: bold;
        margin-bottom: 10px;
        text-align: center;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
    }
    .miniroom img {
        margin: 20px 0px 0px 20px;
    }
    
    .lnMHMg {
        margin: 5px 0px;
        width: 400px;
        height: 560px;
    }
    .kriRoB {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 5px 10px;
        width: 380px;
        height: 540px;
    }
    .kriRoBreview {
        width: 500px;
        height: 540px;
    }
    .kriRoBreview a{
    	color: black;
    }
    .kriRoBreview a:hover,.kriRoB a:hover{
    	text-decoration: none;
    	color: black;
    }
    .cqOzav {
        display: flex;
        position: relative;
        flex-direction: column;
        box-shadow: 0 0.2rem 0.5rem rgba(0, 0, 0, 0.3);
        border-radius: 10px;
        margin-top: 5px;
        width: 185px;
        height: 230px;
    }
    .kzDdbX {
        position: relative;
        border-radius: 10px 10px 0 0;
        width: 100%;
        display: flex;
        justify-content: center;
    }
    .kzDdbXreview{
        width: 180px;
        display: block;
        margin-left: 10px;
    }
    .kCBLwp {
    	width: 165px;
    	height: 20px;
        margin: 10px 10px;
        color: gray;
        font-weight: 400;
        word-break: break-all;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        display: block;
        vertical-align: bottom;
        overflow: hidden;
	  	text-overflow: ellipsis;
	  	white-space: nowrap;
    }
    .sdp {
        color: #EF605D;
        font-size: 15px;
        font-weight: bold;
        margin: 0;
        padding: 5px;
        margin-right: 0;
    }
    .snp {
        margin: 5px;
        font-weight: bold;
        word-break: break-all;
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        font-size: 16px;
    }
    .srp {
        margin: 0px 5px;
        font-size: 14px;
    }
    .srp span {
        font-size:14px;
        font-weight: 400;
        word-break: break-all;
        text-overflow: ellipsis;
        overflow: auto;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }
    .kWbUNE {
    	width: 165px;
    	height: 20px;
        margin: 5px 10px;
        color: black;
        font-weight: bold;
        word-break: break-all;
        display: block;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
	  	text-overflow: ellipsis;
	  	white-space: nowrap;
    }
    .detail {
        position: absolute;
        bottom: 5px;
        right: 10px;
        margin-right: 10px;
        color:gray;
        text-decoration: none;
    }
    .review {
        display: flex;
        position: relative;
        flex-direction: row;
        box-shadow: 0 0.2rem 0.5rem rgba(0, 0, 0, 0.3);
        border-radius: .5rem;
        width: 500px;
        height: 130px;
        margin: 10px 10px;
    }
    .reviewinfo {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        text-align: start;
        padding: 5px;
    }
}

/* 건강 데이터 아코디언 */
*{
            margin: 0;
            padding: 0;
            font-family: 'lato';
            list-style: none;
            text-decoration: none;
        }
        .item a:hover{
            text-decoration: none;
            color: #ffffff;
        }
        .wrapper{/*위치(가운데 정렬)*/
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .mainMenu{
            width: 620px;
            display: block;
            border-radius: 10px;
            overflow: hidden;
        }
        .item{
            border-top: 1.5px solid #ef584a;
            overflow: hidden;
        }
        .button{
            display: block;
            padding: 15px 20px;
            background-color: #ff9e81;
            color: #ffffff;
            position: relative;
        }
        .button:before{
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
        .subMenu{
            display: flex;
            justify-content: center;
            background: #ffffff;
            overflow: hidden;
            transition: max-height 0.7s;
            max-height: 0;
            border-left: #ddc2c2 .2px solid;
            border-right: #ddc2c2 .2px solid;
        }
        .subMenu span{
            border: #ddc2c2 .2px solid;
            margin: 3px;
            word-break: break-all;
        }
        .subMenu span:before{
            content: '';
            opacity: 0;
            transition: opacity 0.3s;

        }
        .subMenu span:hover:before{
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
        .subMenu span:after{
            content: '';
            opacity: 0;
            transition: opacity 0.3s;
        }
        .subMenu span:hover:after{
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
        .subMenu span:hover{
            background: #ffa798;
            transition: all 0.3s;
            border-bottom: 1px solid #ffa798;
        }
        .item:target .subMenu{
            max-height: 30em;
        }
        
        .item:last-child{
            background-color: white;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        
    .col{
    	max-width: 65px !important;
    	
    }
	#allergy .subMenu{
		height: 60px;
		padding: 0 5px;
	}
	.allergy{
		width: 55px;
		padding-right: 0;
		padding-left: 0;
		margin-right: 2px;
		margin-left: 2px;
	}
    .allergy img{
    	margin-top: 2px;
    	margin-bottom: 2px;
        width: 30px;
    }
    small{
    	font-size: 13px;
    }
	.allergy,small{
		cursor: pointer;
	}
	
	.full{
		border: #ff9e81 .2px solid;
		border-radius: 10%;
		box-sizing: border-box;
	}
	
	.fullClick{
		background-color: #ff9e81;
	}
	
	/* modal 사이즈 지정 */
	modal-fullsize {
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
    .food-li-checked {
      border: #ff4b4b solid 2px;
    }

	#food .subMenu{
		overflow-y: scroll;
	}
	#food .subMenu::-webkit-scrollbar {
	    display: none; /* 크롬, 사파리, 오페라, 엣지 */
	}
	
	/* close 버튼 */
	.fa-xmark:hover,.fa-magnifying-glass:hover{
		cursor: pointer;
	}
	.fa-magnifying-glass{
		margin-left: auto;
	}
	
	/* 찜 아이콘 */
	.heartIcon{
		color: red;
		font-size: 1.3rem; 
		margin-left:130px; 
		margin-top:10px; 
		margin-bottom: 2px;
		position: absolute;
		cursor: pointer;
	}
	.glasstIcon{
		color: black;
		font-size: 1.2rem; 
		margin-left:105px; 
		margin-top:10px; 
		margin-bottom: 2px;
		position: absolute;
		cursor: pointer;
	}
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
                        <span>${info.id }</span>

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
                                <a href="<c:url value="/project/MyPage.do"/>" class="tab-button">건강 다이어리</a>
                                <a href='#' class="tab-button" style="color:#fa7a7ab9">찜방&리뷰관리</a>
                                <a href="<c:url value="/project/MyPage3.do"/>" class="tab-button"><img alt="pill" src='<c:url value="/images/basic/pills.png"/>' style="width: 21px"/>${fn:substring(info.name,1,3) }님의 약장</a>
                            </div>
                        </div>
                        <div class="body_box">
                            <div class="update_box">
                                <div class="news">
                                    <div class="update_font">
                                        영양제 찜방
                                    </div>
                                    <div class="board recently" style="flex:1;">
                                        <article class="WishListMain__Body-sc-uykdsg-3 lnMHMg">
                                        	<!-- 정보 없으면 emptypills.jpg 이미지 띄우기 -->
                                            <c:if test="${empty foodlike }" var="isEmptyFood">
                                               	<span class="d-block h-50 my-n5"></span>
                                    			<img alt="empty" src="/images/basic/emptypills.jpg" style="width: 100%"/>
                                            </c:if>
                                            <ul class="kriRoB" style="list-style: none; padding-inline-start: 10px;">
                                                <c:if test="${not isEmptyFood }">
                                                	<c:forEach var="f" items="${foodlike }">
			                                            <li class="WishListMain__WishItem-sc-uykdsg-5 cqOzav">
			                                               	<input type="hidden" name="no" value='${f.NO }' />
			                                                <section class="kzDdbX">
			                                                    <section class="divimg">
			                                                       	<i class="heartG glasstIcon fa-solid fa-magnifying-glass"></i>
			                                                        <i id="heartIcon" class="heartIcon fa-solid fa-heart"></i>
			                                                        <img fetchpriority="high" src="${f.IMGURL }" style="width:150px; height:150px; margin-top: 10px; border-radius: 10px;">
			                                                    </section>
			                                                    <label for="wishBtn:rk0:" class="bPHVOx">
			                                                        <input id="wishBtn:rk0:" data-gtm-id="global-wish-button" data-event-type="true" type="checkbox" hidden="" checked="">
			                                                    </label>
			                                                </section>
			                                                <p class="kWbUNE" title="${f.FOODNAME }">${f.FOODNAME }</p>
			                                                <p class="kCBLwp" title="${f.COMPANY }">${f.COMPANY }</p>
			                                            </li>
	                                                </c:forEach>
    											</c:if>
    											
                                            </ul>
                                        </article>
                                    </div>
                                </div>
                            </div>
                            <div class="secnews">
                                <div class="miniroom_font">리뷰관리 페이지</div>
                                <div class="board">
                                    <ul class="kriRoBreview" style="list-style: none; padding-left: 0">
                                    	<c:if test="${empty review }" var="isEmptyReview" >
                                    		<span class="d-block" style="height: 100px;"></span>
                                    		<img alt="empty" src="/images/basic/empty_review.jpg" style="width: 100%; margin-left: 10px;"/>
                                    	</c:if>
                                    	<c:if test="${not isEmptyReview }">
	                                    	<c:forEach var="r" items="${review }">
		                                        <li class="review">
			                                        <section class="kzDdbXreview">
			                                            <section class="divimg" style="width: 160px;">
			                                            	<c:if test="${empty r['IMGURL'] }" var="imgEmpty">
			                                                	<img fetchpriority="high" src='<c:url value="/images/basic/noPhoto.jpg"/>' style="max-width:120px; color: transparent; margin-top: 15px; border-radius: 10px;">
			                                                </c:if>
			                                                <c:if test="${not imgEmpty }">
			                                                	<img fetchpriority="high" src="${r['IMGURL'] }" style="max-width:120px; height:120px; color: transparent; margin-top: 10px; border-radius: 10px;">
			                                            	</c:if>
			                                            </section>
			                                            <label for="wishBtn:rk0:" class="bPHVOx">
			                                                <input id="wishBtn:rk0:" data-gtm-id="global-wish-button" data-event-type="true" type="checkbox" hidden="" checked="">
			                                            </label>
			                                        </section>
			                                        <div class="reviewinfo w-100">
			                                        	<input type="hidden" name="no" value='${r["NO"]}' />
			                                           	<div class="d-flex justify-content-between w-100" style="height: 35px">
			                                            	<div class="star-count d-flex m-2 align-items-center">
												              	<i class='bi bi-star${r["STARSCORE"] >= 1 ? "-fill" : "" } rating' style="font-size:20px;color: #ffe23c;"></i>
												              	<i class='bi bi-star${r["STARSCORE"] >= 2 ? "-fill" : "" } rating' style="font-size:20px;color: #ffe23c;"></i>
												              	<i class='bi bi-star${r["STARSCORE"] >= 3 ? "-fill" : "" } rating' style="font-size:20px;color: #ffe23c;"></i>
												              	<i class='bi bi-star${r["STARSCORE"] >= 4 ? "-fill" : "" } rating' style="font-size:20px;color: #ffe23c;"></i>
												              	<i class='bi bi-star${r["STARSCORE"] == 5 ? "-fill" : "" } rating"'style="font-size:20px;color: #ffe23c;"></i>
												            </div>
			                                                <div class="sdp d-flex align-items-center">${fn:split(r['R_REGIDATE']," ")[0]}</div>
			                                            </div>
			                                            <div class="snp">${r['PRODUCTNAME'] }</div>
			                                            <div class="d-flex justify-content-between w-100">
				                                            <div class="srp">${r['CONTENT'] }</div>
				                                            <i id="reviewG" class="reviewG fa-solid fa-magnifying-glass mt-4"></i>
				                                            <i class="fa-solid fa-xmark mx-2 mt-4"></i>
				                                        </div>
			                                        </div>
		                                        </li>
	                                        </c:forEach>
                                        </c:if>
                                    </ul>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
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
    
    <!-- 건강정보 등록 모달 시작 -->
    <div class="modal fade" id="healthModal">	
		<div class="modal-dialog modal-dialog-centered modal-fullsize">
			<div class="modal-content modal-fullsize" style="width: 800px">
				
				<!-- Modal body -->
				<div class="modal-body d-flex justify-content-center">
					<form id="healthRegi" class="form-inline justify-content-center" action='<c:url value="/project/healthInfo.do"/>' method="POST">
						<div class="wrapper">
					        <ui class="mainMenu">
					        
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
					        </ui>
					    </div>
				    </form>
				</div>
			</div>
		</div>
	</div>
    <!-- 건강정보 등록 모달 끝 -->
    
</div>

<c:set var="worry" value="${my.worry}"/>
<c:set var="disease" value="${my.disease}"/>
<c:set var="allergy" value="${my.allergy}"/>
<c:set var="food" value="${food}"/>
<c:set var="special" value="${my.special}"/>

</body>

<script>
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
	$('#select-div .food-li').click(function(){
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
	/*
	[{PRODUCTNAME=영롱 비건 쌀마그네슘, IMGURL=https://health-functional-food.s3.ap-northeast-2.amazonaws.com/saved/2020001201619/D35haRYto_L-8rbtpZ_pa}, {PRODUCTNAME=영양가득 한끼 쉐이크, IMGURL=https://health-functional-food.s3.ap-northeast-2.amazonaws.com/saved/200400200082123/iRgh5eZXMvtR2sQdqCStU}]
*/
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
			console.log('list',foodList)
			for(var i=0;i<foodList.length;i++){
				var alarm_fl = foodList[i].split(',')[3].split('=')[1];
				var food_name = foodList[i].split(',')[1].split('=')[1];
				var last_child = $(this).parent().children().slice(foodList.length).find('div').html();
				console.log('click',click.find('div').html())
				console.log('last',last_child)
				console.log('this',$(this).find('div').html())
				console.log('food_name:',food_name)
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
	
	//close버튼 클릭 시 리뷰 삭제하기
	$('.fa-xmark').click(function(){
		console.log('id:','${info.id}')
		console.log('no:',$(this).parent().parent().find('[name=no]').val())
		Swal.fire({
			  title: '삭제하시겠습니까?',
			  text: "삭제한 정보는 되돌릴 수 없어요!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Delete'
			}).then((result) => {
			  if (result.isConfirmed) {
				$.ajax({
					data:{
						id:'${info.id}',
						no:$(this).parent().parent().find('[name=no]').val()
					},
					url:'<c:url value="/DeleteReview.do"/>',
					method:'post',
					dataType:'json'
				}).done(data=>{
					console.log(data)
					if(data>=1){
					    Swal.fire(
					      '삭제완료!',
					      'success',
					      3000
					    )
					    setTimeout(function() {
					    	location.href = window.location.href;
						}, 3000);
					}	
				}).fail(function(){console.log('error')});
			  }
			})
	});
	
	//리뷰 돋보기 클릭 시 상세보기 페이지 이동
	$('.reviewG').click(function(){
		var no = $(this).parent().parent().find("[name=no]").val();
		location.href = '<c:url value="/detail.do?no="/>'+no;
	});
	
	//찜 돋보기 클릭 시 상세보기 페이지 이동
	$('.heartG').click(function(){
		var no = $(this).parent().parent().parent().find("[name=no]").val();
		location.href = '<c:url value="/detail.do?no="/>'+no;
	});
	
	//찜 하트 아이콘 클릭 시 찜 해제
	$('.heartIcon').click(function(){
		var foodname = $(this).parent().parent().parent().find('.kWbUNE').html();
		console.log('name:',foodname);
		if(confirm(foodname+'을(를) 찜 해제하시겠습니까?')){
			$.ajax({
				//data:{},
				url:'<c:url value="/Heart.do?foodname="/>'+encodeURIComponent(foodname)
			}).done(function(data){
				if(data.heart==='1'){
					location.replace(location.href);
				}
			}).fail(function(){
				console.log('error')
			});
		}
	});

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
		$('.modal-dialog').children(':eq(0)').css('height','330px');
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