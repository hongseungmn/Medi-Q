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
    background: #00BFFF;
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
	width: 730px;
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
    color : #FF6347;
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
	    <span class="navbar-text" style="padding-left: 6px; color: #FF1493">영양제 팩트체크</span>
    	<h4><strong style="color:#8B008B; font-size:35px;">요즘은 텐텐으로 생리주기를 조절한다고 하던데…!?</strong></h4>
  	</div>
 </div>
  
  <div style="font-size:24px;" class="contentTop">
   약국에서 허락한 마약이라고 불리는 <span style="background-color: #EBEBFA; font-size:30px;">‘텐텐’</span><br/>
   어린 시절은 물론이고 성인이 되어서도 그 맛을 잊지 못해서 텐텐을 많이 찾는 것 같아요.
 	<div class="mt-4 mb-2">
      <img src="<c:url value="/images/magazine_images/07/img_blue1.jpg"/>" class="img-fluid">
  	</div>   
  	그런데 <span class="highLight">최근에 영양제 텐텐을 먹으면 생리가 빨라진다</span>는 말이 온라인상에서 퍼지면서 ‘생리를 앞당기고 싶은데 나도 텐텐을 먹어볼까’하는 경우가 있더라고요?
  </div>
 
  
  
   <div class="paragraph-title">
	<img src="<c:url value="/images/magazine_images/basic/notes.png"/>" class="img-fluid mr-4 mb-4" style="width:110px">
	<span style="font-size: xx-large; color: #FFA500"><strong>MEDI-Q의 1분 요약</strong></span>
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
	         비타민E를 과다 섭취할 경우 생리 주기나 생리량이<br/> 
	         <span class="modalC">변할 수 있어요.<br/></span></p>
	        <p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-2.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
			 하지만 텐텐에 들어간 비타민E는 아주 적은 양이기 때문에<br/> 
			 <span class="modalC">텐텐을 먹는다고 해서 생리 주기가 바뀔 확률은 아주 낮아요!<br/></span></p>
			<p class="modalB"><img src="<c:url value="/images/magazine_images/basic/number-3.png"/>" class="img-fluid mt-2 mr-2 ml-2 mb-3" style="width:40px">
		   	 8세 이상은 하루 4정, 8세 미만은 하루 2정을 지켜서<br/> 
		   	  <span class="modalC">먹는 것을 추천합니다!</span></p>
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
      <span class="para_title">생리 관련 주의 사항이 쓰여있어요.</span>
    </div>
    <div class="mt-5">
      <img src="<c:url value="/images/magazine_images/07/img_blue2.png"/>" class="img-fluid">
    </div>
    <div class="mt-4">
      실제로 텐텐의 주의사항에는 ‘이 약의 투여에 의하여 생리가 예정보다 빨라지거나 양이 점점 많아질 수 있으며, 출혈이 오래 지속될 수도 있다.’는 문구가 있어요.
    </div>
    <div class="mt-4">
      이는 텐텐 속에 들어있는 <span class="highLight">비타민E와 관련된 주의사항</span>인데요! 
      <span class="underLine">비타민E는 혈액이 뭉치는 것을 방해하기 때문에 과도하게 먹을 경우 생리 주기에 변화를 주거나 생리량이 증가할 수 있어요.</span> 
      따라서 텐텐뿐만 아니라 비타민E가 들어간 일반의약품에는 동일한 주의사항이 적혀있답니다.  
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">비타민E와 생리</span>
    </div>
    <div class="mt-4">
      <span class="underLine">국내 기준 비타민E의 성인 하루 상한 섭취량은 540mg</span>이에요. 
      그런데 <span class="underLine">텐텐에 함유된 비타민E의 함량은 5mg</span>에 불과해서 <span class="highLight">텐텐을 먹어서 생리 주기에 변화가 생길 만큼 과다해질 가능성은 너무 낮아요.</span> 
      텐텐을 그 정도로 많이 먹었다면 생리 주기 변화 외의 다른 부작용도 많이 생길 거예요.
    </div>
    <div class="mt-4">
       따라서 텐텐을 먹고 생리량이나 주기가 바뀌었다는 후기들은 텐텐을 먹어서 생긴 것이 아니라 생활습관 같은 다른 이유에서 발생했을 가능성이 높습니다. 
       생리 주기를 조절하고 싶다면 산부인과나 약국을 내원해서 올바른 방법에 따라 진행하시길 바라요!
    </div>
  </div>
  <div class="paragraph">
    <div class="mt-5">
      <span class="para_title">텐텐의 올바른 섭취량</span>
    </div>
  <div class="mt-4">
    앉은 자리에서 한 줄을 모두 까먹을 수 있을 만큼 중독성 있는 맛을 가진 텐텐이지만, 텐텐은 과자가 아닌 ‘일반의약품’이기 때문에 복용 방법을 지켜는 것이 좋아요.
  </div>
  <div class="mt-4">
    텐텐의 정해진 용법용량은<br/>
    <span class="highLight">만 8세 이상</span>은 <span class="underLine">1일 2회, 1회 2정</span><br/> 
    <span class="highLight">만 8세 미만</span>은 <span class="underLine">1일 2회, 1회 1정</span>이에요!<br/>
    (씹고 삼키는 것을 잘 할 수 있는 만 36개월 이상부터 먹는 것을 추천합니다.)
  </div>
  <div class="mt-5">
     물론 1~2정 더 먹는다고 심각한 부작용이 생기지는 않지만 맛있더라도 너무 많이 드시지 마시고 정해진 만큼만 먹도록 해주세요. 🙌
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
