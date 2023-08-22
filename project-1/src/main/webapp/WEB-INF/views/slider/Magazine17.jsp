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
    background: #F47A55;
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
	width: 810px;
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
    background-color : #BFF4FF;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #0060E5;
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
  <div class="jumbotron rounded-3" style="background-color: #AFDFE4;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #D93A49">떠먹여 주는 영양제 레시피</span>
    	<h4><strong style="color:#009AD6; font-size:35px;">약사가 추천하는 우울증 극복 영양제 레시피</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    우울증은 ‘마음의 감기’라고 불릴 정도로 현대인들에게 감기만큼 흔하게 발생하는 질환이죠. 
    하지만 감기처럼 가볍게 생각하고 넘기기에는, 우울증은 식욕이나 체중의 변화, 이유 없는 피로감 등과 같은 신체적 증상을 동반하는 경우가 많으며 심할 경우 사회생활이 힘들어지거나 자살과 같은 극단적인 결과를 가져올 수 있으니 꼭 관리해야 하는 질환이에요.
  </div>
   <div class="mt-4">
    <img src="<c:url value="/images/magazine_images/17/img_yellow7.png"/>" class="img-fluid" style="width: 600px;">
  </div>
   <div class="mt-5">
    우울증으로 힘들어하는 현대인들이 많아지고 있는 만큼 여러 영양소와 우울증 간의 관계에 대한 다양한 연구들이 진행되고 있습니다. 
    영양제가 치료제가 될 수는 없지만 힘을 낼 수만 있다면 무엇이든 해보고 싶을 분들을 위해, 오늘은 <span class="highLight">우울증에 도움이 되는 영양제 조합</span>을 준비했어요!
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/time.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #9ACD32"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         우울증을 극복하기 위한 영양제 3종 레시피 💛<br/>
	         <span class="modalC">: 오메가3 + 종합비타민 + 유산균<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 장 건강은 곧 뇌 건강! 건강한 식단으로 건강한 장을 만들어 주세요.<br/></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 해외 직구 우울증 영양제는 먹기 전에 꼭 전문가와 상담하고,<br/> 
		   	  <span class="modalC">처방받은 약은 임의로 조절하거나 중단하지 않도록 해주세요.</span></p>
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
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/one_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      오메가3</span>
    </div>
    <div class="mt-3">
      <span class="underLine">우울증의 영양 요법으로 가장 많이 이용되고 있는 영양제</span>는 <span class="highLight">오메가3</span>예요.
    </div>
    <div class="mt-3">
    	우울증을 겪는 사람들에게 오메가3가 눈에 띄게 결핍된 경우가 많고, 오메가3를 꾸준히 복용할 경우 우울할 가능성이 적다고 하는 연구 결과가 많아요. 오메가3는 혈액 순환을 도와주고 항염증 작용을 하는 영양소인데요. 
    	<span class="underLine">뇌 혈류의 순환을 돕고 뇌에서 우울증을 악화시키는 염증성 물질을 억제</span>하여 우울증에 도움을 준다고 알려져 있어요.
    </div>
    <div class="mt-3">
    	물론 오메가3만 단독으로 섭취한다고 해서 우울증을 치료할 수는 없지만 꾸준히 섭취하는 것이 우울증 외에도 많은 도움이 될 수 있는 영양제랍니다!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      종합 비타민 & 미네랄</span>
    </div>
    <div class="mt-3">
      오메가3와 마찬가지로 <span class="highLight">엽산이나 비타민 D와 같은 비타민이나 마그네슘 등의 미네랄</span>이 부족할 경우에 우울증의 위험이 커진다고 해요. 
      물론 그렇다고 해서 비타민이나 미네랄을 먹으면 우울증이 치료된다고 볼 수는 없지만, 건강한 뇌를 위해 꼭 필요한 영양소이니 꾸준히 챙겨 먹는 것이 좋습니다.
    </div>
    <div class="mt-3">
      겨울이 되고 해가 짧아지면서 우울증의 증상이 심해지는 경우도 있죠? <span class="highLight">햇빛을 받으면 행복 호르몬이라고 불리는 ‘세로토닌’</span>이 만들어지는데 해가 짧아지면 이런 행복 호르몬을 우리 몸에서 만들어 낼 시간이 줄어들기 때문이에요. 
      그런데 <span class="underLine">비타민 B12나 비타민 D 등이 세로토닌의 합성에 도움</span>을 주기 때문에 해를 많이 볼 수 없는 기간에는 특히 이런 비타민이 부족하지 않도록 해주세요!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/three_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
       유산균</span>
    </div>
    <div class="mt-3">
     ‘유산균’ 하면 ‘장 건강’ 아니냐고요? 맞아요! 그런데 <span class="highLight">장은 ‘제2의 뇌’</span>라고 불리기도 한다는 사실을 알고 계신가요?
    </div>
    <div class="mt-3">
     앞서 말씀드렸던 <span class="underLine">행복 호르몬은 90% 이상이 장에서 만들어져요.</span> 
     그래서 장이 건강해야 정신 건강이 좋아지고 행복해질 수 있답니다! 어떤 유산균 균주가 우울증 증상에 도움을 주는지에 대해서는 아직 연구가 더 필요하지만, 
     <span class="underLine">장 건강이 곧 정신 건강으로 이어진다는 점을 꼭 기억해 주세요!</span> 유산균의 섭취도 중요하지만, 건강한 식습관을 통해 장을 건강하게 만들어 주세요.
    </div>
  </div>
   <div class="paragraphT d-flex">
   	  <img src="<c:url value="/images/magazine_images/basic/analysis.png"/>" class="img-fluid mb-2 mr-4" style="width:70px; height: 70px;">
      <div>
      	<b style="font-size: 27px;">더 추가하고 싶다면?</b><br/>
      	 해외에서는 <span class="highLight">SAM-e(S-Adenosyl-L-Methionine)와 St. John’s wort(세인트존스워트, 성요한초)</span> 
      	 성분의 영양제가 우울증 개선에 많이 이용되고 있으나, 해당 성분의 경우 국내에서는 의약품 성분으로 분류가 되어 있어요. 
      	 <span class="underLine">두 영양제 모두 세로토닌에 영향을 주기 때문에 두 가지를 함께 복용하는 것은 피해야 합니다.</span> 
      	 세로토닌이 행복 호르몬이라고 해도 모든 것은 과유불급! 세로토닌이 우리 몸에 너무 많아지면 불안증과 같은 부작용이 생길 수 있어요. 
      	 또한 <span class="underLine">이런 영양제를 다른 항우울제와의 복용할 경우에도 주의가 필요해요.</span> 
      	 그러니 이 두 영양제는 직구로 구매해서 드시고 싶다면 먼저 전문가에게 상담받은 후에 결정하시길 바라요!
      </div>
  </div>
  	<div class="mt-4">
     <img src="<c:url value="/images/magazine_images/17/img_yellow8.png"/>" class="img-fluid ml-5" style="width: 600px;">
    </div>
    <div class="mt-4 ml-5" style="font-size: 23px;">
    	<span class="underLine">영양제는 치료 ‘약’이 아닙니다.</span> 만약에 병원에서 처방받은 우울증 약이 있다면 본인의 판단으로 중단하지 말고 꾸준히 드셔야 하고, 
    	임의로 용량을 조절해서도 안 돼요! 추가로 영양제를 드실 때는 주치의와 상의하여 영양제 섭취 여부를 결정할 수 있도록 해주세요.
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
