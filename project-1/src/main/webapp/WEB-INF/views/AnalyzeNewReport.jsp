<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<jsp:include page="/WEB-INF/views/template/Top.jsp"/>

<!-- top이랑 겹쳐서 주석처리(필요없으면 삭제하기)
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 -->
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
body{
	background-color: #fdfbf6;
}
    .effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .change-style{
      font-size:14px;
      cursor:pointer;
      border-radius: 15px;
      color:#9c9c9c;
      margin-left: 550px;
    }
    .change-style:hover {
      color: black;
      cursor: pointer;
      box-shadow: 2px 2px 5px gray;
    }
    .card {
      background-color: white;
      color: black;
      border-radius: 15px;
      cursor: pointer;
    }
    .card:hover {
      background-color:#ff4b4b;
      color: white;
      border-radius: 15px;
    }
    .card-checked {
      box-shadow: 0 0 0 3px #ff4b4b;
	  color: #ff4b4b;
	  border-radius: 15px;
    }
    .food-li {
      background-color: white;
      color: black;
      border-radius: 15px;
      flex: 0 0 25%;
      cursor: pointer;
    }
    .food-li:hover {
      box-shadow: 0 0 0 3px gray;
	  color: black;
	  border-radius: 15px;
    }
    .food-li-checked {
      box-shadow: 0 0 0 3px #ff4b4b;
	  color: #ff4b4b;
	  border-radius: 15px;
    }
    
    .check-effect-tag {
      color:#9e9e9e;
      background-color: white;
      cursor: pointer;
    }
    .check-effect-tags span:hover {
      color:#ff5924;
      background-color:#ffece5;
    }
    .check-effect-tag-select {
      color:#ff4b4b;
      background-color:#ffece5;
    }
    /*ts 스타일 공간*/
    .my-title {
    	position:relative;
    	background-image: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
    	background-repeat: no-repeat;
    	background-size: cover;
    	margin-top: 70px;
    }
    .tsanalyze {
    	display: flex;
    	flex-direction:column;
    	justify-content:center;
    	border-radius: 40px 40px 0px 0px;
		box-shadow: rgba(108, 108, 108, 0.15) 0px -1px 10px;
		margin-top: 50px;
    }
    .jumbotron {
    	background-color: #f6f6f6;
    	border-radius:15px;
    	width:100%;
    	height:120px; 
    	padding: 24px 20px;
    }
