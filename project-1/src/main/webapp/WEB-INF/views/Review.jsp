<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
    .effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .check-take-time-tag {
      color:#9e9e9e;
      background-color: white;
      cursor: pointer;
      border:solid 2px #dbdbdb;
      border-radius: 15px;
      font-size:15px;
    }
    .check-take-time-tags span:hover {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }
    .check-take-time-tag-select {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }

    .check-effect-tag {
      color:#9e9e9e;
      background-color: white;
      cursor: pointer;
      border:solid 2px #dbdbdb;
      border-radius: 15px;
      font-size:15px;
    }
    .check-effect-tags span:hover {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }
    .check-effect-tag-select {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }

    .check-noEffect-tag {
      color:#9e9e9e;
      background-color: white;
      cursor: pointer;
      border:solid 2px #dbdbdb;
      border-radius: 15px;
      font-size:15px;
    }
    .check-noEffect-tags span:hover {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }
    .check-noEffect-tag-select {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }




    .bi-star-fill{
        font-size: 40px;
        line-height: 40px;
        color: #dfc230;
        cursor: pointer;
    }
    .bi-star {
      font-size: 40px;
      line-height: 40px;
      cursor: pointer;
    }
    .bi-star:hover {
      font-size: 40px;
        line-height: 40px;
        color: #dfc230;
    }

body{
	background-color: #fdfbf6;
}
#contentInfoCon {
    position: relative;
    height: 383px;
    display: flex;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
#contentInfoCon .content-sub-tit {
    font-size: 16px;
    color: #222;
    overflow: hidden;
}
#contentInfoCon .content-tit {
    color: #222;
    font-size: 45px;
    font-weight: 700;
    line-height: 1.36;
    letter-spacing: -0.02em;
    margin-top: 37px;
}
.visual-img-con {
	position:absolute;
	width:100%;
	height:100%;
    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_company.jpg") no-repeat;
    background-color: #fff;
    z-index: 1;
    top:70px;
	border:none;
}

.tsarea {
	position: absolute;
	width: 1000px;
	height: 250px;
	top:170px;
	left:50px;
	border:none;
	z-index: 2;
	text-align: center;
	box-shadow: 0px 0px 0px white;
	align-items: center;
}

