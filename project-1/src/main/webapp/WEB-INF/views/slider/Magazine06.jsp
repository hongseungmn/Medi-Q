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
  	margin-top: 100px;
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
    background: #673AB7;
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
	width: 690px;
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
    background-color : #d1ecff;
  }
  .underLine {
    text-decoration : underline;
  }
  .para_title {
    color : #0097FF;
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
  <div class="jumbotron rounded-3" style="background-color: #87CEFA;">
     <div class="container">
    	<img src="<c:url value="/images/magazine_images/basic/search.png"/>" class="img-fluid" style="width:40px">
	    <span class="navbar-text" style="padding-left: 6px; color: #3373CC">영린이 탈출, 영양제 상식</span>
    	<h4><strong style="color:#191970; font-size:35px;">질 유산균의 원리부터 자주 묻는 질문까지 한 번에!</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
    질염은 ‘여성의 감기’라고 불릴 만큼 여성이 흔하게 겪는 질환인데, 일교차가 큰 환절기가 되면 면역력이 떨어져 자주 발생하게 됩니다.
    질염이 여성에게 워낙 흔하게 발생하는 만큼 질 건강을 관리하기 위해 <span style="background-color: #E1FFFF; font-size:28px;">‘질 유산균’</span>에 대해 알아보시는 것 같은데요. 
    질 유산균이 무엇인지부터 질 유산균과 관련해서 궁금해하는 부분까지 다 알려드릴게요!
  </div>
  
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/contract.png"/>" class="img-fluid mr-4" style="width:100px">
	<span style="font-size: xx-large; color: #F06292"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         질에 도달하여 질의 건강에 도움을 줄 수 있는 유산균을<br/> 
	         <span class="modalC">질 유산균이라고 해요.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 먹는 질 유산균은 질에 넣는다고 효과가 더 높지 않고<br/> 
			 <span class="modalC">안전하지도 않으니 질에 넣는 것은 금물!<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 남자는 질 유산균을 먹어도 특별한 이점이 없기 때문에<br/> 
		   	  <span class="modalC">장 건강에 특화된 유산균을 선택해보세요.</span></p>
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
      <span class="para_title"><img src="<c:url value="/images/magazine_images/basic/letter-q.png"/>" class="img-fluid mr-2 mb-3" style="width:55px">
      질염은 왜 생길까?</span>
    </div>
    <div class="mt-2">
       건강한 질에는 ‘락토바실러스(Lactobacillus)’라는 유익균이 균 전체의 90~95% 이상을 차지하고 있어요. 
       이는 질 내부를 pH 3.8~4.5 정도의 산성 상태로 유지해서 유해균으로 인한 감염을 막는 역할을 합니다. 그런데 면역력이 떨어지거나 
       질 세정제를 과다하게 사용하는 것과 같은 <span class="underLine">여러 원인에 의해서 질 내부의 산도가 변해 유해균의 증식이 늘고 질염에 걸릴 위험이 커지게 돼요.</span>
    </div>     
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/basic/letter-q.png"/>" class="img-fluid mr-2 mb-3" style="width:55px">
      질 유산균을 먹는 게 효과가 있나요?</span>
    </div>
    <div class="mt-4">
      <span class="underLine">여성이 유산균을 먹으면 일부가 항문을 지나 질에 도달하여 질 내에서 효과</span>를 내게 됩니다. 
      그중 질 건강 쪽으로 효과가 좋다고 알려진 균주로 구성한 유산균이 질 유산균이에요. 질 유산균을 먹고 나면 우리 몸속 여러 소화기관을 거쳐서 질까지 도달해야 해서 질에 도달하기까지는 3~5일 정도의 시간이 걸려요. 
      시간이 조금 걸리기는 하지만 <span class="highLight">먹는 유산균의 섭취로 질 건강에 도움을 줄 수 있다</span>는 연구 결과들이 많답니다.
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/basic/letter-q.png"/>" class="img-fluid mr-2 mb-3" style="width:55px">
      질에 직접 넣으면 되지 않을까?</span>
    </div>
    <div class="mt-3">
     결론부터 말씀드리면, <span class="highLight">먹는 질 유산균은 질에 넣으시면 안 됩니다.</span>
  	</div>
     <div class="mt-1">
    <span class="underLine">먹는 질 유산균의 경우에는 유산균 외에도 다양한 첨가제나 부형제들</span>이 들어있어요. 따라서 질에 넣는 것은 안전하지 않습니다.
  	</div>
    <img src="<c:url value="/images/magazine_images/06/img_sky1.png"/>" class="img-fluid">
  <div class="mt-3">
    질에 넣는 질정 형태의 유산균으로 ‘지노프로질정’이라는 약이 있기는 하지만 이는 질염을 치료하는 ‘약’입니다. 
    해당 의약품에는 유산균뿐만이 아니라 호르몬이 함께 들어있기 때문에 유산균을 넣는 목적으로 사용하는 것은 적절하지 않아요. 또한 전문의약품이기 때문에 반드시 처방이 필요하답니다.
  </div>
  <div class="mt-3">
    앞서 말한 것처럼 유산균을 입으로 먹는 것으로도 질 내부의 환경을 교정할 수 있으며, <span class="underLine">질에 유산균을 직접 넣는다고 해서 특별히 효과가 더 좋지 않다</span>고 보고되어 있으니 먹는 질 유산균은 꼭 정해진 용법에 맞춰 섭취해 주세요! 
    만약 질에 직접적으로 사용하는 질염 치료제를 사용하고 싶다면, 질 유산균이 아닌 항진균제 성분의 질정이나 질 세정액을 약국에서 상담 후 구입하시길 권해드려요.
  </div>
</div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title"><img src="<c:url value="/images/magazine_images/basic/letter-q.png"/>" class="img-fluid mr-2 mb-3" style="width:55px">
      질 유산균을 남자가 먹어도 되나요?</span>
    </div>
    <div class="mt-2">
       질 유산균 속에 있는 균주들이 장에도 효과가 있기 때문에 남성분들이 복용하셔도 문제는 없지만 <span class="highLight">‘굳이 먹을 필요가 없다’</span>고 하는 것이 정확할 것 같아요.
    </div>
    <div class="mt-2">
      ‘질 유산균이 여성의 질 건강에 도움을 준다면, 남자가 먹으면 전립선과 같은 남성 생식기에 효과가 있지 않을까?’ 하는 궁금증도 있을 수 있는데, 여성의 질과 다르게 <span class="underLine">남성 생식기에는 미생물이 살지 않기 때문</span>에 유산균 복용으로는 특별한 효과를 볼 수 없어요. 
      장 건강에 특화된 유산균을 구입하시길 추천해 드립니다.
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
