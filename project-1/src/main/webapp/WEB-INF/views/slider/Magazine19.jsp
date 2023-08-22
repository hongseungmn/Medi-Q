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
  	margin-top: 120px;
  	font-size: 23px;
  }
  .paragraphT{
  	margin-top: 80px;
  	font-size: 24px;
  	margin-bottom: 50px;
  }
  .paragraph-title{
  	margin-top: 65px;
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
    background: #80D4FF;
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
    background-color : #ffefd8;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #F15B6C;
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
  <div class="jumbotron rounded-3" style="background-color: #FFDAB9;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #000080">떠먹여 주는 영양제 레시피</span>
    	<h4><strong style="color:#F15A22; font-size:35px;">근육은 유지하고 지방만 쏙 빼는 다이어트 영양제 레시피</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    열심히 운동하고 식단 관리까지 하고 있는데 살은 안 빠지고 근손실만 와서 고민이신가요?
    오늘은 <span class="underLine">근육이 빠지는 건 막으면서 지방만 활활 태우는</span> <span class="highLight">다이어트 영양제 3종 레시피</span>를 준비했어요!
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/time.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #3964E5"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         다이어터를 위한 영양제 3종 레시피🥗<br/>
	         <span class="modalC">: 단백질 + 식이섬유 + 지방 분해 영양제<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 단백질 보충제는 아르기닌, 크레아틴, L-카르니틴 등이<br/> 
			 <span class="modalC">함께 들어간 제품을 선택하면 좋아요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 간이 약한 사람은 다이어트 영양제 섭취에 주의가 필요해요.<br/> 
		   	  <span class="modalC">영양제의 도움을 받는 것도 좋지만 가장 중요한 건 식단 관리와</span><br/>
		   	  <span class="modalC">꾸준한 운동이라는 점을 꼭 기억해 주세요!</span></p>
	        </div>	       
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px; height: 50px; font-size: 20px;">Close</button>
	        </div>
	 	 </div>
	   </div>
	  </div>
  </div>
    
  
  

  <div class="paragraph">
    <div>
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/one_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      근손실을 막는 단백질</span>
    </div>
     <div class="mt-4">
	    <img src="<c:url value="/images/magazine_images/19/img_yellow14.png"/>" class="img-fluid" style="width: 600px;">
	 </div>
    <div class="mt-5">
      근육을 유지하면서 체중을 감량하기 위해서는 <span class="underLine">적절한 운동을 하면서 단백질을 보충하는 것이 가장 중요</span>합니다. 
      기본적으로 지방이 빠질 때 단백질이 같이 빠지는데, 근육이 빠진 자리에는 지방이 축적되기 쉬우니 음식이나 영양제로 꾸준히 단백질을 보충해 주는 것이 포인트!
    </div>
    <div class="mt-3">
    	단백질을 운동하기 전후로 모두 먹는 경우도 있지만 굳이 두 번 섭취할 필요는 없어요. 
    	<span class="highLight">운동 1~2시간 전에는 에너지 공급원이 되는 탄수화물</span>을 먹고, <span class="highLight">운동이 끝난 직후에 단백질</span>을 먹어주는 것이 가장 좋습니다.
    </div>
    <div class="mt-3">
    	일반적으로 단백질 보충제는 ‘영양제’와 별도로 생각하는 경우가 많을 텐데요. 
    	단백질 제품 또한 ‘근육의 구성 성분’으로 식품의약품안전처의 인증을 받아, ‘건강기능식품’으로 등록된 제품들이 있으니 단백질 보충제를 선택할 때 인증마크를 확인해 보시면 좋을 것 같아요!
    </div>
    <div class="mt-3">
    	근육이나 운동에 도움이 되는 여러 성분이 있으니 단백질 보충제를 고를 때는 이런 성분이 함께 들어간 제품을 고려해보는 것도 좋아요. 근육과 관련된 호르몬의 분비를 돕고 근육으로 가는 혈액량을 증가시켜 근육 성장에 도움이 되는 
    	<span class="highLight">아르기닌</span>이나 고강도 운동을 지속적으로 하기 위해 도움이 되는 <span class="highLight">크레아틴</span>, 운동으로 인한 근육의 피로 개선에 도움이 되는 <span class="highLight">L-카르니틴</span> 등이 있답니다!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
      음식이 지방으로 쌓이는 것을 막는 식이섬유</span>
    </div>
    <div class="mt-4">
	    <img src="<c:url value="/images/magazine_images/19/img_yellow15.png"/>" class="img-fluid" style="width: 600px;">
	 </div>
    <div class="mt-5">
      살을 빼기 위해서는 적게 먹는 것이 가장 좋지만, 먹는 양을 줄이기가 너무 힘들다면 포만감을 느끼게 해주는 <span class="highLight">차전자피, 글루코만난과 같은 식이섬유</span>를 식사 전에 먹는 것이 도움이 됩니다. 
      식이섬유는 음식물이 장에서 흡수되는 것을 막아주기도 해요. 에너지가 남으면 체지방이 합성되는데 이런 여분의 에너지를 줄여서 체지방 감소에 도움을 줄 수 있답니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/three_W.png"/>" class="img-fluid mb-2 mr-2" style="width:50px">
       지방을 분해하는 영양제</span>
    </div>
    <div class="mt-2">
     : 가르시니아, 공액리놀렌산(CLA), 녹차추출물
    </div>
    <div class="mt-4">
	    <img src="<c:url value="/images/magazine_images/19/img_yellow16.png"/>" class="img-fluid" style="width: 600px;">
	 </div>
	 <div class="mt-5">
     다이어트 영양제로 가장 유명한 <span class="highLight">가르시니아</span>는 우리 몸에서 당이 지방으로 변하는 것을 막아주고 우리 몸의 특정 물질을 조절해서 지방을 에너지원으로 사용하도록 도와주는 역할을 합니다.
    </div>
    <div class="mt-3">
     <span class="highLight">공액리놀렌산(CLA)</span>은 여분의 에너지가 지방으로 합성되는 과정을 방해하는 역할을 하고, 기초대사량을 촉진해요. 그리고 노화한 지방 세포가 파괴되도록 유도해서 지방 세포 수를 감소시키는 데에 도움을 줍니다.
    </div>
    <div class="mt-3">
     <span class="highLight">녹차 추출물</span>의 성분인 카테킨도 체지방 감소에 도움을 줄 수 있어요. 카테킨 중 EGCG라는 성분이 우리 몸의 에너지 소모를 증가시키고 우리 몸에 지방과 콜레스테롤이 쌓이는 것을 억제하는 역할을 합니다. <span class="underLine">식사 후 지방이 쌓이는 것을 막기 위해서 식사 후 2시간 이내에 섭취</span>하는 것이 좋아요.
    </div>
    <div class="mt-3">
     하지만 어디까지나 영양제는 보조제일 뿐이니 너무 많이 욕심내서 많은 영양제를 먹는 것은 추천하지 않아요. 살을 뺄 때는 반드시 식단 조절과 운동을 병행하는 것이 가장 중요하답니다!
    </div>
  </div>
   <div class="paragraphT d-flex">
   	  <img src="<c:url value="/images/magazine_images/basic/analysis.png"/>" class="img-fluid mb-2 mr-4" style="width:70px; height: 70px;">
      <div>
      	<b style="font-size: 27px;">빈혈이 있다면?</b><br/>
      	 우리 몸에서 지방을 태우기 위해서는 산소가 필요해요. 그런데 철분이 부족해서 몸 안에서 산소를 제대로 운반하지 못하면 지방을 태우기가 어려워집니다. 따라서 <span class="underLine">철분 부족으로 인한 빈혈이 있는 경우에는 철분을 보충해 주세요!</span>  
      </div>
  </div>
  	<div class="mt-5 ml-3" style="font-size: 23px;">
     <img src="<c:url value="/images/magazine_images/basic/warning.png"/>" class="img-fluid mb-2 mr-1" style="width: 40px;">
     <b style="font-size: 24px;">다이어트 영양제 섭취 시 주의사항</b>
    </div>
    <div class="mt-1 ml-4" style="font-size: 23px;">
    	가르시니아나 공액리놀렌산은 간에 무리를 줄 수 있는 영양제예요. 녹차추출물의 경우 적정량에서는 오히려 간에 좋지만, 과량을 오래 섭취했을 경우에는 간 독성이 생긴다는 의견도 있어요. 따라서 <span class="highLight">평소 간이 안 좋거나 간염이 있는 분들은 주의가 필요합니다.</span>
    </div>
    <div class="mt-3 ml-4" style="font-size: 23px;">
    	또한 <span class="underLine">녹차추출물은 카페인이 함유되어 있기 때문에 카페인에 예민한 분들은 주의가 필요해요.</span> 
    	커피나 초콜릿,콜라 등의 고카페인 식품을 먹고 녹차 추출물 성분의 영양제까지 섭취할 경우 카페인 과다 증상이 나타날 수 있기 때문에 카페인 섭취량을 조절해 주세요.
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
