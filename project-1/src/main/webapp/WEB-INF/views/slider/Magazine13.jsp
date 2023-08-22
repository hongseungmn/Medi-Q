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
  	margin-top: 110px;
  	font-size: 23px;
  }
  .paragraphT{
  	margin-top: 80px;
  	font-size: 24px;
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
    background: #9ACD32;
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
	width: 795px;
  	height: 610px;
  }
  .modalB{
    margin-top : 20px;
  	margin-bottom: 30px;
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
    background-color : #D2F19E;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #F26522;
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
  <div class="jumbotron rounded-3" style="background-color: #D1E897;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #D93A49">Health & Life</span>
    	<h4><strong style="color:#008000; font-size:35px;">수면제 없이 불면증 극복하는 법</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    불면증은 전체 인구 10명 중 3명이 경험하는 흔한 증상이라 ‘마음의 감기’라고도 불리죠. 주로 스트레스, 
    불안과 같은 정서적 요인과 외부적 요인에 의해 발생하며, 낮 동안의 집중력 저하, 극심한 피로감, 감정 변화 등의 증상이 나타나 일상생활에도 영향을 미치게 됩니다.
  </div>
  <div class="mt-4">
    <span class="underLine">일시적으로 하루 이틀 잠을 자지 못한다고 해서 불면증이라 하지 않고,</span> 
    오랜 기간 밤잠을 설치고 일상에 지장을 받게 될 때 불면증을 의심해 볼 수 있는데요. 
    그렇다면 <span class="highLight">불면증을 스스로 확인해 볼 수 있는 방법</span>은 무엇이 있을까요? 
    대한수면연구학회에서 제공하는 다음과 같은 <span class="underLine">불면증 자가진단 체크리스트</span>를 통해 의료기관 방문 전 먼저 확인해 볼 수 있어요.
  </div>
   <div class="mt-5 d-flex">
    <img src="<c:url value="/images/magazine_images/13/Diagnosis1.png"/>" class="img-fluid mr-1" style="width: 550px;">
    <img src="<c:url value="/images/magazine_images/13/Diagnosis2.png"/>" class="img-fluid" style="width: 550px;">
  </div>
   <div class="mt-5">
    불면이 지속되면 일상의 불편함을 넘어 건강에도 좋지 않은 영향을 주기 때문에 적절한 조치가 필요한데요. 
    잠을 잘 자기 위해 영양제를 먹거나 수면제를 처방받을 수도 있지만, 건강한 수면을 위해서는 <span class="highLight">수면과 관련된 규칙적인 습관을 정하고 지키는 게 무엇보다 중요</span>해요.
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/HealthLife.png"/>" class="img-fluid mr-2 mb-3" style="width:110px">
	<span style="font-size: xx-large; color: #000080"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         낮 시간엔 긴 낮잠 대신 밖에 나가서 햇빛을 쬐며 운동을 해보세요.<br/></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 잠자기 전 야식과 전자기기는 멀리하고 몸과 마음을<br/> 
			 <span class="modalC">안정킬 수 있도록 해주세요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 건강한 수면을 위해서는 무엇보다 올바른 수면 습관을 가지는 것이<br/> 
		   	  <span class="modalC">중요하니, 어렵더라도 하나씩 습관을 바꿔나가 보아요!</span></p>
	        </div>	       
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 50px; font-size: 20px;">Close</button>
	        </div>
	 	 </div>
	   </div>
	  </div>
  </div>
    
  
  

  <div class="paragraph">
   	<div style="font-size: 27px;">
      그럼, 일상 속에서 쉽게 도전해 볼 만한 <span class="highLight">‘숙면을 위한 성형 습관 TIP’</span> 5가지를 소개해 드릴게요!
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/13/img_green9.png"/>" class="img-fluid" style="width: 600px;">
    </div>
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/one_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      낮잠은 과유불급</span>
    </div>
    <div class="mt-3">
      <span class="underLine">낮잠을 너무 길게 자게 되면 숙면을 취하는데 방해</span>가 될 수 있어요. 밤에 충분한 잠을 자지 못했다면 다음 날 낮잠의 유혹에 빠지기 쉬운데, 
      밤에 적게 자고 낮에 많이 자는 습관이 반복되면 결국 수면 장애로 이어질 수 있습니다.
      <span class="highLight">피로를 해소하기에 가장 적당한 낮잠 시간은 10~20</span>분으로, 너무 긴 낮잠은 피해 주세요.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      야식은 멀리하기</span>
    </div>
    <div class="mt-3">
      일과를 마친 후 야식을 먹고 잠자리에 드는 분들이 있죠. 우리 위장은 음식물의 소화를 위해 많은 에너지를 쓰기 때문에, 
      <span class="underLine">잠들기 전에 음식을 먹게 되면 장의 운동하기 위해 우리의 자율신경이 깨어나 수면에 나쁜 영향을 줄 수 있어요.</span> 
      이런 경우에는 잠에 든다고 하더라도 숙면을 취하기가 어려워집니다. 하지만 <span class="underLine">너무 배고픈 상태도 수면을 방해</span>할 수 있으니 
      <span class="highLight">잠자기 2시간 전에 음식 섭취를 끝낼 수 있도록 해주세요.</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/three_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      밖에 나가서 햇볕 쬐기</span>
    </div>
    <div class="mt-3">
    낮 동안에는 뇌의 각성을 위해 잠시 햇볕을 쬐는 것이 도움이 됩니다. <span class="underLine">적절한 빛을 쬐지 못하면 뇌가 깨어나지 않아서 졸음과 피로가 몰려오게 돼요.</span> 
    햇빛은 우리 몸의 생리작용을 조절하는 생체시계에 영향을 주고, <span class="highLight">수면을 돕는 호르몬인 멜라토닌 분비에도 도움</span>을 주기 때문에 숙면을 위해서도 충분한 햇빛을 보는 것이 중요합니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/four_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      스마트폰과 잠시 이별하기</span>
    </div>
    <div class="mt-3">
    스마트폰, 텔레비전, 컴퓨터와 같은 <span class="underLine">전자기기의 인위적인 빛은 멜라토닌 분비를 억제하여 수면을 방해합니다.</span> 
    잠을 자기 전에는 이러한 전자기기들을 잠시 멀리하고, 뇌를 편안하게 쉴 수 있는 상태로 만들어줘야 해요. <span class="highLight">스마트폰 대신에 명상을 하거나 책을 읽는 것을 추천합니다.</span>
    </div>
  </div>
    <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/five_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      낮 시간의 꾸준한 운동</span>
    </div>
    <div class="mt-3">
    <span class="highLight">규칙적인 운동은 건강한 수면 습관에 도움이 됩니다.</span> 하지만 <span class="underLine">격렬한 운동을 하게 되면 교감신경이 활성화되어서 우리 몸이 깨어나게 돼요.</span> 
    한 번 활성화된 교감신경은 길게는 4시간까지도 영향을 주기 때문에, <span class="highLight">늦은 시간에 운동하는 것은 피하는 것이 좋습니다.</span> 
    어쩔 수 없이 밤에 운동을 해야 한다면 심박수를 높이지 않는 저강도 운동을 하는 것을 추천해요.
    </div>
    <div class="mt-4">
     또한 <span class="underLine">운동의 효율을 높이기 위해 먹는 부스터나 카페인이 포함된 보충제</span>도 수면을 방해하는 요인이 될 수 있으니, 저녁 시간에 운동할 경우 이런 제품의 섭취는 피하는 것이 좋습니다.
    </div>
   </div>
   <div class="paragraphT d-flex">
   	  <img src="<c:url value="/images/magazine_images/basic/analysis.png"/>" class="img-fluid mb-2 mr-4" style="width:70px; height: 70px;">
      <div>
      이 밖에도 카페인은 오전 중에만 섭취하고, 니코틴 또한 뇌를 각성시키는 것은 물론 새벽에 호흡기 자극을 주기 때문에 취침 전 흡연은 피하는 것이 좋아요. 
      또한 주말에 잠을 몰아서 자는 것은 수면 패턴을 망가뜨릴 수 있으니 항상 일정한 수면 패턴을 유지하는 것이 좋습니다.
      </div>
  </div>
  	  <div class="mt-3" style="font-size: 23px;">
      물론 처음에는 쉽지 않겠지만 오늘 말씀드린 습관을 <strong>하나씩 실천해 나가다 보면 불면증도 조금씩 나아질 거예요!</strong>
      <img src="<c:url value="/images/magazine_images/13/sleep.png"/>" class="img-fluid mb-2 mr-2" style="width:45px">
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