</style>
<body>
		<div class="container my-3" style="min-height: 880px; max-width: 920px; background-color: white; border-radius: 15px;">
			<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
				<div class="" style="font-size:32px; margin-left: 80px;"><span style="font-size:40px; color:#FDCDBC;">${UserName} </span> 님의 <br>영양제 분석 리포트</div>
			</div>
		    <!--Q1#-->
		    <div class="tsanalyze">
			    <form id="sendReportData" action="<c:url value="/analyzeMyReport.do"/>" method="post" onsubmit="preventSubmit(event)">
			    <div class="m-5" style="font-size:26px; font-weight: bold; margin-left: 50px;">${UserName}님의 영양제 관련 취향을 선택해주세요.</div>
					<div class="m-5 d-flex justify-content-around" style="flex-direction: column;">
					
						<div class="jumbotron">
							<div class="d-flex">
								<div class="effect-custom-font" style="font-size:20px;">섭취 목적</div>
								<div class="take-purpose-div">
			            			<span style="color:#ff4b4b; font-size:20px; font-weight: bold; margin-left: 20px;" class="take-purpose-span"></span>
			          			</div>
			          			<div id="take-purpose" class="effect-custom-font p-2 change-style">변경하기 →</div>
							</div>
			        		<div id="choose-purposes" class="mt-2" style="font-weight:bold; font-size:16px; color:#7B7B7B;"></div>
						</div>
						
				      	<div class="jumbotron">
							<div class="d-flex">
								<div class="effect-custom-font" style="font-size:20px;">선호 제형</div>
								<div class="effect-custom-font">
				           	 		<span class="prefer-shape-span" style="color:#ff4b4b; font-size:20px; font-weight: bold; margin-left: 20px;"></span>
				          		</div>
					       		<div id="prefer-shape" class="effect-custom-font p-2 change-style">변경하기 →</div>
							</div>
				       		<div id="choose-shapes" class="mt-2" style="font-weight:bold; font-size:16px; color:#7B7B7B;"></div>
						</div>
						
				      	<div class="jumbotron">
							<div class="d-flex">
								<div class="effect-custom-font" style="font-size:20px;">선호 유형</div>
								<div class="effect-custom-font">
						            <span class="prefer-type-span" style="color:#ff4b4b; font-size:20px; font-weight: bold; margin-left: 20px;"></span>
						        </div>
			        			<div id="prefer-type" class="effect-custom-font p-2 change-style">변경하기 →</div>	
							</div>
			        		<div id="choose-types" class="mt-2" style="font-weight:bold; font-size:16px; color:#7B7B7B;"></div>
						</div>
					</div>
				    <!--Q2#-->
				    <div class="question-2 mx-5 my-1 effect-custom-font">
				      <div style="font-size:26px; font-weight: bold;">현재 먹고 있는 영양제를 등록해보세요!
				      	<button class="btn btn-warning m-5 effect-custom-font" style="border-radius:15px;" id="search-myFood">영양제 검색하러 가기-></button>
				      </div>
				      <div class="jumbotron food-selected-list" style="height:500px;">
				        <ul class="list-unstyled d-flex"  style="flex-wrap: wrap;" id="last-choose-food-data">
				        
				        </ul>
				      </div>
				    </div>
			    	<!-- 분석하기 -->
			    	<div class="m-5">
			      		<button class="btn btn-danger" style="border-radius:15px; width:100%" id="analyze-myFood">분석하기</button>
			    	</div>
			    	<input type="hidden" name="takePurpose" id="takePurPose" value=""/>
			    	<input type="hidden" name="takeFood" id="takeFood" value=""/>
			   </form>
			</div>
		</div>


  <!-- modal 등록하기 : 선호 유형 -->
  <div class="modal fade" id="prefer-type-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-lg">
  		<div class="modal-content effect-custom-font">
  			<div class="modal-header m-5">
  				<h4 class="modal-title">💡 영양제를 선택할 때, 어떤점을 중요하게 생각하나요?</h4>
	          	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            	<span aria-hidden="true">&times;</span>
	          	</button>
  			</div>
  			<div class="ml-5" style="color:#545454">중복 선택이 가능합니다.</div>
  			<div class="modal-body p-2" style="height:200px;flex:1;">
  				<div class="check-effect-tags d-flex m-3" style="flex-wrap: wrap;">
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">비싸더라도 좋은 원료</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">가성비</span>
			    </div>
			    <div class="check-effect-tags d-flex m-3" style="flex-wrap: wrap;">
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">딱 한가지 핵심 원료만</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">관련 영양소를 한 번에</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">낱개 포장</span>
			    </div>
			    <div class="check-effect-tags d-flex m-3" style="flex-wrap: wrap;">
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">최대한 많은 양</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">딱 필요한 만큼만</span>
			        <span class="check-effect-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">하루 한번 만</span>
			    </div>
  			</div>
  			<div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	          <button type="button" class="btn btn-primary" id="save-prefer-type">저장하기</button>
	        </div>
  		</div>
  	</div>
  </div>
  
  
  
  <!-- modal 등록하기 : 선호 제형 -->
  <div class="modal fade" id="prefer-shape-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-lg">
      <div class="modal-content effect-custom-font">
        <div class="modal-header m-5">
	        <h4 class="modal-title">💡 어떤 제형을 선호하시나요?</h4>
          	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
            	<span aria-hidden="true">&times;</span>
          	</button>
        </div>
        <div class="ml-5" style="color:#545454">중복 선택이 가능합니다. (최대 3개)</div>
        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
        	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/과립.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">과립</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/바.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">바</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/분말.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">분말</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/시럽.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">시럽</h5>
	            </div>
          	</div>
        </div>
        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/액상.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">액상</h5>
	            </div>
          	</div>
        	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/정제.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">정제</h5>
	            </div>
          	</div>
        	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/젤리.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">젤리</h5>
	            </div>
          	</div>
          	<div class="card" style="width: 8rem;height:10rem;">
	            <img class="card-img-overlay m-auto" src="<c:url value="/images/shape/캡슐.png"/>" style="width:100px;height:100px;border-radius: 15px;">
	            <div class="card-body m-auto">
	              	<h5 class="card-title">캡슐</h5>
	            </div>
          	</div>  
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" id="save-prefer-shape">저장하기</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- modal 등록하기 : 섭취 목적-->
  <div class="modal fade" id="take-purpose-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
      <div class="modal-content effect-custom-font">
        <div class="modal-header m-5">
          <h4 class="modal-title">💡 영양제를 먹는 이유가 무엇인가요?</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="ml-5" style="color:#545454">중복 선택이 가능합니다. (최대 3개)</div>
        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/간 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">간 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/뼈 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">뼈 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/두뇌활동.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">두뇌활동</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/피부 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">피부 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈중 콜레스테롤.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">혈중 콜레스테롤</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/장 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">장 건강</h5>
            </div>
          </div>
        </div>

        <div class="modal-body d-flex flex-wrap p-4 justify-content-around" style="height:200px;">
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/눈 건강.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">눈 건강</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/면역 기능.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">면역 기능</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/수면.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">수면</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/혈액순환.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">혈액순환</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/운동 능력.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">운동 능력</h5>
            </div>
          </div>
          <div class="card" style="width: 8rem;height:10rem;">
            <img class="card-img-overlay m-auto" src="<c:url value="/images/health_img/체지방.png"/>" alt="Card image cap" style="width:100px;height:100px;border-radius: 15px;">
            <div class="card-body m-auto">
              <h5 class="card-title">체지방</h5>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" id="save-take-purpose">저장하기</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 내가 먹고 있는 영양제 검색 -->
  <div class="modal fade" id="take-foodList-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      	<div class="modal-content effect-custom-font">
        	<div class="modal-header">
          		<div class="search-bar ml-3" style="width:100%;">
          			<h5 class="modal-title p-3">💡 섭취중인 영양제를 등록해주세요
	          			<button type="button" class="close m-0" data-dismiss="modal" aria-label="Close">
			            	<span aria-hidden="true">&times;</span>
			          	</button>
		          	</h5>
          			<div class="input-group">
	      				<input id=searchText class="form-control" type="text" placeholder="브랜드명 혹은 제품명을 입력해주세요" style="border-radius:15px;background-color:#f6f6f6;width:100%;">
	          		</div>
	        	</div>
        	</div>
        	<div class="modal-body">
		        <div class="ml-5" style="min-height: 150px;">
		          <ul class="list-unstyled d-flex" id="searchFoodList" style="flex-wrap: wrap;">
		            <li class="food-li m-2" style="text-align: center;flex-basis: 100px;display:None">
		              <img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="width:150px;height:150px;border-radius: 15px;">
		              <div style="font-size: 15px; color: #939393;width:150px;"></div>
		            </li>
		          </ul>
	          	</div>
				<div class="mt-5 ml-3" style="min-height: 150px;" id="selected-foods">
				    <h5 class="modal-title mx-2" style="border-top: 1px solid gray;">내가 선택한 영양제 👇</h5>
				    <ul id="selected-food-list" class="list-unstyled d-flex" style="flex-wrap: wrap;"></ul>
				</div>
        	</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        		<button type="button" class="btn btn-primary" id="save-take-food">저장하기</button>
      		</div>
    	</div>
	</div>
  </div>

