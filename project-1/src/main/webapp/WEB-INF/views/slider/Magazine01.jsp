<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hongseongmin
  Date: 6/29/23
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  	margin-top: 70px;
  }
  .paragraph{
  	margin-top: 115px;
  	font-size: 23px;
  }
  .custom-text{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 30px;
  }
  .custom-modal{
    width: 120px;
    background: #87CEEB;
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
	width: 600px;
  	height: 700px;
  }
  .modalB{
  	margin-bottom: 50px;
  }
  .modalC{
  margin-left: 61px;
  }
  
  .highLight {
    background-color : #FFC7B2;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #ED1941;
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
    width: 1500px;
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
    color:#A7A4A4;
  }
  .card-content {
    width: 100px;
    font-size: 22px;
  }
  .product-img {
    border-radius: 20%;
    border: #ccc solid 1px;
  }
  .custom-footer{
  	padding-top : 20px;
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
    overflow: hidden; /* 스크롤바 숨김 */
  }
</style>
<div class="container custom-top">
  <div class="jumbotron rounded-3 " style="background-color: #FEDCBD;">
  	<div class="container">
	    <img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">영양소 A to Z</span>
	    <h4><strong style="color:#EE4949; font-size:40px;">운동러들의 필수 보충제, 아르기닌의 부작용</strong></h4>
  	</div>
  </div>
  <div style="font-size:24px;" class="contentTop">
   	  <span style="background-color: #FFC7B2; font-size:32px;">아르기닌</span>이 운동 능력 향상에 도움이 된다고 알려져 최근 운동을 하는 분들이 많이 찾고 있죠.<br/>
   	   아르기닌은 운동과 관련된 역할 외에도 우리 몸에서 다양한 역할을 하는 아미노산이지만 <br/>
   	   어떤 영양제든 과다하게 섭취할 경우 부작용이 있을 수 있으니 부작용을 꼼꼼히 살펴보고 선택하도록 해주세요.
  </div>
  <div class="mt-5">
    <img src="<c:url value="/images/magazine_images/01/01_IMG.png"/>" class="img-fluid">
  </div>
  <!--
  <hr class="my-hr mt-5 mb-5">
   -->
  <div class="paragraph">
	<img src="<c:url value="/images/magazine_images/basic/work-time.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #FF7C4C"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         아르기닌은 모근의 혈액 공급을 도와 머리카락의<br/> 
	         <span class="modalC">성장에 도움을 줄 수 있어요. (탈모 걱정은 No!)<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 헤르페스 바이러스의 증식에 관여하기 때문에<br/> 
			 <span class="modalC">평소 헤르페스가 있던 분들은 주의가 필요해요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 그 외에도 저혈압, 소화 문제, 알레르기의 악화 등의<br/> 
		   	  <span class="modalC">부작용이 있을 수 있으니 본인에게 맞는 섭취량을</span><br/>
		   	  <span class="modalC">찾아서 먹도록 해주세요.</span></p>
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
    <img src="<c:url value="/images/magazine_images/basic/QuestionMark.png"/>" class="img-fluid" style="width:60px; margin-bottom: 15px;">
      <span class="title ml-2" style="font-size:30px"><strong>아르기닌이 탈모를 유발한다?</strong></span>
    </div>
    <div class="mt-3">
      아르기닌을 먹으면 탈모가 온다는 얘기가 종종 들려오는데 아직
      <span class="highLight">탈모와의 직접적인 상관관계는 밝혀진 바가 없어요.</span><br/>
      오히려 아르기닌은 혈관을 확장시켜서 혈액순환을 도와주기 때문에
      <span class="underLine">모근으로 공급되는 혈액량을 늘리고 머리카락의 성장에 도움을 줄 수 있다는 주장</span>도 있습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">헤르페스 바이러스</span>
    </div>
    <div class="mt-3">
      입술이나 남녀의 성기 부분에 포진을 발생시키는 <span class="highLight">헤르페스 바이러스가 있는 분들은 주의가 필요해요. </span><br/>
      아르기닌이 헤르페스 바이러스의 증식에 관여하기 때문에
      평소 컨디션이 안 좋으면 입술 포진이 잘 올라오는 분들은 아르기닌을 먹기보다 목적에 맞는 다른 영양제를 선택하시는 것이 좋습니다.
    </div>
    <div class="mt-3">
      하지만 헤르페스 바이러스 자체를 만들어내는 것은 아니기 때문에 <span class="underLine">헤르페스가 있었던 적이 없는 분들은 안심하셔도 괜찮아요!</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">저혈압</span>
    </div>
    <div class="mt-3">
      아르기닌은 혈관을 확장하여 혈액 잘 순환되도록 돕는데요.
      과다하게 섭취할 경우에는 오히려 혈압을 낮출 수 있기 때문에 <span class="underLine">평소 저혈압이 있거나 혈압약을 복용하는 중인 경우 전문가와 상담 후 복용</span>하는 것이 좋아요.
      비아그라와 같은 약도 혈관을 이완하기 때문에 이런 약을 먹고 있다면 아르기닌 섭취량을 반드시 체크해 주세요.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">소화 문제</span>
    </div>
    <div class="mt-3">
      일반적인 영양제에서 나타나는 대표적인 부작용이죠.
      아르기닌도 마찬가지로 설사, 복통을 비롯해 배가 빵빵한 느낌이 드는 팽만감까지
      <span class="underLine">다양한 위장장애를 유발</span>할 수 있습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">알레르기</span>
    </div>
    <div class="mt-3">
      <span class="underLine">아르기닌 자체에 알레르기가 있는 경우도 있어요. </span>
      따라서 아르기닌을 섭취 후 두드러기, 발진, 호흡 곤란 등의 증상이 나타날 경우 즉시 섭취를 중단하셔야 합니다.
      또한 천식이나 다른 알레르기가 있는 분들은 이런 증상이 아르기닌에 의해서 악화될 수 있습니다.
    </div>
  </div>
  <!--
  <hr class="mt-5 my-hr">
   -->
  <div class="mt-5 mb-5 jumbotron" style="font-size: 21px;">
    국내에서는 특정 회사에서 개별적으로 인정받은 아르기닌만이 건강기능식품 인증을 받았는데,
    <span class="highLight">혈관 이완을 통한 혈액 순환 개선을 위해서 하루 6g의 아르기닌을 섭취하도록 권장</span>하고 있어요.
    <span class="underLine">보충제로 복용할 경우 명확하게 정해진 용량은 없지만 보통 1~3g 정도를 시작으로 효과나 부작용에 따라 조절</span>하면서 나에게 맞는 섭취량을 찾아보세요!
  </div>
</div>
<div class="container custom-footer">
  <span class="custom-text">
	<img src="<c:url value="/images/magazine_images/basic/happy.png"/>" class="img-fluid mb-1" style="width:65px">
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