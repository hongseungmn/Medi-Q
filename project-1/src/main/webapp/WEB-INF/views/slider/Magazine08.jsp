<%--
  Created by IntelliJ IDEA.
  User: hongseongmin
  Date: 6/29/23
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
  .custom-top {
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 25px;
    margin-bottom : 150px;
    padding-top : 145px;
  }
  .contentTop{
  	padding-top: 35px;
  }
  .paragraph{
  	margin-top: 125px;
  	font-size: 23px;
  }
  .paragraph-title{
  	margin-top: 100px;
  }

  .custom-text{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 30px;
  }
   .custom-img{
  	margin-top: 40px;
  	margin-left: 40px;
  }
  .contents{
  	margin-top: 17px;
  	margin-left: 23px;
  }
  
  
   .custom-modal{
    width: 120px;
    background: #FFB6C1;
    padding: 10px;
    border-radius: 5px;
    color: #FFFFFF;
    text-align: center;
    font-size: 20px;
  }
  .modal-content{
  	background-color: #FFFAF0;
  	display: flex;
	justify-content: center;
	align-items: center;
	width: 770px;
  	height: 720px;
  }
  .modalB{
    margin-top : 20px;
  	margin-bottom: 50px;
  }
  .modalC{
  margin-left: 64px;
  }
  .subtitle{
  	font-size: 24px;
  	color: #191970;
  	margin-left: 18px;
  }
  
  
  .highLight {
    background-color : #AFEEEE;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #EE4949;
    font-size: 35px;
    font-weight: bold;
  }
  .my-hr {
    border:0;
    height: 3px;
    background-color: #ccc;
  }
  .wrap-vertical{

    padding: 20px;
    overflow: scroll;
    color: #112031;
    background: white;
    /* 가로 스크롤 */
    white-space: nowrap;
    height: 400px;
  }
  .card {
    display: inline-flex;
    margin : 10px;
    border: none;
  }
  .card-footer {
    border: none;
    background-color: white;
    padding: 5px 0 3px 3px;
    height: 100px;
    text-overflow: ellipsis;
  }
  .card-title {
    font-size: 15px;
    color:#a7a4a4;
  }
  .card-content {
	font-size: 22px;
    width: 100px;
  }
  .product-img {
    border-radius: 20%;
    border: #ccc solid 1px;
  }
  
   .custom-footer{
  	margin-bottom: 180px;
  }
   body {
    zoom: 0.70;
  }
  .modal-backdrop {
  	background-color: transparent !important;
  }
  .modal-dialog {
   margin-top: 300px;
   margin-right: 1300px;
  }
  .wrap-vertical {
    overflow: hidden;
  }
