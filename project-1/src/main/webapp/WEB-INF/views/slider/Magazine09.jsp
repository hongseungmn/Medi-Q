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
  	margin-top: 80px;
  	font-size: 23px;
  }
  .paragraph-title{
  	margin-top: 70px;
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
    background: #FCAF17;
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
	width: 630px;
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
    background-color : #E6E6FA;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #BA55D3;
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
  <div class="jumbotron rounded-3" style="background-color: #E6E6FA;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #006400">영양제 팩트체크</span>
    	<h4><strong style="color:#9932CC; font-size:35px;">영양제 섭취 초기의 가려움, 설사... 영양제의 명현현상</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    간혹 영양제를 먹은 후에 두드러기가 나거나 어지럽거나 해서 업체에 연락했더니 ‘명현현상이니 걱정하지 말고 계속 드시라’고 하는 경우가 있는데, 명현현상은 무엇이고 이런 경우에는 어떻게 해야 할까요?
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/notes.png"/>" class="img-fluid mr-4 mb-4" style="width:110px">
	<span style="font-size: xx-large; color: #EE4949"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         명현현상이란 치료 과정에서 일시적으로 나타나는<br/> 
	         <span class="modalC">다른 증상을 일컫는 말이에요.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 하지만 현대 의학에서는 명현현상이라는 개념을<br/> 
			 <span class="modalC">인정하지 않아요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 이상 증상이 나타났다면 즉시 섭취를 중단하고<br/> 
		   	  <span class="modalC">의사와 상담해야 합니다!</span></p>
	        </div>	       
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 50px; font-size: 20px;">Close</button>
	        </div>
	 	 </div>
	   </div>
	  </div>
  </div>
    
  
  

 <div class="paragraph">
      <span class="para_title">명현현상(瞑眩現象)이란<img src="<c:url value="/images/magazine_images/basic/info.png"/>" class="img-fluid ml-2 mb-4" style="width:55px"> </span>
    <div class="mt-2">
      <span class="underLine">장기간에 걸쳐 나빠졌던 건강이 치유되면서 일시적으로 예기치 못한 반응이 나타나는 것</span>을 의미합니다. 명현 반응, 호전 반응 등으로 표현하기도 해요. 
      명현현상이 강할수록 치료 효과가 더 좋다는 말도 있으나 <span class="highLight">명현현상은 의학적으로 인정되지 않은 개념</span>입니다.
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/09/img_blue5.png"/>" class="img-fluid mb-4">
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">명현현상이니 계속 먹으라고 한다면?</span>
    </div>
    <div class="mt-4">
      이상 증상이 나타났는데 명현 반응이니 계속 섭취하라고 하거나, 오히려 섭취량을 더 늘려보라고 하는 경우도 있는데요. 
      <span class="underLine">영양제를 먹었는데 가려움, 식은땀, 변비, 설사 등의 증상이 나타나는 것은 명현현상이 아닌 명백한 부작용입니다.</span> 
      건강기능식품은 안전성이 확인된 원료를 사용해서 안전하게 만들어진 식품이지만 개인의 체질이나 상황에 따라 이상 반응이 나타날 수 있어요.
    </div>
    <div class="mt-4">
      특히 피부에 두드러기가 올라왔다면 이것은 영양제가 몸에 맞지 않아서 나타나는 알레르기 반응이라고 보셔야 합니다. 이럴 때는 <span class="highLight">영양제의 복용을 즉시 중단하고 의료진과 상담</span>하도록 해주세요.
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
