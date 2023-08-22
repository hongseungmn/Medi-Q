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
  .paragraph-title{
  	margin-top: 90px;
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
    background: #76BECC;
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
	width: 780px;
  	height: 680px;
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
    background-color : #EBEBFA;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #006AFF;
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
  <div class="jumbotron rounded-3" style="background-color: #EDCAED;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #11264F">영린이 탈출, 영양제 상식</span>
    	<h4><strong style="color:#800080; font-size:35px;">변비 해결을 위한, 똑똑하게 유산균 먹는 법</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    <span class="underLine">장은 음식물을 흡수하고 배설하는 기능 외에도 면역 세포의 70% 이상이 분포되어 있어 우리 몸의 면역 기능에 중요한 역할</span>을 해요. 
    따라서 유산균을 섭취하여 장 내 환경을 관리하면 장이 제대로 기능을 할 수 있게 되고 면역력에도 도움을 줄 수 있습니다.
  </div>
  <div class="mt-4">
    그런데 아무리 몸에 좋은 유익균이더라도 잘못된 방법으로 섭취하게 될 경우 제대로된 효과를 볼 수 없어요. 
    유산균을 먹지만 변비도 해결이 안 되고 특별한 효과가 없었던 분들이라면 이번 시간에 <span class="highLight">유산균의 효과를 제대로 보기 위한 똑똑한 섭취법</span>을 함께 알아보도록 해요.
  </div>
  
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/contract.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #F15A22"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         공복에 먹는 것과 식후에 먹는 것은 각각의 장점이 있기 때문에<br/> 
	         <span class="modalC">매일 꾸준히 복용하는 것이 더 중요해요.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 충분한 식이섬유를 식사로 챙겨 먹거나 프리바이오틱스를<br/> 
			 <span class="modalC">함께 섭취해 주세요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 무조건 많은 수보다는 나에게 맞는 균 수 찾기, 항생제와 동시에<br/> 
		   	  <span class="modalC">복용하지 않기까지 챙기면 500% 효과 보장 유산균 섭취 완료!</span></p>
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
      <span class="para_title">유산균은 아침 공복에<img src="<c:url value="/images/magazine_images/basic/question2.png"/>" class="img-fluid mb-3" style="width:55px"> </span>
    </div>
    <div class="mt-3">
      <img src="<c:url value="/images/magazine_images/14/img_sky2.png"/>" class="img-fluid">
    </div>
    <div class="mt-4">
      흔히 <span class="underLine">유산균은 위산의 영향이 가장 적은 아침 공복에 먹어야한다</span>고 알고 계시는 분들이 많으시죠.
    </div>
    <div class="mt-3">
      유산균은 위산에 의해 분해되기 때문에 장까지 도달해야할 유산균이 음식을 먹은 후에 분비되는 위산으로 인해서 소화되어 버린다는 이유인데요. 
      하지만 기상 직후에는 위산 수치가 오히려 더 높을 수 있어요. 따라서 아침 공복에 드시더라도 기상 직후가 아닌 샤워와 같은 일정 활동 이후에, 위산이 중화될 수 있도록 많은 양의 물과 함께 먹는 것이 좋습니다.
    </div>
    <div class="mt-4">
      <span class="underLine">식후에 유산균을 먹으면 유산균의 먹이가 많아져서 균의 활동력이 좋아진다</span>는 연구 결과도 있어요.
    </div>
    <div class="mt-4">
      다만 식후 시간이 경과하면서 음식물 소화에 필요한 위산이 분비되기 때문에 식사 중간이나 식후에 바로 복용하는 것이 좋아요. 음식의 경우 과일, 채소, 잡곡류는 유산균의 증식을 도와주는 반면, 인스턴트 식품, 기름진 음식, 카페인, 탄산 음료는 유산균이 장에 정착하는 것을 방해합니다. 
      또 많은 양의 염분은 유산균의 수를 줄일 수 있기 때문에 염분이 적은 식사를 하는 것이 좋아요.
    </div>
    <div class="mt-4">
      결론적으로 <span class="highLight">식전이나 식후를 따지기 보다는 올바른 식습관과 함께 유산균을 한 달 이상 꾸준히 복용</span>하는 것이 가장 중요해요!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">유산균의 먹이, 프리바이오틱스</span>
    </div>
    <div class="mt-4">
      <img src="<c:url value="/images/magazine_images/14/img_sky3.png"/>" class="img-fluid" style="width: 600px;">
    </div>
    <div class="mt-4">
      위에서 유산균의 먹이에 대해 얘기했는데, 유산균이 우리 몸에서 활발하게 활동하려면 유산균에게도 먹이가 필요해요. 대표적인 유산균의 먹이로는 올리고당과 섬유질이 있어요.
    </div>
    <div class="mt-4">
      유산균 제품에서 흔히 볼 수 있는 <span class="underLine">‘프리바이오틱스(prebiotics)’가 바로 유산균의 먹이이고, 프리바이오틱스와 프로바이오틱스가 함께 들어있는 제품을 ‘신바이오틱스’</span>라고 해요.
    </div>
    <div class="mt-4">
      섬유질이 풍부한 식사를 하는 것도 좋지만 음식으로 충분한 섬유질을 먹지 못할 경우에는 신바이오틱스 제품을 선택해 보세요.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">적절한 유산균 수 찾기</span>
    </div>
    <div class="mt-3">
    우리의 장은 유익균이 많다고 무조건 좋은 것이 아니에요. 유익균과 유해균의 황금 비율을 맞췄을 때 건강한 장이 되는데 유익균이 85%, 유해균이 15%일 때 가장 이상적입니다.
    </div>
    <div class="mt-3">
    그리고 유산균도 균이기 때문에 권장량 이상으로 많이 먹기 보다는 본인의 몸 상태를 살펴보면서 권장량 내에서 본인에게 맞는 유산균 수의 제품을 찾는 것이 좋습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">항생제와 동시에 먹지 않기</span>
    </div>
    <div class="mt-3">
    항생제는 우리 몸에 침입한 균을 죽이는 역할을 하는 약입니다. 그런데 유산균도 균의 일종이기 때문에 <span class="underLine">항생제와 유산균을 동시에 먹을 경우 항생제가 유산균을 죽이고, 반대로 유산균이 항생제의 효과를 떨어뜨릴 수 있어요.</span>
    </div>
    <div class="mt-3">
    따라서 <span class="highLight">항생제 치료가 다 끝난 뒤에 유산균을 먹기 시작</span>하거나, <span class="highLight">항생제를 복용하고 2시간 이상 지난 뒤 유산균</span>을 먹도록 해주세요.
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
