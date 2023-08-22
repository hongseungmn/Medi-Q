<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<title>MEDI Q</title>
</head>
<style>
	.qna_banner{
       	width:60%;
       	height:280px;
       	background-color:#FDCDBC;
		border-radius: 30px;
	}
	.qna_title{
		position:relative;
     	top:calc(100vh - 96vh);
     	left:10%;
     	color:white;
     	margin:0px;
     }
     .qna_img{
         position:absolute;
         width: 200px;
         top:calc(100vh - 85vh);
         right:25%;
     }
	.text_1{
		font-size:70px;
		font-weight:bold;
	}
	.text_2{
		font-size:30px;
		font-weight:bold;
	}
	.text_3{
		font-size:20px;
		font-weight:bold;
	}
	.card_deco{
		width: 92%;
	    display: block;
	    background: #FFFFFF;
	    border: 1px solid #E6E9ED;
	    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
	    border-radius: 20px;
	    text-align: left;
	}
	.card_deco_body{
		padding:0.5rem;
		background-color:#FFF1DC;
		border-radius: 20px;
	}
	.card_deco2_text{
		color:#BCA77A;
	}
	.btn_deco{
		background-color:#ff956c;
		box-shadow: 1px 1px 2px gray;
		border: none;
		color:white;
	}
	.btn_deco:hover {
		color:rgba(255,255,255,0.8);
	}
	.qna_mascot{
		width:40px;
		position:relative;
		border-radius: 50%;
		background-size:contain;
	}
	.qna_ans{
		height:90px;
	}
	.card_font1{
		font-size:26px;
	}
	.card_font2{
		color: #EF605D;
	}
	.list_btn{
		color:white;
		position:relative;
		left:850px;
	}
	.list_btn:hover{
		color:rgba(255,255,255,0.8);
	}
	.re_del_btn{
		position:absolute;
		right:500px;
	}
	.btn_help{
		width:120px;
		height:40px;
		font-size:20px;
		font-weight:bold;
		border-radius:15px;
	}
	.btn_wri_re{
		width:120px;
		height:35px;
		font-size:18px;
		font-weight:bold;
		border-radius:10px;
	}
	.btn_wri_del{
		width:80px;
		height:35px;
		font-size:18px;
		font-weight:bold;
		border-radius:10px;
	}