</style>
<div class="container custom-top">
  <div class="jumbotron rounded-3" style="background-color: #B0E0E6;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">영양제 팩트체크</span>
    	<h4><strong style="color:#191970; font-size:35px;">키 크는 영양제, 우리 아이도 먹여야 할까?</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
     키는 유전적인 영향을 굉장히 많이 받지만 영양, 수면, 운동과 같은 다른 요인도 많은 영향을 줍니다. 그중 영양 측면을 생각해서 영양제를 찾으시는 경우가 많은 것 같아요.
  </div>
  <div class="mt-4">
    그런데 키 크는 영양제라고 해도 대부분 종합 영양제와 크게 다를 바가 없다고 생각하거나 효과가 있을지에 대한 고민이 되곤 하죠. 오늘은 <span class="highLight">어린이 키 성장 영양제에는 어떤 성분이 들어있고 정말 효과가 있는지</span> 집중적으로 알아볼게요!
  </div>
  <div class="mt-4">
    <img src="<c:url value="/images/magazine_images/08/img_blue3.png"/>" class="img-fluid">
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/notes.png"/>" class="img-fluid mr-4 mb-4" style="width:110px">
	<span style="font-size: xx-large; color: #FF7F50"><strong>MEDI-Q의 1분 요약</strong></span>
	 	<button type="button" class="btn custom-modal ml-2 mb-2" data-toggle="modal" data-target="#myModal">
   		 Click
  		</button>
	  <div class="modal" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title" style="font-size: xx-large; color: #FF7C4C">
	          MEDI-Q의 1분 요약
	          <img src="<c:url value="/images/magazine_images/basic/loupe.png"/>" class="img-fluid ml-2 mb-2" style="width:40px">
	          </h4>
	        </div>
	        <div class="modal-body">
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-1.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
	        키 성장을 위해서는 영양 관리가 중요하기 때문에 아미노산이나<br/> 
	         <span class="modalC">비타민, 미네랄 등이 골고루 들어간 영양제를 챙겨주세요.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			‘황기추출물 등 복합물(HT042)’이라는 성분은 <br/> 
			 <span class="modalC">어린이 키 성장에 도움이 된다고 인증을 받은 영양소예요!<br/></span>
			 <span class="modalC">이 성분이 들어간 제품은 키 성장에 도움이 될 수 있어요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	허위·과장 광고되는 키 성장 영양제도 많으니 인증받은 제품인지<br/> 
		   	  <span class="modalC">확인하고 선택하도록 해주세요.</span></p>
	        </div>	       
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 50px; font-size: 20px;">Close</button>
	        </div>
	 	 </div>
	   </div>
	  </div>
  </div>
    
  
  

  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">키 크는 영양제의 기본은 아미노산</span>
    </div>
    <div class="mt-4">
      일반적으로 키 성장에 도움이 된다고 하는 영양제는 성장기에 필요한 비타민, 미네랄, 아미노산 등의 성분이 골고루 함유된 영양제예요! 성장호르몬이 생성되기 위해서는 영양 상태가 중요하기 때문인데요.
    </div>
    <div class="mt-4">
       이 중에서도 <span class="highLight">아미노산</span>은 성장호르몬이 잘 분비되도록 도와주고 성장 단백질의 구성 성분이 되는 중요한 요인이에요! 
       키 성장을 위해서는 뼈 성장에 도움이 되는 비타민 D나 칼슘을 떠올리는 경우가 많지만, 이런 영양소에 집중하기보다는 아미노산을 챙기는 것이 좋습니다. 특히 아미노산 중에는 우리 몸에서 자연적으로 만들어지지 않아 <span class="highLight">반드시 음식을 통해서 섭취해야 하는 ‘필수 아미노산’도 있기 때문에</span> 이런 영양소를 섭취하는 것이 중요해요! 
       <span class="underLine">라이신, 트립토판, 아르기닌 등의 아미노산은 성장기 아이들에게 꼭 필요합니다.</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">키 성장을 인증받은 영양제</span>
    </div>
    <div class="mt-4">
      어린이 키 성장과 관련하여 식약처의 인증을 받은 유일한 성분이 있는데, 바로 <span class="highLight">‘황기추출물 등 복합물(HT042)’</span>이에요.
    </div>
    <div class="mt-4">
      황기추출물 등 복합물(HT042)은 황기, 가시오가피, 한속단 등의 성분으로 이루어진 기능성 원료인데 <span class="underLine">식약처에서 ‘어린이 키 성장에 도움을 줄 수 있음’이라는 기능성을 인정했어요.</span> 
      하지만 이 성분에 대한 연구는 소규모 연구이니, 영양제에만 의존하기보다 수면이나 운동과 같은 요인도 꼭 챙겨주세요!
    </div>
    <div class="mt-4">
     또한 <span class="highLight">성장판이 닫힌 경우</span>에는 <span class="underLine">뼈의 성장이 완전히 멈춘 것이기 때문에 영양제를 먹더라도 키 성장의 효과를 볼 수 없습니다.</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/basic/warning.png"/>" class="img-fluid mb-3 mr-2" style="width: 65px; height: 65px;">
      키 성장 영양제 허위 광고 주의</span>
    </div>
    <img src="<c:url value="/images/magazine_images/08/img_blue4.png"/>" class="img-fluid mt-4">
  </div>
  <div class="mt-5">
    <span class="underLine">건강기능식품 인증을 받지 않은 일반 ‘식품’인데 키 성장에 도움을 준다는 문구로 부당 광고</span>를 해서 적발되는 경우가 종종 있습니다.
  </div>
  <div class="mt-4">
    또한 건강기능식품으로 인증을 받아 <span class="underLine">인증 마크가 있지만 내용을 읽어보면 키 성장에 도움이 된다는 기능성이 없는 제품도 있어요.</span> 
    이런 제품은 키 성장 외의 다른 기능성으로 인증받은 것이기 때문에 키 성장 효과를 기대하기는 어려워요.
  </div>
  <div class="mt-4">
    식약처에서는 일반 식품을 키 성장 영양제로 오인할 수 있는 모호한 광고나 가짜 체험기로 광고하는 경우 등 문제가 되는 광고를 지속적으로 관리하고 있지만 여전히 일부 제품은 허위 광고를 하고 있기도 합니다. 
    그러니 <span class="highLight">키 크는 영양제를 고를 때는 건강기능식품 인증을 받은 제품인지, 키 성장에 도움이 된다는 기능성 인증을 받은 제품인지 꼭 확인해 보고 구입</span>하시길 바랄게요!
  </div>
</div>

<div class="container custom-footer">
  <span class="custom-text"><img src="<c:url value="/images/magazine_images/basic/happy.png"/>" class="img-fluid mb-2" style="width:65px">
  &nbsp;관련 영양제 인기 TOP 5 <i class="bi bi-chat-quote"></i></span>
  <div class="wrap-vertical">
    <c:if test="${empty listData}" var="listIsEmpty">
      등록된 제품이 없습니다
    </c:if>
    <c:if test="${not listIsEmpty}">
      <c:forEach var="record" begin="0" end="4" items="${listData}" >
        <div class="card" style="width:190px;height:400px;">
          <a href='/detail.do?no=${record.no}'>
  			<c:choose>
    		  <c:when test="${not empty record.imgURL}">
     			 <img src="${record.imgURL}" style="width:250px;height:190px;" class="img-fluid product-img">
   			  </c:when>
    		  <c:otherwise>
      			 <img src="<c:url value='/images/thumbnail_img/No_IMG.jpeg'/>" style="object-fit: fill; width:250px;height:190px;" class="img-fluid product-img">
    		  </c:otherwise>
  			</c:choose>
		  </a>
          <div class="card-footer" style="white-space:normal">
            <span class="card-title">${record.company}</span><br>
            <span class="card-content">
                ${record.productName}
            </span>
          </div>
        </div>
      </c:forEach>
    </c:if>
  </div>
</div>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
