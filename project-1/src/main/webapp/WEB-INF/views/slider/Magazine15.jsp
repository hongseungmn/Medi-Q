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
  	margin-top: 75px;
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
    background: #F8ABA6;
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
	width: 805px;
  	height: 670px;
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
    background-color : #FFE4E1;
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
  <div class="jumbotron rounded-3" style="background-color: #FFF8A6;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">영린이 탈출, 영양제 상식</span>
    	<h4><strong style="color:#F26522; font-size:35px;">멀티비타민과 종합비타민은 무엇이 다를까?</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    여러 비타민이 함유된 영양제를 이야기할 때 종합비타민(종비), 멀티비타민, 
    비타민B군, 활성형 비타민 등 다양한 표현으로 부르죠. 그런데 <span class="underLine">종합비타민과 멀티비타민은 차이가 있다</span>는 걸 아시나요?
  </div>
  <div class="mt-4">
    <img src="<c:url value="/images/magazine_images/15/img_sky4.png"/>" class="img-fluid" style="width: 600px;">
  </div>
  
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/contract.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #33A3DC"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         종합비타민은 비타민 A, B군, C, D, E 5가지가 모두 포함된 제품,<br/> 
	         <span class="modalC">멀티비타민은 이 중 두 가지 이상이 포함된 제품을 의미해요.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 다만 종합비타민의 조건에 만족하더라도 원할 경우<br/> 
			 <span class="modalC">멀티비타민이라고 표기가 가능해요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 영양제를 선택하기 전에 내가 원하는 성분이 적절히 들어갔는지<br/> 
		   	  <span class="modalC">확인해 보세요!</span></p>
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
      <span class="para_title"><img src="<c:url value="/images/magazine_images/15/lemon.png"/>" class="img-fluid mb-4 mr-1" style="width:55px">
      종합비타민</span>
    </div>
    <div>
      비타민 A, B군, C, D, E&nbsp;&nbsp;<strong>5가지가 모두 포함된 영양제</strong>
    </div>
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/15/lemon.png"/>" class="img-fluid mb-4 mr-1" style="width:55px">
      멀티비타민</span>
    </div>
    <div>
      비타민 A, B군, C, D, E 중&nbsp;&nbsp;<strong>두 가지 이상이 포함된 영양제</strong>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-4">
      종합비타민과 멀티비타민이 법적으로 정확하게 규제된 건 아니기 때문에 조금씩 기준의 차이가 있기는 하나 일반적으로 이러한 기준으로 구분하고 있어요. 
      단, <span class="underLine">종합비타민의 조건에 만족하더라도 업체에서 굳이 원할 경우에는 멀티비타민이라고 표기가 가능</span>합니다.
    </div>
    <div class="mt-3">
      비타민 B군의 경우 티아민(비타민 B1), 판토텐산, 비오틴 등 종류가 다양한데, <span class="highLight">비타민 B군은 개수와 상관없이 무조건 비타민 1개로 계산</span>됩니다. 
      따라서 비타민 B3, 비타민 B6, 비타민 B12, 비타민 C, 비타민D가 들어있을 경우 비타민 5개가 아닌 비타민 3개를 포함한 것으로 인정되어, 종합비타민이 아닌 멀티비타민으로 보아야 해요.
    </div>
  </div>
  <div class="paragraph">
	  <div class="mt-3">
	    실제로는 종합비타민의 기준에 부합하더라도 멀티비타민으로 표기되는 경우도 많고, <span class="highLight">이 두 가지를 명확하게 구분 짓지 않고 사용되는 경우가 많습니다.</span>
	    또한 종합비타민의 경우 다양한 비타민이 들어있기는 하나 함량이 낮은 경우도 있어요.
	  </div>
	  <div class="mt-3">
	    내가 선택한 영양제가 정말로 원하는 성분을 모두 포함하고 있는지 성분과 함량을 확인하여 나에게 필요한 영양제를 선택해 보세요!
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
