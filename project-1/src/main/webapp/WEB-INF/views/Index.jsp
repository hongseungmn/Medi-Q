<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<style>
	
	/*인기 영양소 Top10*/
	.box-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .box {
            width: 60px;
            height: 110px;
			box-shadow: 0px 0px 7px rgba(0, 0, 0, 0.4);
        	transition: box-shadow 0.3s ease;
            border: 1px solid #ddd;
            border-radius: 10px 10px 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            position: relative;
            margin: 14px; /*배치되는 div 크기 맞추기*/
        }

        .box a {
            color: black;
            text-decoration: none;
        }

        .box:hover {
            font-weight: bold;
            box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.8);
        }

        .box.active {
            background-color: #bbb;
        }
    
		.videologo {
		    font-family: Arial, sans-serif;
		    font-size: 24px;
		    color: #FFFFFF;
		    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
		}
html {
    overflow: hidden;
}

html, body {
    display: block;
    width: 100%;
    height: 970px;
    margin: 0;
    max-height: 970px;
}

.tssection {
    width: 100%;
    height: 963px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 1s cubic-bezier(0.340, -0.600, 0.515, 1.570);
    max-height: 970px;
    
}
/*
#tssection2 {
	background: url(https://www.cellmed.co.kr/assets/images/main/product-bg.jpg) no-repeat;
	justify-content: space-between;
	background-size: cover;
}
#tssection3 {
	background: url(https://www.cellmed.co.kr/assets/images/main/news-bg.jpg) no-repeat;
	justify-content:space-between;

}
#tssection4 {
	background: linear-gradient(to top left, transparent 30%, white 100%), url(https://img.freepik.com/free-photo/taking-vitamins_1098-16551.jpg?w=1060&t=st=1690021099~exp=1690021699~hmac=29af497e396321790243698990b0eeb3402ae24ab8682741b176aedc40f62ef6) no-repeat;
	background-size: 75%;
	justify-content:flex-end;
}
#tssection5 {
	background: url(https://img.freepik.com/premium-photo/q-and-a-question-and-answer-shot-form-on-wooden-block_384017-2685.jpg) no-repeat;
	background-size: 60%;
	justify-content:flex-end;
}
#tssection6 {
	background-color: white;
	flex-direction: column;
		background: linear-gradient(to right, rgb(249, 181, 172, 0.3) 40%, white 40%);
	
}*/