<script>

  $("#take-purpose").click(function(e){
    e.preventDefault();
    $('#take-purpose-modal').modal("show");
  });
  
  $("#prefer-shape").click(function(e){
	    e.preventDefault();
	    $('#prefer-shape-modal').modal("show");
  });
  
  $("#prefer-type").click(function(e){
	    e.preventDefault();
	    $('#prefer-type-modal').modal("show");
  });
  
  $('.check-effect-tags').children().click(function() {
      console.log($(this).html());
      $(this).toggleClass('check-effect-tag-select');
  });
  
  
// (내가선택한 영양제 목록 스크립트)
var selectedFoods = [];

// 영양제 선택 시 이벤트
$(document).on("click", ".food-li", function() {
  var selectedFoodName = $(this).find("div").text().trim();
  var selectedFoodImage = $(this).find("img").attr("src");

  // 객체에 영양제 이름과 이미지 URL 추가
  var foodObj = {
    name: selectedFoodName,
    image: selectedFoodImage
  };

  // 체크 여부 확인
  var isChecked = $(this).hasClass("checked");

  if (isChecked) {
    // 이미 선택되어 있던 영양제를 클릭하면 선택 해제
    // 배열에서 해당 영양제를 제거
    var index = selectedFoods.findIndex(function(food) {
      return food.name === selectedFoodName;
    });
    selectedFoods.splice(index, 1);
    $(this).removeClass("checked");

    // Remove the corresponding item from the selected list
    $("#selected-food-list li").each(function() {
      if ($(this).find("span").text().trim() === selectedFoodName) {
        $(this).remove();
        return false; // Break the loop after finding and removing the item
      }
    });
  } else {
    // 새로운 영양제를 선택할 경우 배열에 추가
    selectedFoods.push(foodObj);
    $(this).addClass("checked");

    // Add the selected item to the selected list
    var listItem = $("<li>").css("margin", "10px").css("box-shadow", "2px 2px 5px gray").css("border-radius", "15px");
    listItem.append($("<img>").attr("src", selectedFoodImage).css("width", "160px").css("height", "160px").css("border-radius", "15px"));
    listItem.append($("<br>"));
    listItem.append($("<span>").css("font-size", "13px").css("margin-left", "10px").text(selectedFoodName));
    $("#selected-food-list").append(listItem);
  }
});
  

  const ulDiv = document.querySelector('#searchFoodList');
	$( "#searchText" ).autocomplete({
	   source : function(request,response) {
		   $.ajax({
			   url: "<c:url value='/searchMyFood.do'/>",
			   data : { "searchWord" : $( "#searchText" ).val()},
		   }).done(function(searchFood) {
			   	var nameList = searchFood.map(function(item){return item['PRODUCTNAME'];});
			   	response(nameList);
			   	var imgList = searchFood.map(function(item){return item['IMGURL'];});
			   	while (ulDiv.childElementCount > 1) {
			   		ulDiv.removeChild(ulDiv.lastChild); // 마지막 자식 요소를 제거
			   	}
			   	searchFood.forEach(function(item) {
			   		var li = document.querySelector('.food-li').cloneNode(true);
			   		li.style.display = '';
			   		li.classList.replace('food-li-checked','food-li');
			   		if (item['IMGURL']===undefined) {
			   			item['IMGURL'] = 'http://localhost:9090/images/thumbnail_img/NO_IMG.jpeg';
			   		}
			   		li.querySelector('img').src = item['IMGURL'];
			   		li.querySelector('div').innerHTML = item['PRODUCTNAME'];
			   		ulDiv.appendChild(li);
			   	});
			   	
		   }).fail(function(error) {
			   	console.log(error);
		   });
	   }
	});

  
  $("#take-foodList-modal").on("shown.bs.modal", function() {
	    // 자동완성 기능 초기화
	    $("#searchText").autocomplete("option", "appendTo", "#take-foodList-modal");
  });
  $('#search-myFood').click(function(e) {
    e.preventDefault();
    $('#take-foodList-modal').modal("show");
  });

  
  
  $(document).on('click', '.food-li', function() {
	  console.log("asd");
    if($(this).hasClass("food-li")) {
      $(this).toggleClass("food-li-checked");
    }
  });

