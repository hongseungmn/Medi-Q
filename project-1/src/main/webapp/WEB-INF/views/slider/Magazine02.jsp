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
    
    padding-top : 145px;
  }
  .contentTop{
  	padding-top: 40px;
  }
  .paragraph{
  	margin-top: 100px;
  	font-size: 22px;
  }
  .paragraph-title{
  	margin-top: 40px;
  	margin-bottom: 70px;
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
    background: #FF6347;
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
	width: 830px;
  	height: 700px;
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
    background-color : #f4bfbf;
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
    height: 300px;
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
  	padding-top : 180px;
  	margin-bottom: 240px;
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
  <div class="jumbotron rounded-3" style="background-color: #FFE4E1;">
    <div class="container">
    <img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">영양소 A to Z</span>
    <h4><strong style="color:#ee4949; font-size:40px;">진짜 효과 있는 콜라겐을 고르는 법</strong></h4>
   </div>
  </div>

  
   <div style="font-size:24px;" class="contentTop">
      <span style="background-color: #FFE4E1; font-size:35px;">콜라겐</span>은 피부의 약 70%를 차지하는 구성 물질로, <span class="underLine">피부 탄력을 유지하는 데 중요한 단백질</span>입니다.<br/>
      나이가 들면서 콜라겐이 감소하기 시작하여 피부의 탄력이 떨어지고 주름이 생겨요.
      그래서 이러한 피부 노화를 되돌리기 위해 콜라겐 성분의 화장품을 바르거나 콜라겐 영양제를 먹고는 하죠.
    </div>
    <div class="custom-img">
    	<img src="<c:url value="/images/magazine_images/02/01_IMG.png"/>" class="img-fluid">
  	</div>
  	<div class="paragraph-title d-flex">
	    <img src="<c:url value="/images/magazine_images/basic/question.png"/>" class="img-fluid mr-2 mb-5" style="width:90px"> 
        <div class="contents">
            그런데 <span style="background-color: #FFE4E1; font-size:24px;">콜라겐은 분자가 커서 절대 흡수가 될 수 없다</span>는 말을 많이 들어보셨을 것 같아요.<br/> 
            과연 콜라겐을 외부에서 공급하는 것이 정말 효과가 있을까요?
        </div>
  	</div>
  	
  	
    <div>
	<img src="<c:url value="/images/magazine_images/basic/work-time.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #9370DB"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         피부에 바르는 콜라겐 화장품은 흡수가 되기 어려워요.<br/> 
	         <span class="modalC">다만 피부 보습 효과는 있어서 피부 건강에 도움이 될 수는 있습니다.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 먹는 콜라겐도 흡수되는 양이 많지는 않지만 요즘은 피부 건강에<br/> 
			 <span class="modalC">도움을 준다는 기능성을 인증받은 영양제가 출시되고 있어요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 영양제를 고를 때는 식약처 인증 여부, 콜라겐 분자량, <br/> 
		   	  <span class="modalC">제형, 부원료 등을 확인하고 골라주세요!</span></p>
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
      <span class="para_title">바르는 콜라겐</span>
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/02/02_IMG.png"/>" class="img-fluid">
    </div>
    <div class="mt-3">
      많이 알려진 정보처럼 <span class="underLine">콜라겐 입자는 크기 때문에 피부로 들어가기가 어려워요. </span>
      따라서 피부 속으로 침투하여 피부 속의 콜라겐을 보충해 주고 탄력을 높여주기를 기대할 수는 없습니다.
      <span class="highLight">다만 콜라겐이 피부 보습에 도움을 주어 피부 상태가 개선될 수는 있어요. </span>
      콜라겐 화장품을 바르고 피부가 좋아지는 것은 콜라겐 보충으로 인한 탄력 개선이 아닌, 화장품의 보습 기능으로 인한 것이랍니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">그렇다면 먹는 콜라겐은 효과가 있을까?</span>
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/02/03_IMG.png"/>" class="img-fluid">
    </div>
    <div class="mt-3">
      바르는 콜라겐과 마찬가지로 먹는 콜라겐도 분자가 커서 흡수가 되기 어려워요.
      그래서 기존에는 콜라겐이 영양제로 인정받지 못했습니다.
      그런데 최근에 2세대, 3세대 콜라겐들이 나오면서 <span class="underLine">콜라겐의 크기가 작아지고 피부에 관한 기능성을 인증받은 영양제들이 나오고 있답니다!</span>
    </div>
    <div class="mt-3">
      하지만 먹는 콜라겐 역시 흡수가 되어 콜라겐 보충 효과를 내기가 쉽지는 않아요.
      우선 콜라겐을 섭취할 경우 위와 장을 거치면서 대부분 아미노산으로 분해가 됩니다.
      또한 흡수된다 해도 이 콜라겐은 온몸으로 흡수되기 때문에 피부로 전달되는 콜라겐의 양은 극히 일부예요.
      그렇기 때문에 더더욱 <span class="highLight">피부에 대한 기능성을 인증받은 제품을 선택하는 것이 중요합니다.</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">효과 좋은 콜라겐 영양제 고르는 법</span>
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/02/04_IMG.png"/>" class="img-fluid">
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/basic/1.png"/>" class="img-fluid mb-2" style="width:50px">
      <span class="subtitle">인증 마크</span>
    </div>
    <div class="mt-3">
      식약처의 인증을 받은 콜라겐 영양제에는 <span class="highLight">‘건강기능식품’ 인증 마크</span>가 있어요. (제품유형에는 건강기능식품이라고 표기되어 있습니다.)
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/02/05_IMG.png"/>" class="img-fluid">
    </div>
    <div class="mt-3">
      식약처의 인증을 받은 콜라겐의 기본적인 기능성은 ‘피부 보습에 도움을 줄 수 있음’이에요.
      추가적으로 ‘자외선으로 인한 피부 손상으로부터 피부 건강을 유지하는 데 도움을 줄 수 있다’는 기능을 인정받은 제품도 있답니다.
      제품 정보를 보면 어떤 기능을 가진 제품인지 확인하실 수 있어요!
    </div>
    <div class="mt-3">
      <span class="underLine">식약처의 인증을 받지 않은 경우 일반 식품</span>이기 때문에 제품유형이 아닌 ‘식품’유형이 적혀있어요.
      이 부분을 보면 기타가공품, 캔디류 등으로 분류가 되어있을 거예요.
      이런 제품들은 식품이라서 피부 건강에 도움을 주는 영양제라고 보기 어렵습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/basic/2.png"/>" class="img-fluid mb-2" style="width:50px">
      <span class="subtitle">콜라겐 분자의 크기, 달톤</span>
    </div>
    <div class="mt-3">
      달톤(Da)은 콜라겐 분자량의 크기를 나타내는 단위입니다.
      앞서 피부에 바르는 콜라겐이나 먹는 콜라겐 모두 콜라겐의 크기 때문에 흡수가 어렵다고 했죠.
      <span class="highLight">콜라겐이 흡수되기 위해서는 분자량이 작은 제품을 고르는 것이 중요해요.</span>
    </div>
    <div class="mt-3">
      예전 콜라겐 제품들은 분자량이 3,000Da 정도로 컸지만, 요즘은 저분자 콜라겐들이 많이 나오고 있습니다.
      <span class="underLine">기본적으로 1,000Da 이하의 제품을 고르는 것이 좋으며, 최근에는 500Da의 초저분자 콜라겐 영양제들도 나오고 있어요. </span>
      분자량이 표기가 안 되어있거나 너무 클 경우에는 효과를 기대하기 어렵기 때문에 분자량을 확인하고 선택하는 것이 좋습니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/basic/3.png"/>" class="img-fluid mb-2" style="width:50px">
      <span class="subtitle">제형</span>
    </div>
    <div class="mt-3">
      식약처의 인증을 받은 콜라겐은 <span class="highLight">액상, 가루, 알약 딱 세 가지 형태</span>로만 나오고 있어요.
      따라서 젤리와 같은 그 외의 형태로 나온 제품은 확인이 필요합니다.
      액상, 가루, 알약 중에는 본인의 취향에 따라서 선택해 주세요!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/basic/4.png"/>" class="img-fluid mb-2" style="width:50px">
      <span class="subtitle">부원료</span>
    </div>
    <div class="mt-3">
      피부를 위해 먹는 영양제인 만큼 <span class="underLine">피부에 도움이 되는 다른 성분이 함께 들어간 제품을 고르는 것이 좋습니다. </span>
      가장 먼저 콜라겐을 만들 때 비타민 C가 필요하기 때문에 콜라겐과 <span class="highLight">비타민 C</span>를 같이 먹으면 콜라겐의 기능에 도움이 돼요.
      그 외에도 피부 건강에 좋은 <span class="highLight">엘라스틴이나 히알루론산</span> , 콜라겐 생성에 도움이 되는  <span class="highLight">비오틴, 비타민 A</span>
      등이 함께 든 영양제를 골라주시면 좋습니다.
    </div>
  </div>
  <!-- 
  <hr class="my-hr mt-5 mb-5">
   -->
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
</div>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