#tssection2 {
	background-color:white;
	background: linear-gradient(to right,#fdfbf6 40%, white 40%);
	flex-direction: column;
	align-items: flex-end;
	justify-content:flex-start;
	position: relative;		
}
#tssection3 {
	background: linear-gradient(to right, white 60%, #fdfbf6 40%);
	flex-direction: column;
	align-items: flex-start;
	position: relative;	
}
#tssection4 {
	background-color:white;
	background: linear-gradient(to right, #fdfbf6 50%, white 50%);
	position: relative;
	
}
#tssection5 {
	background: linear-gradient(to right, white 50%, #fdfbf6 50%);
	position: relative;
	
}
#tssection6 {
	background-color:white;
	background: linear-gradient(to bottom, #fdfbf6 54% , white 54%);
	flex-direction: column;
	position: relative;
}
#tssection7 { 
	background: linear-gradient(to bottom, white 50%, #fdfbf6 50%);
	flex-direction: column;
	position: relative;
}
#tssection8 {
	background-color: #fdfbf6;
	flex-direction: column;
}  
.p2firstimg{
	position: absolute; 
	z-index:2; 
	top:90%; 
	left:29%; 
	width:650px; 
	height:350px; 
	transform: translate(-29%, -90%);
	border-radius: 50%;
	
}
.p2secondimg{
	position: absolute; 
	z-index:1; 
	top:60%; 
	left:6%; 
	transform: translate(-6%, -60%);
	width:600px; 
	height:700px; 
	mix-blend-mode: multiply; /* 블렌딩 효과를 주는 속성 */
	opacity: 0.9; /* 이미지 블렌딩 효과를 위해 약간 투명도 조정 */
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); 
	border: 5px solid white;
	border-radius: 5px;
}
.p3firstimg{
	position: absolute; 
	z-index:2; 
	top:95%; 
	right:9%; 
	width:650px; 
	height:350px; 
	transform: translate(-9%, -95%);
	border-radius: 50%;
}
.p3secondimg{
	position: absolute; 
	z-index:1; 
	top:60%; 
	right:3%; 
	transform: translate(-3%, -60%);
	width:600px; 
	height:700px; 
	mix-blend-mode: multiply; /* 블렌딩 효과를 주는 속성 */
	opacity: 0.9; /* 이미지 블렌딩 효과를 위해 약간 투명도 조정 */
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); 
	border: 5px solid white;
	border-radius: 5px;
}
.p4firstimg{
	position: absolute; 
	z-index:2; 
	top:85%; 
	left:26%; 
	width:650px; 
	height:350px; 
	transform: translate(-26%, -85%);
	border-radius: 50%;
	
}
.p4secondimg{
	position: absolute; 
	z-index:1; 
	top:60%; 
	left:6%; 
	transform: translate(-6%, -60%);
	width:800px; 
	height:700px; 
	mix-blend-mode: multiply; /* 블렌딩 효과를 주는 속성 */
	opacity: 0.9; /* 이미지 블렌딩 효과를 위해 약간 투명도 조정 */
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); 
	border: 5px solid white;
	border-radius: 5px;
}
.p5firstimg{
	position: absolute; 
	z-index:2; 
	top:95%; 
	right:-5%; 
	width:650px; 
	height:350px; 
	transform: translate(0%, -95%);
	border-radius: 50%;
}
.p5secondimg{
	position: absolute; 
	z-index:1; 
	top:60%; 
	right:3%; 
	transform: translate(-3%, -60%);
	width:800px; 
	height:700px; 
	mix-blend-mode: multiply; /* 블렌딩 효과를 주는 속성 */
	opacity: 0.9; /* 이미지 블렌딩 효과를 위해 약간 투명도 조정 */
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3); 
	border: 5px solid white;
	border-radius: 5px;
}
.p6firstimg{
	position: absolute; 
	z-index:2; 
	top:85%; 
	right:5%; 
	width:700px; 
	height:500px; 
	transform: translate(20%, -85%);
	border-radius: 50%;
}
.p6secondimg{
	position: absolute; 
	z-index:1; 
	top:40%; 
	right:6%; 
	transform: translate(45%, -60%);
	width:800px; 
	height:600px; 
}
.p6threeimg{
	position: absolute; 
	z-index:1; 
	top:44%; 
	left:0%; 
	transform: translate(-2%, -80%);
	width:600px; 
	height:500px; 
}
.p2firsta {
	position: absolute;
	z-index:2;
	top:475px; 
	right:270px;
	color:gray;
	padding: 10px; 
	text-align: center;
	font-size: 15px;
	border-radius: 15px;
	font-weight: bold;
}
.p2firsta:hover {
	box-shadow: 2px 2px 5px gray;
}
.p3firsta {
	position: absolute;
	z-index:2;
	top:480px; 
	left:817px;
	color:gray;
	padding: 10px; 
	text-align: center;
	font-size: 15px;
	border-radius: 15px;
	font-weight: bold;
}
.p3firsta:hover {
	box-shadow: 2px 2px 5px gray;
}
.p7firsta {
	position: absolute;
	z-index:2;
	top:240px; 
	right:550px;
	color:gray;
	padding: 10px; 
	text-align: center;
	font-size: 15px;
	border-radius: 15px;
	font-weight: bold;
}
.p7firsta:hover {
	box-shadow: 2px 2px 5px gray;
}
.p3secimg{
	position: absolute; 
	z-index:1; 
	top:500px; 
	right:10px; 
	width:550px; 
	height:500px; 
	border-radius: 20px;
}
.p2div2 {
	width: 1000px;
	margin-top: 20px;
}
.p2div3 {
	width: 1000px;
	margin-top: 300px;
}