///////////////////////////////////////섭취목적
	  $("#take-purpose-modal .card").click(function(){
	    if($(this).hasClass("card")) {
	    	if ($(this).hasClass("card-checked") || $("#take-purpose-modal .card-checked").length < 3) {
	      $(this).toggleClass("card-checked");
	  	  }
	    }
	  });
 
	  let takePurPoses= Array();
	  $('#save-take-purpose').click(function() {
	    var takePurPose = document.querySelectorAll('#take-purpose-modal .card-checked');
	    takePurPoses = [];
	    for(var i=0; i<takePurPose.length;i++) {
	      console.log(takePurPose[i].querySelector(".card-title").innerHTML);
	      takePurPoses.push(takePurPose[i].querySelector(".card-title").innerHTML);
	    }
	    document.querySelector('#choose-purposes').innerHTML = takePurPoses;
	    document.querySelector(".take-purpose-span").innerHTML = takePurPoses.length;
	    $('#take-purpose-modal').modal('hide');
	  });

///////////////////////////////////////


///////////////////////////////////////선호제형
	  $("#prefer-shape-modal .card").click(function(){
	    if($(this).hasClass("card")) {
	    	if ($(this).hasClass("card-checked") || $("#prefer-shape-modal .card-checked").length < 3) {
	      $(this).toggleClass("card-checked");
	  		}
	    }
	  });

	  let preferShapes= Array();
	  $('#save-prefer-shape').click(function() {
	    var preferShape = document.querySelectorAll('#prefer-shape-modal .card-checked');
	    preferTypes = [];
	    for(var i=0; i<preferShape.length;i++) {
	      console.log(preferShape[i].querySelector(".card-title").innerHTML);
	      preferShapes.push(preferShape[i].querySelector(".card-title").innerHTML);
	    }
	    document.querySelector('#choose-shapes').innerHTML = preferShapes;
	    document.querySelector(".prefer-shape-span").innerHTML = preferShapes.length;
	    $('#prefer-shape-modal').modal('hide');
	  });


