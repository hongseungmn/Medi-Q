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
  	margin-bottom: 80px;
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
    background: #FF7F50;
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
	width: 835px;
  	height: 710px;
  }
  .modalB{
    margin-top : 20px;
  	margin-bottom: 50px;
  }
  .modalC{
  margin-left: 64px;
  }
  .subtitle{
  	font-size: 26px;
  	color: #191970;
  	margin-left: 18px;
  	font-weight: bold;
  }
  
  .highLight {
    background-color : #FFE4BF;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #ee4949;
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
  <div class="jumbotron rounded-3" style="background-color: #fff3d6;">
    <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">떠먹여 주는 영양제 레시피</span>
    <h4><strong style="color:#FFB726; font-size:35px;">운동 전후 보충제로 멸치 탈출! 운동 영양제 레시피</strong></h4>
  </div>
</div>

  <div style="font-size:27px;" class="contentTop d-flex">
	  <img src="<c:url value="/images/magazine_images/basic/running.png"/>" class="img-fluid mr-3 mt-4" style="width:150px; height:150px;"> 
    <div class="contents">
      ‘건강’에 대한 관심이 증가하면서 자연스럽게 운동과 관련된 보충제에 대한 관심도 높아지고 있죠.<br/> 
      즐겁게 건강 관리를 하는 헬시 플레저가 확산되고 있지만, 그럼에도 꾸준히 운동한다는 것은 여전히 어려운 일인데요. 힘들게 한 만큼 확실한 효과를 볼 수 있게 도와줄 운동 영양제 레시피를 준비했어요!
    </div>
  </div>
  
  
  <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/time.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #2E8B57"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         운동러를 위한 <strong style="color: #696969;">영양제 4종</strong> 레시피<img src="<c:url value="/images/magazine_images/basic/fitness.png"/>" class="img-fluid ml-3 mb-4" style="width:40px"><br/> 
	         <span class="modalC">: 단백질 + 아르기닌/BCAA + L-카르니틴 + 크레아틴<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 운동 전후 외에도 항상 단백질이 풍부한 음식을 먹되, 많은 양을<br/> 
			 <span class="modalC">한 번에 먹기보다는 하루 동안 나눠서 먹도록 해주세요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 근육 성장이나 운동 능력에 도움을 줄 아르기닌, BCAA, 크레아틴이나<br/> 
		   	  <span class="modalC">체지방 감소에도 도움을 주는 L-카르니틴 등을 같이 조합해 보세요!</span></p>
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
      <img src="<c:url value="/images/magazine_images/basic/1.png"/>" class="img-fluid mb-2 mr-1" style="width:50px">
      <span class="subtitle">단백질 보충제</span>
    </div>
    <br>
    <div>
      <img src="<c:url value="/images/magazine_images/05/01_IMG.png"/>" class="img-fluid">
    </div>
    <div class="mt-5">
      <p>
        일반적으로 운동 전이나 후에 단백질 보충제를 드시는데, <span class="highLight">단백질은 운동하지 않는 시간에도 일정하게 보충하는 것이 필요해요!</span>
        단백질을 잘 먹지 않으면 우리 몸에서 근육의 단백질을 사용하게 되고,
        운동으로 인해 근육이 빠진 자리에 지방이 축적되기 쉬운 상태가 되니 평소에도 단백질이 풍부한 음식을 먹을 수 있도록 해주세요.
      </p>
    </div>

    <div class="mt-4">
      <p>
        하지만 <span class="underLine">단백질을 장기간 과도하게 섭취하게 될 경우 신장에 무리를 줄 수 있어요.</span>
        너무 많은 양의 단백질을 한 번에 먹거나 장기간 먹을 경우 신장 내부의 압력을 높이고 신장에 손상을 일으킬 수 있어요.
        특히 신장 기능이 떨어진 상태에서 많은 단백질을 먹으면 더 많은 손상이 발생할 수 있으니, 주의가 필요합니다.
      </p>
    </div>
    <div class="mt-4">
      <p>
        일반적으로 단백질은 체중 1kg당 단백질 0.8~1g 정도를 권장하며, <span class="underLine">운동을 하고 근육을 키우는 목적으로 드실 경우 체중 1kg당 최대 2g 정도까지는 섭취가 가능</span>해요. 
        다만 일반 식품으로도 단백질을 섭취하기 때문에 운동 전후 보충제로 <span class="highLight">이 양을 모두 먹는 것은 피하고, 이 양을 하루 동안 나눠서 먹는 것이 좋습니다.</span>
      </p>
    </div>
  </div>
  
  <div class="paragraph">
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/basic/2.png"/>" class="img-fluid mb-2 mr-1" style="width:50px">
      <span class="subtitle">근육 키우기</span>
    </div>
    <br>
    <div>
      <img src="<c:url value="/images/magazine_images/05/02_IMG.png"/>" class="img-fluid">
    </div>
    <div class="mt-5">
      <p>
        운동 시에 섭취하면 좋은 영양제에는 대표적으로 <span class="highLight">아르기닌</span>이 있어요.
        아르기닌은 근육으로 가는 혈액의 순환을 도와 <span class="underLine">근육을 키우는 데에 도움을 주고, 근육을 덜 지치게 해서 운동을 지속할 수 있도록 하는 효과</span>가 있습니다.
      </p>
    </div>
    <div class="mt-4">
      <p>
        또 다른 대표적인 보충제 중 하나인 <span class="highLight">BCAA</span>는 <span class="underLine">단백질 합성을 증가시켜 근육의 성장에 도움을 줍니다. </span>
        또한 운동 시의 근육의 피로도를 감소시켜서 <span class="underLine">운동 능력을 향상</span>시키는 역할도 해요.
      </p>
    </div>
    <div class="mt-4">
      <p>
        <span class="underLine">우리 몸에서 근육을 만들기 위해서는 성장 호르몬이 중요한 역할</span>을 하는데, <span class="highLight">오메가3</span>가 이
        <span class="underLine">성장 호르몬을 자극</span>하기 때문에 함께 섭취해 주시면 좋습니다.
        또한 오메가3는 <span class="underLine">항염증 효과가 있어 운동 후의 근육 손상을 회복</span>하는 데에 도움을 줄 수 있어요.
      </p>
    </div>
  </div>
  
  <div class="paragraph">
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/basic/3.png"/>" class="img-fluid mb-2 mr-1" style="width:50px">
      <span class="subtitle">체지방 감소도 함께</span>
    </div>
    <br>
    <div>
      <img src="<c:url value="/images/magazine_images/05/03_IMG.png"/>" class="img-fluid">
    </div>
    <div class="mt-5">
      <p>
        <span class="highLight">L-카르니틴</span>은 <span class="underLine">근육의 구성 성분이면서 운동으로 인한 피로 개선과 체지방 감소에도 도움을 주는 영양제</span>예요.
        L-카르니틴은 지방을 에너지로 전환하는 역할을 하여 체중 감량에 도움을 줄 수 있습니다.
        카르니틴은 건강한 몸에서 자연스럽게 합성하지만 나이가 들면서 합성되는 양이 줄어들어요.
        나이가 들수록 살이 잘 찌는 이유가 이 카르니틴 합성의 감소와도 관련이 있답니다.
        그러니 나이가 들면서 점점 살을 빼기가 어려웠던 분들, 근육을 키우면서 다이어트도 하고 싶은 분들은 L-카르니틴을 챙겨보세요!
      </p>
    </div>
    <div class="mt-4">
      <p>
        앞서 근육의 성장에 도움이 된다고 언급했던 <span class="highLight">오메가3</span>는
        <span class="underLine">우리 몸의 중성 지질과 나쁜 콜레스테롤인 LDL 수치를 낮추는 데에도 도움</span>이 되기 때문에,
        근육을 키우면서 건강하게 체중 감량도 하고 싶은 분들께도 좋은 영양제랍니다!
      </p>
    </div>
  </div>
  
  <div class="paragraph">
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/basic/4.png"/>" class="img-fluid mb-2 mr-1" style="width:50px">
      <span class="subtitle">지구력 및 운동 수행능력 향상</span>
    </div>
    <br>
    <div>
      <img src="<c:url value="/images/magazine_images/05/04_IMG.png"/>" class="img-fluid">
    </div>
    <div class="mt-5">
      <p>
        운동을 했을 때 운동의 효과를 잘 보기 위해 근육을 키우거나 체지방 감소에 도움이 되는 보충제를 먹는 것도 좋지만,
        운동을 꾸준히 하기 위한 능력 향상에 도움이 되는 보충제를 먹을 수도 있어요. <span class="highLight">옥타코사놀은 지구력 증진에 도움을 줄 수 있고,
            크레아틴은 근력 운동 시의 운동 수행 능력 향상에 도움을 줄 수 있는 영양제입니다.</span>
      </p>
    </div>
    <div class="mt-4">
      <p>
        운동을 하면서 우리 몸의 에너지를 사용하게 되는데, 크레아틴은 이 에너지를 재충전하는 데 도움을 줘요.
        근육으로의 에너지 공급량을 늘려 결과적으로 더 많은 에너지를 발생하도록 도와주고 더 무거운 중량으로 더 많은 횟수의 운동을 할 수 있도록 만들어 줍니다.
        <span class="underLine">고강도의 근력 운동을 위한 부스터 역할의 보충제를 찾는다면 크레아틴을 운동 전에 섭취해 보세요!</span>
      </p>
    </div>
  </div>
</div>

<div class="container custom-footer">
  <span class="custom-text"><img src="<c:url value="/images/magazine_images/basic/happy.png"/>" class="img-fluid mb-1" style="width:65px">
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
