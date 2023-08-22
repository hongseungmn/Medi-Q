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
  	margin-top: 95px;
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
	width: 780px;
  	height: 540px;
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
    background-color : #FEEEED;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #2B4490;
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
  <div class="jumbotron rounded-3" style="background-color: #FFE4E1;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">떠먹여 주는 영양제 레시피</span>
    	<h4><strong style="color:#EE4949; font-size:35px;">환절기에도 걱정 없는 피부 건강 영양제 레시피</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    이번 봄에는 건조주의보보다 더 심한 건조경보 지역이 있을 만큼 아주 많이 건조하죠. 따뜻한 기온이 아닌 쩍쩍 갈라지는 피부와 건조해진 눈과 코로 봄을 느낄 정도로 건조한 요즘. 
    <span class="underLine">유수분의 균형이 깨지고 건조해진 피부를 위한</span> <span class="highLight">수분 폭탄 영양제 레시피</span>를 준비했어요!
  </div>
  <div class="mt-4">
    <img src="<c:url value="/images/magazine_images/18/img_yellow9.png"/>" class="img-fluid" style="width: 600px;">
  </div>
  <div class="mt-5">
    <span class="highLight">피부가 건조해지는 원인은 크기 두 가지</span>가 있어요.<br/>
	<b style="color: #2B4490;">첫 번째</b>는 <span class="underLine">피부의 보호막인 피부 장벽이 무너져 있는 경우</span>이고,<br/>
	<b style="color: #2B4490;">두 번째</b>는 <span class="underLine">피부 속에 염증이 있는 경우</span>예요.<br/>
	피부 속에 염증이 있으면 피부가 간지럽고 건조해질 수 있는데, 이럴 때는 피부 속의 염증을 해결해야 근본적인 건조함을 해결할 수 있답니다.
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/time.png"/>" class="img-fluid mr-4" style="width:100px">
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
	         피부 속 염증을 해결해야 근본적인 속 건조를 해결할 수 있어요!<br/></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 피부 장벽을 지키는 영양제까지 추가하면 수분 잠금 완료!<br/></p>
			 <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 수분 폭탄 피부를 위한 영양제 4종 레시피💦<br/> 
			 <span class="modalC">: 오메가3 + 종합비타민 + 맥주 효모 + 피부 보습 인증 영양제<br/></span></p>
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
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/one_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
      오메가3</span>
    </div>
    <div class="mt-4">
      <img src="<c:url value="/images/magazine_images/18/img_yellow10.png"/>" class="img-fluid" style="height: 230px;">
    </div>
    <div class="mt-5">
      우리의 피부 표면은 대부분 지방으로 이루어져 있기 때문에 <span class="highLight">오메가3와 같은 지방 성분</span>이 <span class="underLine">피부 장벽을 건강하게 만들어서 피부를 외부 자극으로부터 보호</span>해 주는 데에 도움을 줄 수 있어요. 
      또한 오메가3는 항염증 효과가 있는 대표적인 지방산이기 때문에 <span class="underLine">피부 속의 염증을 억제해서 속 건조 해결에 도움</span>을 주고 여드름에도 효과적이에요.
    </div>
    <div class="mt-4">
      오메가3와 유사하게 지방산의 일종인 <span class="highLight">달맞이꽃종자유(감마리놀렌산)</span>도 피부 장벽을 튼튼하게 해주고 염증을 줄여주는 데에 도움을 줍니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
      종합 비타민 & 미네랄</span>
    </div>
    <div class="mt-4">
      <img src="<c:url value="/images/magazine_images/18/img_yellow11.png"/>" class="img-fluid" style="height: 270px;">
    </div>
    <div class="mt-5">
      다양한 비타민이 피부 건조함을 해결하는 데에 도움을 주기 때문에, 비타민이 골고루 들어간 종합 비타민을 드시는 것이 좋아요.
    </div>
    <div class="mt-4">
      <span class="highLight">비타민 D</span>는 뼈 건강에 도움을 줄 뿐만 아니라 <span class="underLine">피부의 면역을 정상화하는 데 도움을 주는 성분</span>이에요. 
      피부의 면역을 높여주어 염증을 줄이기 때문에 속 건조 해결에 도움이 되고, 피부 장벽을 구성하는 <span class="underLine">각질 세포의 생성에 관여해서 피부 장벽을 건강하게 만들어줍니다.</span> 
      비타민 D는 자외선을 받으면 피부에서 합성되기 때문에 야외활동 시 비타민 D가 합성되지만, 장시간 자외선을 쬐면 오히려 피부가 손상될 수 있으니 영양제로 보충하는 것이 좋습니다.
    </div>
    <div class="mt-4">
      항산화제를 복용하면 <span class="underLine">피부가 활성산소로 인해 손상되는 것을 예방해서 피부 건강에 도움</span>을 줄 수 있어요. 
      대표적인 항산화 비타민으로 <span class="highLight">비타민 C, 비타민 E</span>가 있는데, 이 두 영양소는 서로의 효과를 높이는 시너지 작용을 하기 때문에 같이 드시는 것이 좋습니다. 
      비타민 E는 혈액 순환을 돕고 모세혈관을 튼튼하게 하여 피부 수분과 탄력을 높여주기도 해요.
    </div>
    <div class="mt-4">
      그 외에도 <span class="highLight">비타민 A나 판토텐산(비타민 B5)</span>은 피지 분비를 정상화하여 염증을 완화하고 보습에 도움을 주며, <span class="highLight">비타민 B7인 비오틴</span>은 히알루론산의 흡수와 콜라겐의 생성을 도와서 피부를 촉촉하게 만들어 줍니다.
    </div>
  </div>
  <div class="paragraph">
      <div class="mt-5">
         <span class="para_title"><img src="<c:url value="/images/magazine_images/number/three_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
         맥주 효모, 스피루리나</span>
      </div>
      <div class="mt-4">
    	 <img src="<c:url value="/images/magazine_images/18/img_yellow12.png"/>" class="img-fluid" style="height: 300px;">
      </div>
	  <div class="mt-5">
	    <span class="underLine">건강한 피부를 위해서는 다양한 아미노산이 필요</span>하기 때문에, <span class="highLight">아미노산이 풍부한 맥주 효모나 스피루리나</span>와 같은 영양제를 먹으면 피부 건강과 탄력에 도움이 됩니다. 
	    맥주 효모의 경우에 아미노산 뿐만 아니라 비타민 B군도 풍부하기 때문에 전반적인 피부 건강에 도움이 되고 피부 염증 완화에도 효과적이에요.
	  </div>
  </div>
  <div class="paragraph">
      <div class="mt-5">
         <span class="para_title"><img src="<c:url value="/images/magazine_images/number/four_W.png"/>" class="img-fluid mb-2 mr-2" style="width:60px">
         히알루론산, 콜라겐</span>
      </div>
      <div class="mt-4">
    	 <img src="<c:url value="/images/magazine_images/18/img_yellow13.png"/>" class="img-fluid" style="height: 300px;">
      </div>
	  <div class="mt-5">
	    피부 영양제 하면 가장 먼저 떠오르는 두 가지가 <span class="highLight">히알루론산과 콜라겐</span>일 것 같아요. 
	    식약처에서는 히알루론산, 콜라겐을 비롯해 NAG, 알로에 겔 등이 ‘피부 보습에 도움을 줄 수 있다’고 기능성을 부여하고 있습니다. 
	    <span class="underLine">히알루론산은 수분을 머금어 피부 내부의 수분을 유지하도록 돕는 역할을 하고, 콜라겐은 피부 탄력을 유지하여 피부가 건강해지도록 해요.</span>
	  </div>
	  <div class="mt-4">
	    오메가3나 종합 비타민과 같은 영양제는 피부를 위해서도 좋지만 우리 몸의 전반적인 건강을 위해 꾸준히 먹으면 좋은 영양제라면, 여기에 추가로 피부 보습 영양제를 추가해서 촉촉한 피부를 위한 레시피를 완성해 보세요! <span class="underLine">히알루론산이나 콜라겐은 기능성을 인정받지 않은 일반 식품이나 음료인 제품도 많으니, 꼭 건강기능식품 인증 마크를 확인해 보세요!</span>
	  </div>
	  <div class="mt-5" style="font-weight: bold; font-size: 25px;">
	    건조한 피부를 방치하면 탄력이 떨어지고 주름이 깊어져 피부 노화로 이어질 수 있어요. 피부 건강 레시피로 환절기 건조함을 해결하고 피부 노화를 예방해 보아요!
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
