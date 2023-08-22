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
  	margin-top: 100px;
  	font-size: 23px;
  }
  .paragraph-title{
  	margin-top: 80px;
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
    background: #64B5F6;
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
	width: 640px;
  	height: 600px;
  }
  .modalB{
    margin-top : 15px;
  	margin-bottom: 20px;
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
    background-color : #FFE4E1;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #AB47BC;
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
  <div class="jumbotron rounded-3" style="background-color: #FFCCBC;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #E91E63">Health & Life</span>
    	<h4><strong style="color:#FF5722; font-size:35px;">건강을 위한 올바른 수분 섭취법</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    물은 우리 몸의 60~70%를 차지하고 있고 몸의 다양한 기능을 하기 위한 핵심적인 역할을 합니다. 
    건강한 삶을 위해 물은 필수적인 요소인데 물의 적정 섭취량을 채우기도 어렵고 물에 관해서 잘못된 인식을 가진 경우도 많은 것 같아요. 
    <span class="highLight">건강한 일상을 지키는 올바르고 현명한 물 섭취 방법 4가지</span>를 알아볼게요.
  </div>
  <div class="mt-5">
    <img src="<c:url value="/images/magazine_images/12/img_green7.png"/>" class="img-fluid" style="width: 600px;">
  </div>
  
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/HealthLife.png"/>" class="img-fluid mr-2 mb-3" style="width:110px">
	<span style="font-size: xx-large; color: #7CB342"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         너무 과한 물은 오히려 독! 적절한 수분 섭취하기<br/></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 한 번에 많이 마시지 않고 나눠 마시기<br/></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 커피나 음료수 대신 순수한 물 마시기<br/></p>
		   	<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-4.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 잠에서 깬 후와 식사 전 물 한 잔,<br/> 
		   	  <span class="modalC">운동 전후와 중간에도 잊지 말고 물 마시기</span></p>
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
      <span class="para_title"><img src="<c:url value="/images/magazine_images/12/water.png"/>" class="img-fluid mb-4" style="width:65px">
      적절한 물 섭취량 지키기</span>
    </div>
    <div class="mt-2">
      일반적으로 물은 하루 2L 섭취해야 좋다는 속설이 많죠. <span class="underLine">세계보건기구(WHO)에서 권장하는 하루 물 섭취량은 2L</span>가 맞지만 조금 더 다양한 기준을 살펴보는 것이 좋아요.
    </div>
    <div class="mt-4">
      가장 기본적으로 배출량만큼 섭취하면 되는데, <span class="underLine">성인은 일반적으로 하루에 2.5~3L 정도의 수분을 배출</span>합니다. 
      보건복지부의 ‘2020 영양소 섭취 기준’에 따르면 일반적인 성인 기준 하루 1,900~2,600mL 정도의 수분을 섭취할 것을 권장하고 있어요. 그런데 이만큼을 모두 물로 마셔야 하는 것은 아니에요. 
      채소나 과일 등의 음식물을 통해서 1~1.5L의 수분을 섭취하기 때문에 <span class="highLight">평균적으로 하루에 1.5L 정도의 물을 먹는 것을 권장</span>합니다. 
      다만 날씨가 덥거나 운동을 해서 땀을 많이 흘렸을 때는 더 많은 물을 마시도록 해주세요.
    </div>
    <div class="mt-4">
      <span class="underLine">물을 과하게 마시면 오히려 나트륨 농도가 급격하게 떨어져서 두통, 구역질, 근육 약화 같은 증상</span>이 나타날 수 있고 심할 경우에는 뇌 장애를 일으킬 수도 있어요. 
      또한 간경화나 신부전증과 같은 몇몇 질환이 있는 경우에는 과도한 수분 섭취가 오히려 다른 합병증을 일으킬 수 있기 때문에 질병이 있는 경우에는 의료진과 상담 후 적절한 물 섭취량을 정하는 것이 좋습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/12/water.png"/>" class="img-fluid mb-4" style="width:65px">
      한 번에 마시지 않고 나눠서 마시기</span>
    </div>
    <div class="mt-2">
      물은 몸속에 들어온 뒤 2시간 정도 지난 후에 소변으로 배출이 됩니다. 
      그런데 신장은 시간마다 배설할 수 있는 양이 정해져 있어서 한 번에 너무 많은 양의 물을 마시면 신장에 무리가 갈 수 있습니다. 이럴 때도 마찬가지로 저나트륨혈증이 발생할 수 있어요.
    </div>
    <div class="mt-4">
      따라서 <span class="highLight">한 번 마실 때 200mL 정도의 양</span>을 마시고, 하루 섭취량을 하루 동안 나눠서 꾸준히 마시는 것이 좋습니다. 
      <span class="underLine">갈증이 나더라도 한 번에 마시는 물의 양은 500mL가 넘지 않도록 해주세요.</span>
    </div>
    <div class="mt-4">
      그런데 나이가 들면 중추신경의 기능이 저하되어 갈증을 느끼기가 어려워집니다. 노년층의 경우 신장의 수분 재흡수율도 떨어지기 때문에 노년층의 경우 목이 마르지 않더라도 매시간 물을 마시도록 해주세요.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/12/water.png"/>" class="img-fluid mb-4" style="width:65px">
      수분 섭취는 꼭 ‘물’로 하기</span>
    </div>
	<div class="mt-2">
	    이제는 커피가 물을 대체할 수 없다는 사실을 많이 알고 있지만 여전히 일부는 커피로 수분 섭취를 대신하는 경우가 있는데요.
	</div>
	<div class="mt-4">
	    <span class="underLine">카페인이 있는 커피나 차, 탄산음료</span>의 경우 이뇨 작용을 일으키기 때문에 
	    당장의 갈증은 해결하더라도 수분 배출량이 증가하여 <span class="underLine">오히려 체내에 탈수 증상을 유발할 수 있습니다.</span> 
	    <span class="highLight">카페인이 있는 차나 커피를 마신 경우에는 마신 양의 1.5~2배 정도의 물을 더 마셔야 해요!</span>
	</div>
	<div class="mt-4">
	     이온 음료나 탄산수의 경우도 물을 대신할 수는 없습니다. 이온 음료는 많은 양의 당과 나트륨이 들어있고, 탄산수의 경우 약산성이기 때문에 많이 마실 경우 치아를 상하게 하고 가스로 인해 배가 빵빵한 느낌이 들 수 있어요. 
	     <span class="underLine">다만 높은 강도의 운동을 오래 했을 경우 당이 많이 소비되기 때문에 약간의 이온 음료를 먹으면 장시간의 고강도 운동에 도움이 됩니다.</span>
	</div>
	<div class="mt-4">
	    맹물을 마시는 것이 너무 힘들 경우 카페인이 없는 차인 보리차, 우엉차, 구기자차 등을 드실 수 있습니다.
	</div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/12/water.png"/>" class="img-fluid mb-4" style="width:65px">
      꼭 물을 마셔야 하는 시간 지키기</span>
    </div>
	<div class="mt-2">
		<img src="<c:url value="/images/magazine_images/number/one_W.png"/>" class="img-fluid mb-2 mr-2" style="width:45px">
	    <span class="underLine" style="font-size: 24px;">아침에 눈 뜨자마자</span>
	</div>
	<div class="mt-3">
	   물은 마시는 시점에 따라 다양한 효과를 기대할 수 있는데 특히 <span class="highLight">아침에 일어나면 1~2컵의 물</span>을 마시는 것이 좋습니다. 
	   잠을 자는 동안 물을 마시지 않기 때문에 우리 몸은 수분 부족 상태로 깨어납니다. 
	   잠에서 깨자마자 물을 마시면 밤사이 부족했던 수분을 즉각적으로 채워 기준선으로 돌아올 수 있어요.
	</div>
	<div class="mt-3">
	     반대로 <span class="highLight">잠들기 전에 너무 많은 물</span>을 마실 경우 화장실에 가고 싶은 느낌 때문에 
	     <span class="highLight">수면에 방해</span>가 될 수 있으니 잠자기 1시간 전에는 적당한 양의 물을 마시는 것이 좋습니다.
	</div>
	<div class="mt-5">
	    <img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:45px">
	    <span class="underLine" style="font-size: 24px;">식사 30분 전</span>
	</div>
	<div class="mt-3">
	    <span class="highLight">식사 전에 물을 마시면 포만감을 주어 식욕이 줄고 자연스럽게 과식을 예방</span>할 수 있어요. 맵고 짠 음식을 먹었을 때 물을 마시는 것은 염분 조절에 도움을 줍니다.
	</div>
	<div class="mt-3">
	     하지만 <span class="highLight">식사 도중 물</span>을 너무 많이 마시면 소화효소의 활성화가 제대로 되지 않아 <span class="highLight">소화불량이 발생할 수 있어요.</span> 
	     특히 나이가 들면 위액의 양이 줄어 소화 기능이 떨어지는데, 이때 식사 전후로 물을 많이 마시게 되면 위액이 묽어져 소화에 방해가 될 수 있으니 너무 많은 물을 마시지 않도록 해주세요.
	</div>
	<div class="mt-5">
	    <img src="<c:url value="/images/magazine_images/number/three_W.png"/>" class="img-fluid mb-2 mr-2" style="width:45px">
	    <span class="underLine" style="font-size: 24px;">운동 전후와 운동 중</span>
	</div>
	<div class="mt-3">
	    <span class="highLight">운동을 하기 2시간 전부터 수분을 조금씩 섭취</span>하는 것이 운동 중 수분 부족을 막을 수 있어요. 
	    또한 <span class="highLight">운동 중</span>에는 땀으로 인해 수분이 많이 배출되기 때문에 <span class="highLight">15~20분마다 규칙적으로 반 컵 정도의 물</span>을 마시는 것이 좋습니다.
	</div>
	<div class="mt-3">
	     일반적으로 물은 미지근하게 마시는 것이 좋다고 알려졌지만, 운동 직후에 몸이 뜨거워진 상태에서 찬물을 마시면 몸을 식히는 데 도움이 될 수 있습니다.
	</div>
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