.p2h1 {
	width:100%;
	margin: 2.2vh 0 0;
    font-size: 50px;
    color: #fff;
    font-weight: 600;
    line-height: 1.5em;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.hori3{
	position: absolute; 
	top: 80px;
	right: 170px;
}
 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
 .wrap * {padding: 0;margin: 0;}
 .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
 .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
 .info .title {padding: 5px 0 0 10px;height: 35px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
 .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
 .info .close:hover {cursor: pointer;}
 .info .body {position: relative;overflow: hidden;}
 .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
 .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
 .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
 .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
 .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
 .info .link {color: #5085BB;}
 
 
 
 
 
 
</style>
<!-- 슬라이더를 위한 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<!-- 해시태그를 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<!-- 슬라이드 반응형 jqery -->
<script src="<c:url value="/tsfolder/js/jquery.sticky-kit.min.js"/>" ></script>




 	<!-- 처음 인덱스 킬때 전체화면 비디오 출력 -->
			<div id="tsvideo-container">
			    <video id="video" autoplay muted loop>
	                <source src="<c:url value="/video/intro1_.mp4"/>" type="video/mp4">
			    </video>
			    <div class="videologo" style=" font-size:27px; color:white; margin-top: 190px; margin-bottom: 220px; margin-left: 520px; margin-right: 520px;">
	           		<!-- 동영상 화면 문구 -->
		        	<div class="text-center" style="display: flex; align-items: center; justify-content: center; font-size: 65px; font-weight:bold;">건강고민은&nbsp;  
						<img class="pr-3 pl-1" src="<c:url value="/images/mainicon.png"/>" loading="lazy" width="120" height="75">
	           			<img class="pr-2" src="<c:url value="/images/maintitle.png"/>" loading="lazy" width="300" height="75">
					</div>
		        	<br/>
		        	<div class="text-center" style="margin-top: 50px;">영양제 분석, 건강예측 AI 등 저희만의 특별한 서비스를 이용해보세요.</div>
		        	<div class="text-center" style="margin-top: 30px;">스마트 헬스케어 솔루션, MEDI-Q가 여러분을 위해 준비되어 있습니다!</div>
		        	<!-- 홈버튼 -->
		        	<div style="display: flex; align-items: center; justify-content: center;">
			        	<div id="video-controls" style="margin-top:390px; margin-right: 250px;">
					        <button class="btn" onclick="closeVideo()" style="width:120px; background-color: rgb(248,182,43);">홈으로 이동</button>
					    </div>
					    <!-- 그만보기 -->
					    <div id="video-label" style=" margin-top:390px; margin-right: 300px; display: flex; align-items: center; justify-content: center;">
				    	    <label for="stop-video-checkbox" style="font-size:18px; color:white; margin-bottom:30px; font-weight: normal; cursor: pointer;">
					        오늘 하루 그만 보기
					        <input type="checkbox" id="stop-video-checkbox" style="width:20px;">
					        </label>
					    </div>
					</div>
			    </div>
			</div>
			
<!-- 
<p style="position: absolute; top:100px; z-index: 999999;">
  <button class="tset" id="tssection1" type="button">1</button>
  <button class="tset" id="tssection2" type="button">2</button>
  <button class="tset" id="tssection3" type="button">3</button>
  <button class="tset" id="tssection4" type="button">4</button>
  <button class="tset" id="tssection5" type="button">5</button>
  <button class="tset" id="tssection6" type="button">6</button>
  <button class="tset" id="tssection7" type="button">7</button>
  <button class="tset" id="tssection8" type="button">8</button>
</p>
 -->
 
	<!-- 페이지 1 -->
	 <div class="tssection tssection1" id="tssection1">
		  <section id="section-119" style="margin-bottom: 30px;">
		        <div class="content-slider">
		          <input type="radio" id="banner1" class="sec-1-input" name="banner" checked>
		          <input type="radio" id="banner2" class="sec-1-input" name="banner">
		          <input type="radio" id="banner3" class="sec-1-input" name="banner">
		          <input type="radio" id="banner4" class="sec-1-input" name="banner">
		          <div class="slider">
		            <div id="top-banner-1" class="banner">
			            <a href="#">
			              <div class="banner-inner-wrapper" id="banner-inner-wrapper1">
			              	 <p >어떤 건강고민이 있으신가요?</p>
			                 <h1 style="font-size: 57px;"> MEDI-Q와 함께 건강한 삶을 시작해보세요!</h1>
			              </div>
			            </a>
		            </div>
		            <div id="top-banner-2" class="banner" id="tsbaimg2">
			            <a href="<c:url value="/NutrientSelect.do"/>">
			              <div class="banner-inner-wrapper" id="banner-inner-wrapper2">
			               	 <p >내가 먹고 있는 영양제 괜찮을까?</p>
			                 <h1> 영양성분을 검색해보세요!</h1>
			              </div>
			            </a>
		            </div>
		            <div id="top-banner-3" class="banner" id="tsbaimg3">
			            <a href="<c:url value="/analyzeMyFood.do"/>">
			              <div class="banner-inner-wrapper" id="banner-inner-wrapper3" >
			                 <p >과도하거나 부족하지 않을까?</p>
			                 <h1> 복용 중인 영양제를 분석받으세요!</h1>       
			              </div>
			            </a>
		            </div>
		            <div id="top-banner-4" class="banner" id="tsbaimg4">
			            <a href='<c:url value="/loadHealthInfo.do?userId=${userId}"/>'>
			              <div class="banner-inner-wrapper" id="banner-inner-wrapper4" >
			              	 <p >내 위암 발병률은 몇 퍼센트일까?</p>
			              	 <h1 >주요 질환의 발병 위험도를 예측해드려요!</h1>
			              </div>
			            </a>
		            </div>
		          </div>
		          <nav>
		            <div class="controls" >
		              <label for="banner1"><span class="progressbar"><span class="progressbar-fill"></span></span><p>홈페이지</p></label>
		              <label for="banner2"><span class="progressbar"><span class="progressbar-fill"></span></span><p>영양소 검색</p></label>
		              <label for="banner3"><span class="progressbar"><span class="progressbar-fill"></span></span><p>건강 및 분석</p></label>
		              <label for="banner4"><span class="progressbar"><span class="progressbar-fill"></span></span><p>건강검진</p></label>
		            </div>
		          </nav>
		        </div>
		    </section>
		  </div>
              
		<!-- 검색창 밑 검색 태그용 버튼  -->
		<!-- 페이지 2 -->
		<div class="tssection tssection2" id="tssection2">
			<img class="p2firstimg" src="<c:url value="/images/tsimages/mascot.png"/>" >
			<img class="p2secondimg" src="https://img.freepik.com/free-photo/healthy-lifestyle-of-veggies-and-fruit-slices_23-2148502235.jpg?t=st=1690263535~exp=1690264135~hmac=69f1fdeef82a37792807b85518bb146bceca7503b5c246ce5dc3a2b84c8f0535" >
			<a type="button" class="p2firsta btn" href='<c:url value="/NutrientSelect.do"/>' >더 보기 →</a>
			 <div class="animatedright" style="margin-right: 200px; align-items: center;">
				<div class="row justify-content-center pt-5" style="margin: 50px 0px 50px 0px; width: 800px">
			        <div class="p2div2 text-center" >
			            <h1 class="p2h1 px-5 mb-5"><span style="color: #EF605D;">영양소를 </span> 검색해보세요.</h1>
			            <form class="position-relative w-100 mx-auto animated slideInDown d-flex input-wrapper" required minlength="1" action="<c:url value="/functionfood/select.do"/>" style="box-shadow: 0px 0px 5px gray; border-radius: 20px;">
			                <input class="border-0 w-100 px-5 py-3 ps-4 pe-5 flex-grow-1" type="text" name="foodname" placeholder="제품명 및 영양성분을 입력하세요" style="border-radius: 20px 0px 0px 20px;" >
			                <button type="submit" class="btn py-2 px-4 top-0 end-0 me-2" style="background-color: white; border-radius: 0px 20px 20px 0px;" >
								<img src="<c:url value="/images/tsimages/free-icon-magnifying-glass-4475396.png"/>" style="width:30px; height:30px">
							</button>
			            </form>
			        </div>
			    </div>
			 </div>
		  	
		  	<div class="section section1-2s ranking-190" style="margin-right: 55px;">
		        <div class="content" style="margin:40px 80px 0px 0px;">
		            <div class="txt2"><span style="color:black; font-size: 30px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">🌿 인기 영양소</span> <span style="font-size: 30px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">Top 10</span></div>
		            <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:0px 0px 35px; ">현재 조회수가 가장 높은 영양소 Top10을 알려드릴게요</p>
		            <div class="ingredient-wrap" style="margin-left: 20px;">
                    <div class="box-container" style="margin: 0px;">
		                <c:forEach var="name" items="${top10}">
						    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
						        <b style="font-size: 14px;">${name}</b>
						    </div>
						</c:forEach>
                	</div>
	              </div>
		        </div>
		    </div>
		</div>
	    
     <!-- 페이지 3 -->
	  <div class="tssection tssection3" id="tssection3">
		<img class="p3firstimg" src="<c:url value="/images/tsimages/mascot.png"/>" >
		<img class="p3secondimg" src="https://img.freepik.com/premium-photo/vitamins-herbal-supplements-jars-with-green-plant-white-background-with-space-text-biologically-active-additives_76158-538.jpg" >
		<a type="button" class="p3firsta btn" href='<c:url value="/ranking/selectfood.do"/>' >더 보기 →</a>	
	  	<div class="animatedleft" style="margin-left: 200px;">
			<div class="row justify-content-center pt-2" style="margin: 10px 0px 50px 0px; width: 800px">
		        <div class="p2div3 text-center" >
		            <h1 class="p2h1 px-5 mb-5"><span style="color: #EF605D;">영양제를 </span> 검색해보세요.</h1>
		            <form class="position-relative w-100 mx-auto animated slideInDown d-flex input-wrapper" required minlength="1" action="<c:url value="/functionfood/select.do"/>" style="box-shadow: 0px 0px 5px gray; border-radius: 20px;">
		                <input class="border-0 w-100 px-5 py-3 ps-4 pe-5 flex-grow-1" type="text" name="foodname" placeholder="제품명 및 영양성분을 입력하세요" style="border-radius: 20px 0px 0px 20px;" >
		                <button type="submit" class="btn py-2 px-4 top-0 end-0 me-2" style="background-color: white; border-radius: 0px 20px 20px 0px;" >
							<img src="<c:url value="/images/tsimages/free-icon-magnifying-glass-4475396.png"/>" style="width:30px; height:30px">
						</button>
		            </form>
		        </div>
		    </div>
		 </div>
	  
	  	<div class="section section1-2s ranking-190">
		        <div class="content" style="margin:40px 0px 0px 90px;">
		            <div class="txt2"><span style="color:black; font-size: 30px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">💊 인기 영양제</span> <span style="font-size: 30px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">Top 5</span></div>
		            <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:0px 0px 35px; ">현재 리뷰가 가장 좋은 영양제 Top5을 알려드릴게요</p>
		            <div class="tab-contents" style="display: block; margin-right: 17px;" >
		                <div class="tab-content tab-content-001 new-wide-main-060 new-wide-main-090 active width-flt1">
		                    <div class="box-container ranking-card-wrap item-cards u510x">
	                            <c:forEach items="${listData}" var="item" varStatus="status">
	                            <c:if test="${status.index < 5}">
									<a style="text-decoration: none;" id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="box item-card" title="${item.productName} 자세히 보기">
									<c:if test="${not empty item.imgURL}">
										<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
									</c:if>
			          				<c:if test="${empty item.imgURL}">	
										<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
									</c:if>
										<span id="item.company" class="txt1" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${item.company}</span>
										<span id="item.productName" class="txt2">${item.productName}</span>
										<div class="review d-flex" style="width:inherit;">
											<span class="star-point"><fmt:formatNumber value="${item.AVG_Score }" pattern=".00"  var="AVG"/>${AVG }</span>
											<span class="txt3">(${item.REVIEW_Count }개)</span>
										</div>
									</a>
								</c:if>
								</c:forEach>
		                    </div><!-- card-wrap의 끝 -->
		                </div><!-- tab-content-001의 끝 -->
		            </div>
		        </div>
		    </div>
	 </div>    
	 
		<!--  페이지4 -->
	  <div class="tssection tssection4" id="tssection4">
			<img class="p4firstimg" src="<c:url value="/images/tsimages/mascot.png"/>" >
			<img class="p4secondimg" src="https://img.freepik.com/free-photo/clipboard-with-pills-frame_23-2148533094.jpg?size=626&ext=jpg&ga=GA1.2.1515223053.1688355068&semt=ais" >
		  <div class="gCSEJp animatedright" style="margin-bottom: 100px;">
	     	<c:if test="${not empty analyzeReport}">
		        <h1 class="mb-3 text-center" >📋 <span style="color:#EF605D; font-size: 42px;">${userName}</span>님의 최근 분석 리포트</h1>
		        <div class="ml-1 ibNwmg d-flex" style="justify-content:flex-start; margin-top: 30px; margin-bottom: 40px;">
		            <a data-gtm-id="report-home-recent-blank" class="ktaGqG" href="<c:url value="/analyzeMyFood.do"/>" style="text-decoration: none; background-color: 
				    ${	analyzeReport.score >= 0 && analyzeReport.score < 25 ? 'rgba(255, 0, 0, 0.7)' :
				        analyzeReport.score >= 25 && analyzeReport.score < 50 ? 'rgba(255, 165, 0, 0.7)' :
				        analyzeReport.score >= 50 && analyzeReport.score < 75 ? 'rgba(0, 128, 0, 0.7)' :
				        analyzeReport.score >= 75 && analyzeReport.score <= 100 ? 'rgba(0, 0, 255, 0.7)' :
				        ''
				    };" >
		                <article class="hBxOSS" style="display: block;">
		                    <div class="iJGurJ">
		                        <div style="margin: 10px 0px 0px 20px;">
		                        	
		                            <div class="enbDhJ1 mx-3">최근 분석 결과입니다 &nbsp;<span class="p-1"style="font-size:15px;color:white;background-color:#EF605D;border-radius:15px;">${analyzeReport.analyzeDate}</span> </div>
		                            <p class="jeiOCr1" style="">${analyzeReport.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
		                        </div>
		                        <div class="ZyIFk1 d-block mt-3" style="margin-left: 20px;">
		                            <div><span style="color:#545454; font-weight: bold;">섭취 목적</span> :<br/> ${analyzeReport.takePurposes}</div>
		                            <div><span style="color:#545454; font-weight: bold;">섭취중인 영양제</span> :<br/> ${analyzeReport.takeFoods}</div>
		                        </div>	                   
	         </c:if>
	         <c:if test="${empty analyzeReport}">
	             <h1 class="text-center" style="font-size: 30px; color: black;">📋 나와 잘 맞는 영양제일까?</h1>
	             <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:35px 0px;">적절하게 영양제를 먹고 있는지 MEDI-Q가 분석해 드릴게요</p>
			        <div class="ibNwmg ml-1 d-flex" style="justify-content:flex-start; margin-bottom: 35px;">
			            <a data-gtm-id="report-home-recent-blank" class=" ktaGqG" href="<c:url value="/analyzeMyFood.do"/>" style="text-decoration: none;">
			                <article class=" hBxOSS" style="display: block;">
			                    <div class=" iJGurJ">
			                      	<div>
			                       	<img src="https://cdn.pillyze.io/web/img/qna_anna_2x.webp" class="qwdfe" alt="전문가 그림">
			                            <div class=" enbDhJ ">나의 영양제 분석하고 추천받기</div>
			                            <p class="jeiOCr" style="margin-top: 40px;">답답했던 <span style="color:#EF605D;">영양제의 모든 것!</span> <br/>전문가와 함께해요 </p>
	          						</div>
	         </c:if>
	                   		</div>
	                	</article>
	             	</a>
	          	</div>
	     	</div>
	  </div>
	  
	  <!-- 페이지5 -->
	  <div class="tssection tssection5" id="tssection5">
		<img class="p5firstimg" src="<c:url value="/images/tsimages/mascot.png"/>" >
		<img class="p5secondimg" src="https://img.freepik.com/premium-photo/analyses-large-amounts-data-idea-business-intelligence-charts-company-finances-are-displayed-screen-that-is-simulated_27634-1108.jpg?size=626&ext=jpg&ga=GA1.1.1515223053.1688355068&semt=ais" >
	  	<div class="section section1-2c animatedleft">
	       <a href="<c:url value="/loadHealthInfo.do?userId=${userId}"/>" style="text-decoration: none;">
	           <div class="content">
	               <span class="txt1" style=" text-align: center; width: 100%;">👨‍⚕️ 주요 질환의 <span style="color: #EF605D;">발병 위험도</span>를 예측해드려요 </span>
	               <br/>
	               <span class="text-center txt2" style="margin:20px 0px 35px 0px; font-weight: bold;">MEDI-Q의 인공지능 기술로 분석하는 질병예측!</span>
	               <div class="banner-wrap">
	                   <div class="banner-txt1 mb-1">내 건강검진 결과를 입력하고</div>
	                   <div class="banner-txt2"><span>맞춤형 영양제를 추천</span> 받으세요</div>
	                   <img src="https://cdn.pillyze.io/web/img/s12c-bg.webp" class="banner-bg" alt="두 손으로 알약을 떠 받드는 그림">
	               </div>
	           </div>
	       	</a>
	   	</div>
	  </div>
	    
	  	<!--  페이지6 -->
	   <div class="tssection tssection6" id="tssection6">
	   		<img class="p6firstimg" src="<c:url value="/images/tsimages/mascot.png"/>" >
	   		<img class="p6secondimg" src="<c:url value="/images/tsimages/question.png"/>" >
	   		<img class="p6threeimg" src="<c:url value="/images/tsimages/faqs.png"/>" >
		   <div class="section section20-2 section20-2-home ">
		        <div class="content">
		            <!-- <div class="qna-mark-home" style="display: block; text-align: center; width: 100%;">Q&amp;A</div> -->
		            <span class="ge-title get-20-2" style="margin-bottom: 40px;">💡 지금 인기있는 질문 <p class="qna-mark-home" >Q&amp;A</p></span>
		            <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:0px 0px 40px; ">현재 추천수가 가장 높은 질문 Top3를 알려드릴게요</p>
		            <a type="button" class="p2firsta btn hori3" href="<c:url value="/board/List.do" />">더 보기 →</a>
		            <div class="clearfix mb-2" style="position: absolute; right:10px; top:-400px">
		            </div>
		            <div class="qna-list-wrap">
		            	<c:forEach var="like" items="${likes }"><!-- 추천수 TOP3 -->
		                    <div class="qna-card">
		                        <div class="ingredient-tags">
		                            <!-- 
		                            <div class="ingredient-tag">
		                                기타
		                            </div>
		                            -->
		                        </div>
		                        <br/>
		                        <a tabindex="0" class="text-decoration-none qna-main" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=${like.NO }"/>">
		                            <span class="txt1"><span class="qmark">Q.&nbsp;</span>${like.TITLE }</span>
		                            <span class="txt2">${like.CONTENT } </span>
		                        </a>
		                        <a tabindex="0" class="text-decoration-none qna-user-wrap" title="이 Q&amp;A의 상세정보 보기" href="<c:url value="/board/View.do?no=${like.NO }"/>">
		                                <!--  답변에 대한 것이라 삭제 예정
		                                <div class="qna-user-icon qna-user-icon-1"></div>
		                                <c:if test="${status.index ==0 }"> 
		                                	<div class="qna-user-txt">액체형(리퀴드) 오메가3 제품을 선택하거나, 일반 캡슐 제품을 잘라서 내용물만 섭취하시는 것을 추천해요! </div>
		                                </c:if>
		                                <c:if test="${status.index ==1 }"> 
		                                	<div class="qna-user-txt">코로나 감염을 예방하기 위해, 또는 코로나 후유증에서 빨리 벗어나기 위해서는 비타민 C, 비타민 D, 아연 등 면역에 관련된 영양제가 도움이 됩니다. </div>
		                                </c:if>
		                                <c:if test="${status.index ==2 }"> 
		                                	<div class="qna-user-txt">과다복용은 부작용을 유발할 수 있어요. 식품의약품안전처 혹은 제품에 명시된 적정량을 섭취하는걸 추천합니다. </div>
		                                </c:if>
		                                 -->
		                            <div class="user-info-row" style="margin-top: 5px;">
		                                <span class="user-name">${like.NAME }</span>
		                                <span class="user-agesex"> ${like.AGE_GROUP} / ${like.GENDER}  ${like.POSTDATE }</span>
		                            </div>
		                        </a>
		                    </div>
			            </c:forEach>
		            </div>
		            <!-- 
		            <div class="clearfix mb-2" style="position: absolute; right:100px; top:80px;">
		                <a tabindex="0" class="text-decoration-none more-qna" href="<c:url value="/board/List.do" />">Q&amp;A 더보기</a>
		            </div>
		             -->
		        </div>
		    </div>
	  	</div>
       
      
      <!--  페이지7 -->
	  <div class="tssection tssection7" id="tssection7">
		<span class="tststs">영양성분과 건강에 대한 모든 것<br/> 📖<strong style="color:#EF605D"> MEDI-Q </strong> 에서 확인하세요!</span>
		<a type="button" class="p7firsta btn" href='<c:url value="/magazineindex.do"/>' >더 보기 →</a>
	    <div class="tscacontainer  animated">
	          <div id="carousel">
	              <figure><a href="<c:url value="/magazine.do?no=01"/>"><img src="<c:url value="/images/thumbnail_img/RedM_Arg.jpg"/>" style="width:100%; height:240px" ></a></figure>
	              <figure><a href="<c:url value="/magazine.do?no=07"/>"><img src="<c:url value="/images/thumbnail_img/PurpleM_Ten.jpg"/>" style="width:100%; height:240px" ></a></figure>
	              <figure><a href="<c:url value="/magazine.do?no=08"/>"><img src="<c:url value="/images/thumbnail_img/PurpleM_Hei.jpg"/>" style="width:100%; height:240px" ></a></figure>
	              <figure><a href="<c:url value="/magazine.do?no=10"/>"><img src="<c:url value="/images/thumbnail_img/GreenM_Depre.jpg"/>" style="width:100%; height:240px" ></a></figure>
  	              <figure><a href="<c:url value="/magazine.do?no=11"/>"><img src="<c:url value="/images/thumbnail_img/GreenM_Yoo.jpg"/>" style="width:100%; height:240px" ></a></figure>
  	              <figure><a href="<c:url value="/magazine.do?no=14"/>"><img src="<c:url value="/images/thumbnail_img/SkyM_Yoo_2.jpg"/>" style="width:100%; height:240px" ></a></figure>
  	       		  <figure><a href="<c:url value="/magazine.do?no=15"/>"><img src="<c:url value="/images/thumbnail_img/SkyM_Vita.jpg"/>" style="width:100%; height:240px" ></a></figure>
	          	  <figure><a href="<c:url value="/magazine.do?no=17"/>"><img src="<c:url value="/images/thumbnail_img/YellowM_Depre.jpg"/>" style="width:100%; height:240px" ></a></figure>
	          	  <figure><a href="<c:url value="/magazine.do?no=19"/>"><img src="<c:url value="/images/thumbnail_img/YellowM_Diet.jpg"/>" style="width:100%; height:240px" ></a></figure>
	          </div>
	      </div>
	 </div>	  
	    
	  
	    
	   <!--  페이지8 -->
	  <div class="tssection tssection8" id="tssection8" style="padding-bottom: 60px;">
	      <div class="mainInner" style="margin: 50px 0px;">
	            <h3 class="my-4 animated" >우리 동네에 있는<span style="color: #EF605D"> 🩺병원 & 💊약국</span>찾기</h3>
	            <p style="text-align: center; color:gray; font-weight: bold; font-size:18px; margin:35px 0px;">우리동네에 어떤 병원과 약국이 있을까?</p>
	            <div class="container-xxl pb-4">
	                <div class="container">
	                    <div class="mainMap" id="map" style="border-radius: 10px;">
	                        <button type="button" class="btn" id="tsBtn">
	                        	<span>🩺병원 & 💊약국찾기</span>
	                        </button>
	                        <div class="mapLayer">
	                            <div class="closeLayerButton" onclick="closeMapLayer()">&times;</div>
                            	<h2>주소</h2>
      	                     	<p style="font-size:17px; color:gray; font-weight: bold; margin-bottom: 0px;">서울특별시 금천구 가산디지털2로 101<br/> B동 B304호(MEDI-Q팀)</p>
      	                     	<p style="font-size:15px; color:gray;">(주)한국소프트웨어아이엔씨 (153-759)</p>
                           		<a href="https://naver.me/Fcacgzd6" target="_blank">
                           		<img src="<c:url value="/images/tsimages/img_naver.png"/>" alt="NAVER">  지도로 보기</a>
                           		<a href="https://map.kakao.com/?urlX=473291&urlY=1104884&urlLevel=3&itemId=1784287516&q=%ED%95%9C%EB%9D%BC%EC%9B%90%EC%95%A4%EC%9B%90%ED%83%80%EC%9B%8C&srcid=1784287516&map_type=TYPE_MAP" target="_blank"> 
                           		<img src="<c:url value="/images/tsimages/img_daum.png"/>" alt="다음지도 보기">  지도로 보기</a>
	                        </div>          
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!--  병원찾기 지도 모달 누르면 나오는 부분 -->
		       <div class="modal fade align-items-center" id="tsModal" role="dialog" style="background-color: rgba(0, 0, 0, 0.5);">
				 <div class="modal-dialog modal-dialog-centered" style="align-content :center; width: 100%; height: 60%; max-width: 1400px;">
				   <!-- Modal content-->
				   <div class="modal-content" style="width: 100%; height: 100%;">
				     <div class="modal-header" >
				       <h4 class="modal-title">우리동네 병원&약국 찾기</h4>
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				     </div>
				     <div class="modal-body">
				       <h3 style="text-align: center;">🩺병원 & 💊약국정보</h3>
				       <div class="container-xxl py-5">
				         <div class="map_wrap">
				           <div id="modalmap" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				           <div id="menu_wrap" class="bg_white">
				             <div class="option">
				               <div>
				                    키워드 : <input type="text" value="가산동 병원" placeholder="ㅇㅇ동 병원을 입력" id="keyword" size="15">
				                    <button type="submit" id="sendSearchData">검색하기</button>
				                </div>
				              </div>
				              <hr>
				              <ul id="placesList"></ul>
				              <div id="pagination"></div>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
			</div>

	<!--  메인 하단 -->
	<!--  페이지10 보류
	<div class="tssection" id="tssection10"> -->
		<div class="section section1-3" >
	       <div class="content d-flex" style="flex-direction:column; text-align:center; justify-content: center;">
	           <span class="txt1">건강한 영양제 &amp; 식단 관리를 위한 모든 것</span>
	           <span class="txt2">걱정 없이, 쉽고 간편하게</span>
	           <span class="txt3"><span>MEDI-Q</span>로 시작하세요.</span>
	       </div>
	   </div>
	    
		<div class="section section1-5">
	        <div class="content d-flex" style="flex-direction:column; text-align:center; justify-content: center;">
	            <span class="txt1"><span style="color: #EF605D"> MEDI-Q</span>는 신뢰가 가득하여 믿을 수 있어요.</span>
	            <span class="txt2" style="font-weight: bold;"><span style="color: #EF605D"> MEDI-Q</span>는 국내외 검증된 기관과<br>신뢰도 높은 연구 결과를 바탕으로 개인 맞춤형 분석 결과를 제공합니다.</span>
	            <div class="rl-companies">
	                <div class="rl-company rl-company1">식품의약품안전처</div>
	                <div class="rl-company rl-company2">식품안전정보원</div>
	                <div class="rl-company rl-company3">한국영양학회</div>
	                <div class="rl-company rl-company4">EFSA</div>
	                <div class="rl-company rl-company5">(사)대한약학회</div>
	                <div class="rl-company rl-company6">NIH</div>
	            </div>
	        </div>
	    </div>

<!-- 매인 배너 슬라이드 -->
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/gsap-latest-beta.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/CSSRulePlugin3.min.js"></script>
<!-- 지도 스크립트 키 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52555467618bde712ca6a08521dcc788&libraries=services"></script> 
 <!-- 메인 js-->
<script src="<c:url value="/tsfolder/js/mainjs.js"/>" ></script>
<script>
var btnArr = document.querySelectorAll('.tset');
var page = 1; // 현재 페이지 초기값
for(let i = 0; i < btnArr.length; i++){
  btnArr[i].addEventListener('click',function(e){
    e.preventDefault();
    page = i + 1; // 태그를 클릭할 때마다 페이지 값을 업데이트
    document.querySelector('.tssection' + (i + 1)).scrollIntoView(true);
  });
}
// 마우스 휠의 기본 동작을 방지
window.addEventListener("wheel", function(e){
    e.preventDefault();
}, {passive : false});
var mHtml = $("html");
mHtml.animate({scrollTop : 0}, 10);
$(window).on("wheel", function(e) {
    if(mHtml.is(":animated")) return;
    if(e.originalEvent.deltaY > 0) {
        if(page == 9) return;
        page++;
    } else if(e.originalEvent.deltaY < 0) {
        if(page == 1) return;
        page--;
    }
    var posTop = (page-1) * $(window).height();
    mHtml.animate({scrollTop : posTop});
});
</script>
</div><!-- id=main  -->