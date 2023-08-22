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
	width: 650px;
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
	    <span class="navbar-text" style="padding-left: 6px; color: #D93A49">떠먹여 주는 영양제 레시피</span>
    	<h4><strong style="color:#008000; font-size:35px;">뜬 눈으로 밤을 지새는 사람들을 위한 불면증 영양제 레시피</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    ‘잠이 보약’이라는 말이 있지만 잠을 자고 싶어도 자지 못해서 힘든 시간을 보내는 사람들이 많죠. 
    잠을 제대로 자지 못하면 만성 피로는 물론이고 면역력이 떨어지거나 집중력과 판단력이 흐려질 수 있으며 우울증과 같은 정서적인 부분에도 영향을 미칠 수 있어요.
  </div>
  <div class="mt-4">
     수면제에 대한 의존성이 생길까 봐 두렵거나, 수면제를 먹고 있더라도 추가적인 관리를 하고 싶은 분들을 위해 오늘은 <span class="highLight">꿀잠을 위한 영양제 조합</span>을 추천해 드릴게요!
  </div>
   <div class="mt-4">
    <img src="<c:url value="/images/magazine_images/16/img_yellow5.png"/>" class="img-fluid" style="width: 600px;">
  </div>
   <div class="mt-5">
    불면증의 원인은 다양하지만, 일반적으로 <span class="highLight">환경 변화와 스트레스로 인해 발생하는 경우가 많아요.</span> 
    환경 변화로 인한 불면증은 시간이 지나면서 괜찮아지는 경우가 많지만, 스트레스가 지속될 경우에는 불면증이 해결되기 쉽지 않답니다. 반복적인 스트레스를 받으면 교감신경을 흥분시켜 우리 몸이 들떠있는 상태로 만들고, 신경을 안정시켜주는 물질이 부족해져서 더욱 잠에 들기가 어려워져요. 
    따라서 <span class="underLine">현대인의 스트레스를 관리하는 것이 꿀잠을 향한 첫걸음이라고 보시면 돼요!</span>
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/time.png"/>" class="img-fluid mr-4" style="width:100px">
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
	         꿀잠을 위한 영양제 3종 레시피🌙<br/>
	         <span class="modalC">: 마그네슘 + 비타민 B군 + 오메가3<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 그 외에 수면에 필요한 물질이나 그 원료, 수면에<br/> 
			 <span class="modalC">도움이 된다고 인증받은 제품을 추가할 수 있어요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 하지만 건강한 수면을 위해서는<br/> 
		   	  <span class="modalC">반드시 생활 습관부터 관리해 주세요!</span></p>
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
      마그네슘</span>
    </div>
    <div class="mt-3">
      스트레스 조절이나 수면에 도움을 줄 수 있는 대표적인 영양소가 ‘<span class="highLight">천연의 진정제’라고 불리는 마그네슘</span>이에요. 
      마그네슘은 수면을 유도하는 중요한 호르몬인 <span class="underLine">멜라토닌의 합성에 꼭 필요한 미네랄</span>이면서, 신경을 안정시켜주는 GABA라는 신경전달물질의 생성을 도와 <span class="underLine">우리 몸을 안정시켜주는 역할</span>을 해요. 
      따라서 스트레스를 효과적으로 조절해주고 수면에도 도움이 될 수 있답니다. 안전하고 효과도 좋은 영양제인 만큼 <span class="underLine">가장 먼저 시도해 보면 좋은 영양제</span>예요!
    </div>
    <div class="mt-3">
    	마그네슘은 일반적으로 아침, 저녁으로 섭취하는데 만약 하루 한 번만 섭취한다면 <span class="highLight">꼭 저녁에 드시도록 해주세요.</span>
    </div>
    <div class="mt-3">
    	마그네슘과 마찬가지로 <span class="underLine">칼슘 또한 멜라토닌 합성에 영향을 주고, 칼슘과 마그네슘은 우리 몸에서 일정한 비율을 유지하는 것이 좋기 때문에 한 가지만 먹기보다는 함께 먹는 게 좋아요.</span>
    	하지만 두 영양소 모두 너무 많이 먹으면 오히려 독이 될 수 있는 영양소이기 때문에 에이미랩스의 분석을 통해서 올바른 양을 확인하고 드시길 바라요!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      비타민 B군</span>
    </div>
    <div class="mt-3">
      잠이 오게 하는 호르몬인 멜라토닌을 우리 몸에서 만들기 위해서 여러 물질이 필요한데, 대표적인 영양소가 <span class="highLight">비타민 B군</span>이에요. 
      그중 비타민 B3, B6, B9 세 가지가 꼭 필요한데, <span class="underLine">이 세 가지에 집중하기보다는 비타민 B군이 골고루 들어간 영양제를 선택</span>하는 것으로 충분해요. 
      불면증이 지속될 경우 가장 먼저 나타나는 증상이 피로인데, 비타민 B군은 피로 개선에도 도움이 되니 불면증이 있을 때 기본적으로 챙겨주시면 좋답니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/three_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
       오메가3</span>
    </div>
    <div class="mt-3">
    일반적으로 오메가3는 혈액 순환을 도와주고 우리 몸의 관상동맥 질환의 위험성을 낮춰주는 역할로 많이 알려져 있는데요. 
    오메가3는 우리 뇌를 건강하게 만들어서 우울증과 같은 정신 질환의 위험을 낮추고 수면의 질을 개선하는 데에도 도움을 줄 수 있어요. 
    <span class="underLine">워낙 다양한 역할을 하는 만큼 수면이나 스트레스가 아니더라도 꾸준히 섭취하면 좋은 영양제</span>랍니다.
    </div>
  </div>
   <div class="paragraphT d-flex">
   	  <img src="<c:url value="/images/magazine_images/basic/analysis.png"/>" class="img-fluid mb-2 mr-4" style="width:70px; height: 70px;">
      <div>
      	<b style="font-size: 27px;">더 추가하고 싶다면?</b><br/>
      	 앞서 언급했던 <span class="highLight">멜라토닌이나 GABA를 직접 먹거나, 멜라토닌 합성의 원료인 트립토판, 5-HTP 등을 영양제로 먹기도 해요.</span> 
      	 하지만 멜라토닌이나 GABA는 부작용이 발생하기 쉽고 사람에 따라 효과 차이도 많답니다. 또한 국내 건강기능식품의 원료로 인증받지 않은 성분이기 때문에 이런 점을 명확히 인지하고 드시는 것이 좋아요.    
      </div>
  </div>
  	<div class="mt-4" style="font-size: 23px;">
     <strong style="font-size: 25px;">수면에 도움이 되는 것을 인증받은 대표적인 영양소</strong>로는 <span class="underLine">‘미강주정추출물’, ‘감태추출물’, ‘유단백가수분해물(락티움)’</span>이 있어요. 
     이러한 영양소가 들어간 영양제를 꾸준히 복용하면 수면의 질을 높이는 데 도움을 받을 수 있습니다. 또한 <span class="underLine">‘테아닌’</span>은 스트레스로 인한 긴장을 느슨하게 해서 수면 건강에 도움을 줄 수 있어요. 테아닌은 졸음이 올 때 우리의 뇌에서 증가하는 알파파를 늘려주는 역할을 해요. 
     테아닌의 경우 먹자마자 잠이 오지는 않기 때문에 수면에 도움을 받고 싶어서 테아닌을 먹는 경우라면 잠들기 30분~1시간 전에 먹는 것을 추천합니다.
    </div>
    <div class="mt-4" style="font-size: 23px;">
    	하지만 불면증을 해결하기 위해 가장 중요한 건 수면제도 영양제도 아니에요. 
    	카페인 섭취나 불규칙한 수면 생활 패턴, 과도한 전자 기기 사용, 운동 부족 등의 생활 습관을 개선하는 것이 가장 중요하니 영양제를 꾸준히 드시면서 <span class="highLight">수면을 위한 생활 습관도 꼭 관리해주세요!</span>
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