</style>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 메인 바디 부분 -->
<body>
	<main>
	    <div class="d-flex justify-content-center" style="padding-top:120px;">
	        <div class="qna_banner">
	            <div class="qna_title">
	                <p class="text_1 m-0">Q &amp; A</p>
	                <span class="text_2 m-0">답답했던 영양제의 모든 것!</span>
	            	<p class="text_2">전문가에게 물어보세요</p>
	            </div>
	            <img src="<c:url value="/images/qna/pharm.png"/>" class="qna_img">
			</div>
        </div>
        <!-- 게시판 시작 -->
	    <div class="container-fluid pt-5 mt-3">
	        <div class="row d-flex flex-wrap align-content-stretch">
	            <div class="d-flex col-3">
	            </div>
	            <!-- 게시판 가운데 부분 -->
	            <div class="d-flex col-6 flex-wrap flex-direction justify-content-center align-content-stretch">
	                <div class="col pb-5">
	                    <div class="row justify-content-center pt-3">
							<!-- 질문 출력 부분 -->
							<div class="card_deco col-12 pt-3 pr-4 pl-4 m-1">
	                            <div class="card-body p-2 mt-3 mb-2">
	                                <span class="card-title font-weight-bold card_font1"><span class="card_font2">Q.&nbsp;</span>${record.TITLE }</span>
	                                <br>
	                                <br>
	                                <p class="card-text"><h5>${record.CONTENT }</h5></p>
	                                <hr style="border: 1px solid #E6E9ED;"/>
	                                <span class="card-text"><h6 class="font-weight-bold text-muted">${record.NAME } ${record.AGE_GROUP} / ${record.GENDER}</h6></span>
	                                <p class="card-text"><h6 class="font-weight-bold text-muted">${record.POSTDATE }</h6></p>
	                            </div>
	                        </div>
	                        <br/>
	                        <div class="d-flex col-12 justify-content-end">
				        		<c:if test="${id eq record.ID}">
									<a href='<c:url value="/board/Edit.do?no=${record.NO}"/>'class="text-decoration-none text_3 pr-2">
										<button class="text-white btn_deco btn_wri_del">수정</button>
									</a> 
									<a href="javascript:isDelete();" class="text-decoration-none text_3">
										<button class="text-white btn_deco btn_wri_del">삭제</button>
									</a>
								</c:if> 
				        	</div>
	                        <br/>
	                        <div class="d-flex flex-wrap flex-direction justify-content-center" id="content_footer">
							</div>
	                    </div>
					</div>
	                <c:choose>
	                	<c:when test="${empty paramMap.CONTENT }">
			                <div class="card_deco col-12 p-1">
		                        <div class="card-body card_deco_body m-2" style="padding:.5rem;">
		                            <div class="card-text d-flex align-items-center">
		                            	<img src="<c:url value="/images/qna/pharmacist.png"/>" class="qna_mascot">
		                            	<span class="card_deco2_text font-weight-bold text_3 ml-2">메디큐 약사님의 답변입니다</span>
		                            </div>
		                        </div>
		                        <div class="card-body m-2">
		                        	<br>
		                        	<c:if test="${empty paramMap.CONTENT}" var="isEmpty">
										<div id="empty-comment">
											<div class="font-weight-bold">약사님의 답변을 기다리는 중입니다.</div>
										</div>
									</c:if>
			                    </div>
		                    </div>
                    	</c:when>
	                    <c:when test="${not empty paramMap.CONTENT }">                      
							<div class="card_deco col-12 p-1 answer-section"><!-- class 속성 answer-section으로 답변삭제시 태그들 아래 다 삭제 -->
					            <div class="card-body card_deco_body m-4" style="padding:.5rem;">
					                <div class="card-text d-flex align-items-center">
					                	<img src="<c:url value="/images/qna/pharmacist.png"/>" class="qna_mascot">
					                	<span class="card_deco2_text font-weight-bold text_3 ml-2">메디큐 약사님의 답변입니다</span>
					                </div>
					            </div>
				                <div class="card-body m-4">  
									<c:if test="${not empty paramMap }">
										<div>${paramMap.TITLE }</div>
								 		<span class="card-text"><h5>${paramMap.CONTENT}</h5></span><!-- 답변내용 -->
										<hr style="border: 1px solid #E6E9ED;"/>
										<p class="card-text"><h6 class="font-weight-bold text-muted">${paramMap.POSTDATE }</h6></p>
										<div class="card-text d-flex align-items-center">
											<button id="likeToggleBtn" class="btn_deco btn_help mr-3" data-answer-no="${paramMap.ANSWER_NO}">도움이 돼요</button>
											<span id="likeCountText" class="font-weight-bold" data-answer-no="${paramMap.ANSWER_NO}">0 명에게 도움이 됐습니다.</span>
										</div>
									</c:if>
				            	</div>
				            </div>
			            </c:when>
		            </c:choose>
				</div>
            </div>
            <div class="d-flex col-3 flex-wrap align-content-stretch">
            </div>
	        <div class="row pt-3 align-conten-center">
                <a class="d-flex justify-content-center col-1 btn_deco rounded-pill text_3 p-2 text-decoration-none list_btn" href="<c:url value="/board/List.do"/>">질문 목록</a>
                <div class="d-flex re_del_btn">
                	<!-- id가 관리자일때만 버튼이 보임 -->
                	<c:if test="${active eq 'A' }"><!-- member속성 ACTIVE 관리자('A')일때만 -->
						<c:choose>
							<c:when test="${empty paramMap.CONTENT}">
								<a href='<c:url value="/board/AnswerWrite.do?no=${record.NO}&title=${record.TITLE }"/>' class="text-decoration-none p-1">
									<button class="btn_deco btn_wri_re pr-2">답변작성</button>
								</a>
							</c:when>
							<c:when test="${not empty paramMap.CONTENT }">
								<a href='<c:url value="/board/AnswerEdit.do?NO=${record.NO}&title=${record.TITLE }"/>' class="text-decoration-none p-1">
									<button class="btn_deco btn_wri_re">답변수정</button>
								</a>
								<div class="text-decoration-none p-1">
									<button class="btn_deco btn_wri_re my-delete" data-answer-no="${paramMap.ANSWER_NO}">답변삭제</button><!-- my-delete속성으로 삭제기능 -->
								</div> 
							</c:when>
						</c:choose>
					</c:if>
                </div>

            </div>
	    </div>
	    <br/>
	</main>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>