///////////////////////////////////////

//////////////////////////////////////선호 유형
 let preferTypes= Array();
  $('#save-prefer-type').click(function() {
    var preferType = document.querySelectorAll('.check-effect-tag-select');
    preferTypes = [];
    for(var i=0; i<preferType.length;i++) {
      console.log(preferType[i].innerHTML);
      preferTypes.push(preferType[i].innerHTML);
    }
    document.querySelector('#choose-types').innerHTML = preferTypes;
    document.querySelector(".prefer-type-span").innerHTML = preferTypes.length;
    $('#prefer-type-modal').modal('hide');
  });
  
//////////////////////////////////////



/*
  var takeFoods = Array();
  $('#save-take-food').click(function() {
    var takeFood = document.querySelectorAll('#searchFoodList .food-li-checked');
    var foodContainer = $('.food-selected-list ul');
    //$('.food-selected-list ul li').remove('li'); 
    $('#take-foodList-modal .food-li-checked').clone(true).appendTo(foodContainer);
    for(var i=0; i<takeFood.length;i++) {
      console.log(takeFood[i].querySelector("div").innerHTML);
      takeFoods.push(takeFood[i].querySelector("div").innerHTML);
    }
    $('#take-foodList-modal').modal('hide');
  });
 */
 var takeFoods = Array();
 $('#save-take-food').click(function() {
   var takeFood = document.querySelectorAll('#searchFoodList .food-li-checked');
   var foodContainer = $('.food-selected-list ul');

   // Get the existing food names in the foodContainer
   var existingFoodNames = foodContainer.find('span').map(function() {
     return $(this).text().trim();
   }).get();

   for (var i = 0; i < takeFood.length; i++) {
     var foodName = takeFood[i].querySelector("div").innerHTML;
     foodName = foodName.replace(/&amp;/g, '&');
     // Check if the food name already exists in the foodContainer
     if (existingFoodNames.indexOf(foodName) === -1) {
       console.log(foodName);
       takeFoods.push(foodName);

       // Get the selected food image URL
       var foodImage = takeFood[i].querySelector("img").getAttribute("src");

       // Append selected food with image to the list
       var listItem = $("<li>").css("margin", "10px");
       listItem.append($("<img>").attr("src", foodImage).css("width", "160px").css("height", "160px").css("border-radius", "15px"));
       listItem.append($("<br>"));
       listItem.append($("<span>").css({"font-size": "13px", "margin-left": "10px", "display ": "inline-block", "width": "150px","word-break": "break-word"}).text(foodName));
       foodContainer.append(listItem);
     }
   }
   $('#take-foodList-modal').modal('hide');
 });
 