.img-custom{
	margin-top: 150px;
	display: flex;
    align-items: center;
    justify-content: center;
}
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span><span style="color:#EF605D;">MEDI-Q</span> 리뷰작성</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">실제 섭취하는 유저들의 리뷰와 피드백으로 만든<br/> 가장 믿을만한 영양제</p>
            </h3>
        </div>
    </aside>
    

  <div class="container" style="min-height: 800px; max-width: 920px; background-color:white; margin-top:120px; border-radius: 20px;">
    
    <div class="img-custom">    
	    <c:if test="${empty listOne.imgURL}" var="emptyIMG">
	    	<img class="mt-5" src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="border-radius:20px;width: 250px;"/>
	    </c:if>
	    <c:if test="${not emptyIMG}">
	    	<img class="my-5" src="${listOne.imgURL}" style="border-radius:20px;width: 250px;"/>
	   	</c:if>
	   	
	   	<div class="ml-5">
	   		<div class="food-company" style="font-size: 20px; color: gray; font-weight: bold;">${listOne.company}</div>
			<div class="food-title" style="font-size: 30px; color: black; font-weight: bold;">${listOne.productName}</div>
		</div>
	</div>    
    
    <!-- 
    <div class="food jumbotron d-flex" style=" width:840px; margin-left:17px; background-color:#FDCDBC; border-radius: 20px;height:300px; margin-top: 50px;">
      <img src="${listOne.imgURL}" style="border-radius: 20px;width:200px;height: auto;"/>
      <div class="food-text m-5 effect-custom-font" style="font-size: 25px;">
        <div class="food-company" style="font-size: 26px; color: gray; font-weight: bold;">${listOne.company}</div>
        <div class="food-title" style="font-size: 40px; color: white; font-weight: bold;">${listOne.productName}</div>
      </div>
    </div>
     -->
    <div class="check-take-time effect-custom-font mx-3">
      <div style="font-size: 25px; ">영양제를 얼마나 드셨나요?</div>
      <div class="check-take-time-tags d-flex m-3">
        <span class="check-take-time-tag p-2 m-1">1개월 미만</span>
        <span class="check-take-time-tag p-2 m-1">1~3개월</span>
        <span class="check-take-time-tag p-2 m-1">3~6개월</span>
        <span class="check-take-time-tag p-2 m-1">6개월~1년</span>
        <span class="check-take-time-tag p-2 m-1">1년 이상</span>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5 mx-3">
      <div style="font-size: 25px;">영양제에 만족하셨나요?</div>
      <div class="check-rating-stars m-3">
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5 mx-3">
      <div style="font-size: 25px;">이 영양제를 먹고 일반적으로 느끼는 효과예요.<br/> 어떤 효과를 느꼈나요?</div>
      <div class="mt-3" style="font-size: 20px;color: #9e9e9e;">가장 많이 느낀 효과를 선택해 주세요. (최대 5개)<br>
        원하는 효과가 없을 경우 텍스트 후기에 남겨주세요!
      </div>
      <div class="check-effect-tags d-flex m-3">
        <span class="check-effect-tag p-2 m-1">효과가 없었어요</span>
        <span class="check-effect-tag p-2 m-1">감기 덜 걸림</span>
        <span class="check-effect-tag p-2 m-1">구내염 개선</span>
        <span class="check-effect-tag p-2 m-1">피로 개선</span>
        <span class="check-effect-tag p-2 m-1">피부상태 개선</span>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5 mx-3">
      <div style="font-size: 25px;">어떤 부작용이 있었나요?</div>
      <div class="mt-3" style="font-size: 20px;color: #9e9e9e;">가장 많이 느낀 부작용을 선택해 주세요. (최대 5개)<br></div>
      <div class="check-noEffect-tags d-flex m-3">
        <span class="check-noEffect-tag p-2 m-1">부작용이 없었어요</span>
        <span class="check-noEffect-tag p-2 m-1">변비</span>
        <span class="check-noEffect-tag p-2 m-1">설사</span>
        <span class="check-noEffect-tag p-2 m-1">어지러움</span>
        <span class="check-noEffect-tag p-2 m-1">두통</span>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5 mx-3">
      <div style="font-size: 25px;">영양제에 대한 상세한 후기를 들려주세요!</div>
      <textarea class="mt-3 jumbotron" style="width: 100%;border:solid 3px #dbdbdb;border-radius: 20px;" placeholder="영양제에 대한 솔직한 리뷰를 남겨주세요."></textarea>
    </div>
    <input type="hidden" value="${id}" id="userId">
    <input type="hidden" value="${listOne.no}" id="productNo">
	<button class="btn btn-warning effect-custom-font mb-5 d-flex align-items-center justify-content-center" id="sendDataButton" style="width:80%; margin-left: 85px; border-radius: 20px;">
	    <i class="bi bi-clipboard-check p-1" style="font-size:25px;"></i>
	    <span>작성 완료!</span>
    </button>
 </div>
  


  <script>

    $('.check-take-time-tags').children().click(function() {
      console.log($(this).html());
      $('.check-take-time-tags').children().removeClass('check-take-time-tag-select');
      $(this).addClass('check-take-time-tag-select');
    });


    $('.check-rating-star').click(function(e) {
      $('.check-rating-star').removeClass("bi-star-fill").addClass("bi-star");
        for(var i=0;i<=$(this).index();i++) {
          $('.check-rating-star').eq(i).removeClass("bi-star").addClass("bi-star-fill");
        }
    });



    $('.check-effect-tags').children().click(function() {
      console.log($(this).html());
      $(this).toggleClass('check-effect-tag-select');
    });

    $('.check-noEffect-tags').children().click(function() {
      console.log($(this).html());
      $(this).toggleClass('check-noEffect-tag-select');
    });

    



    $('#sendDataButton').click(function() {
      var takeTime = $('.check-take-time-tag-select').html();
      
      var starScore = $('.bi-star-fill').length;

      var effect = $('.check-effect-tag-select').map(function(index,data) {
        return data.innerHTML;
      });
      effect = effect.get();

      var noEffect = $('.check-noEffect-tag-select').map(function(index,data) {
        return data.innerHTML;
      });
      noEffect = noEffect.get();

      var content = $('textarea').val();
      
      
      console.log("starScore.length : ",starScore.length);
      console.log("effect : ",effect);
      console.log("noEffect : ",noEffect);
      console.log("content : ",content);
      $.ajax({
        url : "http://localhost:9090/WriteReview.do",
        contentType: "application/json; charset=utf-8;",
        method : 'post',
        data : JSON.stringify({
          "no" : $('#productNo').val(),
          "id" : $('#userId').val(),       
          "takeTime" : takeTime,
          "starScore" : starScore,
          "effect" : effect,
          "noEffect" : noEffect,
          "content" : content
        }),
        
      })
      .done(function(response) {
        Swal.fire({
          icon: 'success',
          title: '리뷰 저장 완료',
          showConfirmButton: false,
          timer: 1500
        })
        setTimeout(function() {
        	location.href = "/detail.do?no="+$('#productNo').val();
        }, 3000);
        
      })
      .fail(
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: '리뷰가 작성되지 않았어요!',
          timer: 3000
        })
      );
    });

  </script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>