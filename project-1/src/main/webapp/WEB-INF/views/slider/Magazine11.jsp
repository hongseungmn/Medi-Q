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
  	margin-top: 75px;
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
    background: #9CCC65;
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
	width: 800px;
  	height: 520px;
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
    background-color : #E0F7FA;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #0097A7;
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
  <div class="jumbotron rounded-3" style="background-color: #DCE775;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">Health & Life</span>
    	<h4><strong style="color:#008200; font-size:35px;">변비, 유산균 말고 다른 방법은 없을까?</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    변비는 전 인구의 5~20%가 증상을 호소할 만큼 매우 흔한 증상이죠. 남자보다 여자에게서 흔히 발생하고 나이가 들수록 빈도가 증가합니다.
  </div>
  <div class="mt-4">
    그런데 의외로 변을 보지 못하는 것만이 변비라고 알고 계시는 분들이 많은 것 같아요. <span class="underLine">매일 변을 보지 못하더라도 불편함이 없다면 변비에 해당하지 않고, 매일 변을 보더라도 변비인 경우도 있습니다.</span> 
    따라서 우선 본인의 증상을 명확하게 파악하고 필요할 경우 적절한 대응을 하는 것이 중요해요.
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/HealthLife.png"/>" class="img-fluid mr-2 mb-3" style="width:110px">
	<span style="font-size: xx-large; color: #FF5722"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         변비의 기준은 변을 보지 못하는 것이 아니에요.<br/> 
	         <span class="modalC">정확한 기준에 따라 본인의 증상을 체크해 보세요.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 충분한 식사와 수분 섭취, 올바른 배변 습관 만들기, 운동하기 등의<br/> 
			 <span class="modalC">생활습관 개선으로 변비를 관리해 보세요!<br/></span></p>
	        </div>	       
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 50px; font-size: 20px;">Close</button>
	        </div>
	 	 </div>
	   </div>
	  </div>
  </div>
    
  
  <div class="paragraph-title">
    <div class="mt-5">
      <span class="para_title">
      <img src="<c:url value="/images/magazine_images/basic/check.png"/>" class="img-fluid mb-4" style="width:60px">
      변비 자가 진단 체크리스트</span>
    </div>  
    <div class="mt-3">
	아래 증상 중 해당 사항이 두 개 이상이고 3개월 이상 지속될 경우 변비라고 볼 수 있어요.
  	</div>
     	<div class="ml-3 mt-4 mb-2">
	     	<p>
	          <img src="<c:url value="/images/magazine_images/number/one_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          배변 횟수가 1주일에 3회 미만
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/two_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          4회 배변 중 1회 이상 잔변감이 있을 때
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/three_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          4회 배변 중 1회 이상 과도하게 힘을 줘야 할 때
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/four_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          4회 배변 중 1회 이상 딱딱한 변을 볼 때
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/five_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          4회 배변 중 1회 이상 항문이 막힌 느낌이 들 때
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/six_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          4회 배변 중 1회 이상 배변 유도를 위한 부가적 처치가 필요할 때
	        </p>
     	</div>
     	<div class="mt-4">
      		변비를 해결하기 위해 장 건강에 좋은 유산균을 먹거나, 심한 경우에 변비약을 복용하는 분들도 있는데요. 변비는 생활습관 개선을 함께하는 것이 중요합니다. 
      		<span class="highLight">변비 해결을 위해 꼭 지켜야 할 습관</span>을 함께 살펴볼까요?
    	</div>
    </div>

  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/one_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
      식이섬유가 풍부한 식사하기</span>
    </div>
    <div class="mt-4">
      <img src="<c:url value="/images/magazine_images/11/img_green3.png"/>" class="img-fluid" style="height: 300px;">
    </div>
    <div class="mt-5">
      <span class="underLine">식사량이 충분해야 대변의 양도 많아져서 배변하기가 쉬워져요.</span> 다이어트를 해서 먹는 양이 줄면 변비가 잘 생기는 이유에요.
    </div>
    <div class="mt-4">
      특히 식이섬유가 풍부한 음식을 먹으면 대변의 양과 무게가 늘고, 장의 운동도 활발해져요. 
      정제되지 않은 곡류, 과일류, 야채, 버섯, 미역, 다시마와 같이 <span class="highLight">식이섬유가 풍부한 음식을 골고루 섭취</span>하도록 해주세요.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
      충분한 수분 섭취하기</span>
    </div>
    <div class="mt-4">
      <img src="<c:url value="/images/magazine_images/11/img_green4.png"/>" class="img-fluid" style="height: 300px;">
    </div>
    <div class="mt-5">
      식이섬유는 물을 흡수하여 변을 부드럽게 만들어줍니다. 그런데 <span class="underLine">충분한 물을 먹지 않고 식이섬유만 갑자기 먹으면 오히려 배에 가스가 차고 변비가 악화</span>될 수 있어요. 
      <span class="highLight">하루 2L 이상의 충분한 물을 먹어주는 것</span>이 베스트!
    </div>
    <div class="mt-4">
      특히 <span class="underLine">기상 직후에 먹는 물 한 컵</span>은, 밤새 비었던 위가 부풀면서 위에 음식이 들어오는 것과 같은 효과를 주어 장의 운동을 활발하게 만들어준답니다.
    </div>
  </div>
  <div class="paragraph">
      <div class="mt-5">
         <span class="para_title"><img src="<c:url value="/images/magazine_images/number/three_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
         올바른 배변 습관 만들기</span>
      </div>
      <div class="mt-4">
    	 <img src="<c:url value="/images/magazine_images/11/img_green5.png"/>" class="img-fluid" style="height: 300px;">
      </div>
	  <div class="mt-5">
	    <span class="highLight">매일 아침 화장실에 가는 습관을 들이는 것</span>이 중요해요. 
	    특히 아침 식사는 가장 배변을 유도하기 좋기 때문에 <span class="underLine">아침 식사를 하고 30분 내에 화장실에 가는 습관</span>을 들이는 것이 좋아요. 
	    느낌이 없더라도 화장실에 가서 앉는 일정한 패턴을 만드는 것이 중요합니다.
	  </div>
	  <div class="mt-4">
	    단 <span class="highLight">배변 시간은 5분을 넘지 않는 것이 좋아요.</span> 
	    또한 변의(대변이 마려운 느낌)가 있을 때 참게 되면 나중에 변이 마려운 것을 몸에서 느끼지 못하게 되어 변비가 되기 쉬우니, <span class="highLight">변의가 있을 때는 참지 말고 화장실에 가도록 해주세요.</span>
	  </div>
  </div>
  <div class="paragraph">
      <div class="mt-5">
         <span class="para_title"><img src="<c:url value="/images/magazine_images/number/four_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
         운동하기</span>
      </div>
      <div class="mt-4">
    	 <img src="<c:url value="/images/magazine_images/11/img_green6.png"/>" class="img-fluid" style="height: 300px;">
      </div>
	  <div class="mt-5">
	    <span class="underLine">활동량이 적으면 장도 잘 움직이지 않아서 변비가 심해질 수 있어요.</span> 특히 복근의 힘이 약하면 변을 배출하는 힘이 약해져 변비의 원인이 될 수 있습니다. 
	    장이 열심히 움직일 수 있도록 평소에 걷기, 달리기, 수영과 같은 <span class="highLight">전신 유산소 운동이나 복근 운동을 꾸준히 해주세요.</span>
	  </div>
	  <div class="mt-4">
	    또한 아침 배변 습관을 위해서는 <span class="underLine">자기 전에 가벼운 복부 마사지</span>를 하는 것도 도움이 됩니다.
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