//Handle click event on the displayed items to remove them
 $('.food-selected-list').on('click', 'li', function() {
   var foodName = $(this).find("span").text().trim();

   // Remove the item from the displayed list
   $(this).remove();

   // Remove the item from the takeFoods array
   var index = takeFoods.indexOf(foodName);
   if (index !== -1) {
     takeFoods.splice(index, 1);
   }
 });

  
  function preventSubmit(event) {
    event.preventDefault(); // 전송을 막는 메소드
  }
  $('#analyze-myFood').click(function() {
    document.querySelector("#takePurPose").value = takePurPoses;
    document.querySelector("#takeFood").value = takeFoods;
    console.log('takePurPoses :',takePurPoses);
    console.log('takeFoods :',takeFoods);
    let timerInterval;
    Swal.fire({
      title: '분석중입니다!',
      html: '<b></b> 초만 기다려주세요!',
      timer: 2000,
      timerProgressBar: true,
      didOpen: () => {
        Swal.showLoading()
        const b = Swal.getHtmlContainer().querySelector('b')
        timerInterval = setInterval(() => {
          b.textContent = Swal.getTimerLeft()
        }, 100)
      },
      willClose: () => {
        clearInterval(timerInterval);
        console.log(document.querySelector("#takeFood").value);
        console.log(document.querySelector("#takePurPose").value);
        document.querySelector("#sendReportData").submit();
      }
    }).then((result) => {
      /* Read more about handling dismissals below */
      if (result.dismiss === Swal.DismissReason.timer) {
        console.log('I was closed by the timer');
      }
    })
  });
  
//유효성 검사 코드 값이 없으면 버튼 비활성화
const analyzeButton = document.getElementById('analyze-myFood');

// take-purpose-span, prefer-shape-span, prefer-type-span 엘리먼트 선택
const takePurposeSpan = document.querySelector('.take-purpose-span');
const preferShapeSpan = document.querySelector('.prefer-shape-span');
const preferTypeSpan = document.querySelector('.prefer-type-span');

// #last-choose-food-data 요소 선택
const lastChooseFoodData = document.getElementById('last-choose-food-data');

// analyze-myFood 버튼 상태 업데이트 함수
function updateAnalyzeButtonState() {
  // take-purpose-span, prefer-shape-span, prefer-type-span의 내용을 가져옴
  const takePurpose = takePurposeSpan.textContent.trim();
  const preferShape = preferShapeSpan.textContent.trim();
  const preferType = preferTypeSpan.textContent.trim();

  // #last-choose-food-data의 자식 요소 개수 확인
  const foodItemCount = lastChooseFoodData.children.length;

  // take-purpose-span, prefer-shape-span, prefer-type-span, #last-choose-food-data 중 하나라도 빈 값인 경우
  if (takePurpose === '' || preferShape === '' || preferType === '' || foodItemCount === 0) {
    // analyze-myFood 버튼 비활성화
    analyzeButton.disabled = true;
  } else {
    // 모든 값이 채워진 경우 analyze-myFood 버튼 활성화
    analyzeButton.disabled = false;
  }
}

// analyze-myFood 버튼 상태 업데이트 함수 호출
updateAnalyzeButtonState();

// take-purpose-span, prefer-shape-span, prefer-type-span, #last-choose-food-data 내용 변경 감지 이벤트 리스너 추가
takePurposeSpan.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);
preferShapeSpan.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);
preferTypeSpan.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);
lastChooseFoodData.addEventListener('DOMSubtreeModified', updateAnalyzeButtonState);

</script>
	</body>
</html>