<script>
	//질문글 삭제
	function isDelete(){
		if(confirm("삭제하시겠습니까?")){
			location.replace("<c:url value="/board/Delete.do?no=${record.NO}"/>");
		}
	}
	
	//답변글 삭제
	$(document).on('click','.my-delete',function() {
        if(confirm('답변글을 삭제하시겠습니까?')){
            var answerNo = $(this).data('answer-no');//data-answer-no="${paramMap.ANSWER_NO}"
            $.ajax({
                url: "<c:url value="/board/AnswerDelete.do"/>",
                type: 'DELETE',
                data: JSON.stringify({ 'answer_no':answerNo}),
                dataType: 'json',
                contentType: "application/json"
            }).done(function(data){
                console.log('삭제 성공:', data);
                alert('답변삭제 완료');
                $('.answer-section').remove();
                //페이지 재실행(ajax로 요청은 보냈으나 다시 리로드;;기능은 성공)
                window.location.href = "<c:url value="/board/View.do?no=${record.NO}"/>";
            });
        }
    });
    // 좋아요 버튼 클릭 이벤트 처리
    $(document).on('click','#likeToggleBtn',function () {
    	var postNo = $(this).data('answer-no');//data-answer-no="${paramMap.ANSWER_NO}"
        //confirm('좋아요을 누르시겠습니까?'+postNo);//114출력됨
        //console.log(postNo);//114출력됨
        $.ajax({
            url: "<c:url value="/like/Toggle.do"/>",
            type: 'POST',
            data: { no: postNo }, // 서버로 보낼 데이터를 객체 형태로 전달
            dataType: 'json',// 받아올 데이터 타입을 json으로 설정
        }).done(function(data){
        	console.log('좋아요 통신성공:',data);
        	//alert('좋아요 통신성공');
        	if(data ==-1){
        		alert('회원만 추천할 수 있습니다.'); // 회원이 아닌 경우 알림 보여주기
        	} else{
        		$('#likeCountText').text(data + '명에게 도움이 됐습니다.');
        	}
        });
    });
	
 	// 초기화 시 좋아요 개수 조회
    $(document).ready(function () {
        getTotalLikes();
    });
 	// 좋아요 개수 조회
    function getTotalLikes() {
        var getNo = $('#likeCountText').data('answer-no'); // data 속성에서 답변글 번호 가져오기 //data-answer-no="${paramMap.ANSWER_NO}"
        console.log("콘솔 체크용getNo값 확인:",getNo);//114출력 확인 
        $.ajax({
        	url: "<c:url value="/like/Count.do"/>",
            type: 'GET',
            data: { no: getNo }, // 서버로 보낼 데이터를 객체 형태로 전달
            dataType: 'json', // 받아올 데이터 타입을 json으로 설정
            contentType: "application/json"
        }).done(function(data){
            console.log('좋아요 개수 통신 성공:', data);
            //alert('좋아요 개수 통신 성공'+data);
            // 성공적으로 개수를 받아오면 업데이트
            $('#likeCountText').text(data + '명에게 도움이 됐습니다.');
        });
    }
</script>