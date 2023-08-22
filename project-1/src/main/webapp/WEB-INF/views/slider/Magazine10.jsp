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
	width: 920px;
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
    background-color : #BFEFFF;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #0060E5;
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
  <div class="jumbotron rounded-3" style="background-color: #BFE4FF;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">Health & Life</span>
    	<h4><strong style="color:#191970; font-size:35px;">생리 기간이 다가오면 우울하고 여기저기 아픈데 왜 그런 걸까요?</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    생리 기간도 아닌데 갑자기 감정의 기복이 심해지고 이유 없이 우울해지고, 배가 불편하거나 몸이 붓는 현상을 반복적으로 겪고 있나요?
  </div>
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/HealthLife.png"/>" class="img-fluid mr-2 mb-3" style="width:110px">
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
	         PMS란 생리 전에 신체적, 정신적인 다양한 불편한 증상들이 나타나는 것을<br/> 
	         <span class="modalC">의미합니다.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 PMS의 증상은 우울감, 불안과 같은 정서적 증상과 유방 압통, 근육통과 같은<br/> 
			 <span class="modalC">신체적 증상이 있어요.<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 PMS의 원인은 아직 확실하게 알려지지 않았지만 월경 주기와 관련된<br/> 
		   	  <span class="modalC">호르몬의 변화나 심리적, 사회적인 요소가 영향을 주는 것으로 알려져 있습니다.</span></p>
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
      <p><span class="para_title">월경전증후군</span> (Premenstrual Syndrome, <span style="color:#0060E5;">PMS</span>)</p>
    </div>
    <div class="mt-4">
      <span class="underLine">배란기 이후인 황체기에 일상생활을 방해할 정도의 신체적, 정신적인 증상이 반복적으로 나타나는 것</span>을<br/> 
      <span class="highLight">‘월경전증후군’</span>이라고 합니다. 
      흔히 premenstrual syndrome의 약자인 <span class="highLight">PMS</span>라고 말하기도 하고 생리전증후군이라고 부르기도 해요.
    </div>
    <div class="mt-4">
      월경전불쾌감장애(PreMenstrual Dysphoric Disorder, PMDD), 월경곤란징후(PreMenstrual Molimina) 등<br/>
      조금씩 기준이 다른 용어가 있기는 하나 일반적으로 월경전증후군이라는 용어가 사용됩니다.
    </div>
     <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/10/img_green1.png"/>" class="img-fluid">
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">PMS의 증상</span>
    </div>
    <div class="mt-4">
      월경전증후군의 증상은 사람마다 다양하게 나타나며, 크게 정신적 증상과 신체적 증상으로 나뉩니다.
    </div>
    <div class="mt-4">
      <img src="<c:url value="/images/magazine_images/number/one_W.png"/>" class="img-fluid mb-2 mr-2" style="width:40px">
      <strong>정신적 증상</strong>
    </div>
    <div class="mt-2">
      심한 감정 기복이 생기거나 우울증, 불안함, 예민함, 집중력 저하 등이 나타날 수 있어요. 때로는 갑작스러운 공격성이 나타나 가족이나 주변 사람에게 적개심을 느끼기도 합니다.
    </div>
    <div class="mt-5">
     <img src="<c:url value="/images/magazine_images/number/two_W.png"/>" class="img-fluid mb-2 mr-2" style="width:40px">
     <strong>신체적 증상</strong>
    </div>
    <div class="mt-2">
      신체적으로 유방 통증이나 두통, 몸이 붓는 증상, 속이 더부룩하고 복부가 빵빵한 느낌 등이 나타날 수 있어요. 또한 갑자기 짜거나 단 음식이 먹고 싶어지기도 해요. 
      수면과 관련해서 불면증이 생기거나 수면의 양이 갑자기 늘어나기도 합니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">PMS의 원인</span>
    </div>
    <div class="mt-3">
     월경전증후군의 원인은 명확하게 밝혀지지 않았지만 <span class="highLight">월경 주기에 따라 변하는 호르몬의 영향</span>이라고 알려져 있습니다. 
     또한 <span class="highLight">다양한 심리·사회적인 요소</span>에 의해서도 영향을 받을 수 있다고 추정하고 있어요.
    </div>
  </div>
   <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">
      <img src="<c:url value="/images/magazine_images/basic/check.png"/>" class="img-fluid mb-4" style="width:60px">
      PMS 자가 진단 체크리스트</span>
    </div>
    <div class="mt-2">
     마지막으로 월경전증후군과 관련된 두 가지 진단 기준을 보여드릴게요.<br/> 
     꼭 이러한 기준에 부합하지 않더라도 월경 전에 나타나는 증상들로 불편하다면 생활 습관을 개선하고 해결책을 찾는 것이 좋지만, 체크리스트를 통해서 본인의 증상을 확인해 보시면 좋을 것 같아요!
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/10/img_green2.png"/>" class="img-fluid">
    </div>
    </div>
    <div class="paragraph">
       <span class="underLine" style="color:#FF7C4C; font-size: 23px;"><strong>DSM-5의 월경전불쾌감장애 진단 기준</strong></span>
    <div class="mt-4">
     	 <img src="<c:url value="/images/magazine_images/number/a.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
     	 대부분의 월경 주기에서 월경 시작 1주 전에 다음의 증상 가운데 5가지(또는 그 이상)가 시작되어<br/> 
     	 <span class="ml-5">월경이 시작되고 수일 안에 증상이 호전되며 월경이 끝난 주에는 증상이 경미하거나 없어져야 한다.</span>
    </div>
    <div class="mt-4">
     	<img src="<c:url value="/images/magazine_images/number/b.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
     	다음 증상 중 적어도 한가지(또는 그 이상)는 포함되어야 한다.
     	<div class="ml-5 mt-3 mb-2">
	     	<p>
	          <img src="<c:url value="/images/magazine_images/number/one_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          현저하게 불안정한 기분(예: 갑자기 울고 싶거나 슬퍼진다거나 거절에 대해 민감해지는 것)
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/two_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          현저한 과미니성, 분노 또는 대인관계에서의 갈등 증가
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/three_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          현저한 우울 기분, 절망감 또는 자기비난의 사고
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/four_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          현저한 불안, 긴장, 신경이 곤두섬 또는 과도한 긴장감
	        </p>
        </div>
    </div>
    
    <div class="mt-4">
     	<img src="<c:url value="/images/magazine_images/number/c.png"/>" class="img-fluid mb-2 mr-1" style="width:40px"> 
     	다음 증상 중 적어도 한 가지(또는 그 이상)는 추가적으로 존재해야 하며,<br/>
     	<span class="ml-5">진단기준 B에 해당하는 증상과 더해져 총 5가지의 증상이 포함되어야 한다.</span>
     	<div class="ml-5 mt-3 mb-2">
	     	<p>
	          <img src="<c:url value="/images/magazine_images/number/one_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          일상 활동에서 흥미의 저하(예: 직업, 학교, 또래 집단, 취미)
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/two_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          집중하기 곤란하다는 주관적 느낌
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/three_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          기면, 쉽게 피곤함 혹은 현저한 무기력
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/four_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          식욕의 현저한 변화, 즉 과식 또는 특정 음식의 탐닉
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/five_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          과다수면 또는 불면
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/six_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          압도되거나 자제력을 잃을 것 같은 주관적 느낌
	        </p>
	        <p>
	          <img src="<c:url value="/images/magazine_images/number/seven_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
	          유방의 압통이나 부종, 두통, 관절통 혹은 근육통, 부풀어 오르거나<br/>
	          <span class="ml-5">체중이 증가된 느낌과 같은 다른 신체적 증상</span>
	        </p>
	        <p>
	        <span style="color:#FF7C4C; font-size: 23px;"><strong>주의점</strong></span> : 진단기준 A~C에 해당하는 증상이 전년도 대부분의 월경주기에 있어야 한다.
	     	</p>
     	</div>
    </div>
    <div class="mt-4">
     	<img src="<c:url value="/images/magazine_images/number/d.png"/>" class="img-fluid mb-2 mr-1" style="width:40px"> 
     	증상이 직업이나 학교, 일상적인 사회 활동과 대인관계를 현저하게 저해한다.<br/>
     	<span class="ml-5">(예: 사회활동의 회피, 직장이나 학교에서의 생산성과 효율성의 감소)</span>
    </div>
     <div class="mt-4">
     	<img src="<c:url value="/images/magazine_images/number/e.png"/>" class="img-fluid mb-2 mr-1" style="width:40px"> 
     	증상은 주요우울장애나 공황장애, 지속성 우울장애(기분저하증), 혹은 성격장애와 같은<br/>
     	<span class="ml-5">다른 장애로 인한 증상이 단순히 악화된 것이 아니다.(이러한 장애 중 어느 것에도 중첩되어 나타날 수는 있다)</span>
    </div>
     <div class="mt-4">
     	<img src="<c:url value="/images/magazine_images/number/f.png"/>" class="img-fluid mb-2 mr-1" style="width:40px"> 
     	진단기준 A는 적어도 연속적인 2회의 주기 동안 전향적인 일일평가에 의해 확인되어야 한다.<br/>
     	<span class="ml-5">(<span style="color:#FF7C4C; font-size: 23px;"><strong>주의점</strong></span> : 진단은 이러한 확인이 있기 이전에는 잠정적으로 내려질 수 있다)</span>
    </div>
     <div class="mt-4">
     	<img src="<c:url value="/images/magazine_images/number/g.png"/>" class="img-fluid mb-2 mr-1" style="width:40px"> 
     	증상은 물질(예: 남용약물, 치료약물, 기타 치료)의 생리적 효과나<br/> 
     	<span class="ml-5">다른 의학적 상태(예: 갑상선기능항진증)로 인한 것이 아니다.</span>
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="underLine" style="color:#FF7C4C; font-size: 23px;"><strong>미국산부인과학회(ACOG)의 월경전증후군 진단 기준</strong></span>
    </div>
    <div class="mt-4">
     <img src="<c:url value="/images/magazine_images/number/a.png"/>" class="img-fluid mb-2 mr-1" style="width:40px"> 
     정서 및 신체 증상이 최소 한 개 이상 있어야 한다.
    </div>
    <div class="mt-4">
      <img src="<c:url value="/images/magazine_images/number/b.png"/>" class="img-fluid mb-2 mr-1" style="width:40px"> 
      기간의 기준
      <div class="ml-5 mt-3 mb-2">  
        <p>
          <img src="<c:url value="/images/magazine_images/number/one_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
          생리 시작 전 5일 동안, 이전의 3회 생리주기에서 증상이 나타나야 한다.
        </p>
        <p>
          <img src="<c:url value="/images/magazine_images/number/two_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
          생리 시작 후 4일 이내에 증상이 사라져야 한다.
        </p>
        <p>
          <img src="<c:url value="/images/magazine_images/number/three_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
          생리 주기의 13일 이후에 재발해야 한다.
        </p>
        <p>
          <img src="<c:url value="/images/magazine_images/number/four_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
          향후 2회의 생리주기에서 같은 모습이 반복되어야 한다.
        </p>
        <p>
          <img src="<c:url value="/images/magazine_images/number/five_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
          어떠한 약물 복용(알콜 포함)의 영향 없이 증상이 나타나야 한다.
        </p>
        <p>
          <img src="<c:url value="/images/magazine_images/number/six_B.png"/>" class="img-fluid mb-2 mr-1" style="width:40px">
          사회적 또는 학업적 또는 직업적 영역에서 기능 저하를 보여야 한다.
        </p>
      </div>
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
