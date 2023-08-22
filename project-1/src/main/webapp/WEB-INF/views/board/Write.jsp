<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			background-color:#fc6124;
			border-radius: 20px;
		}
		.btn_deco{/*버튼색*/
			background-color:#FAEBD0;
		}
		.btn_deco_text{/*버튼 글자색*/
			color:#BCA77A;
		}
		.btn_update{/*등록버튼색*/
			background-color:#ff956c;
		}
		.btn_update_text{/*등록버튼글자색*/
			color:#FFFFFF;
		}
		.btn_align_right{/*등록,수정버튼 위치*/
			text-align: right;
		}
		.qna_mascot{
			width:40px;
			position:relative;
			border-radius: 50%;
			background-size:contain;
		}
		.qna_bbs{
			height:90px;
			padding-left:15px;
		}
		.card_font1{
			font-size:26px;
		}
		.card_font2{
			color: #EF605D;
		}
    </style>
</head>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
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
        
        <div class="container-fluid pt-3 mt-3">
            <div class="row d-flex flex-wrap align-content-stretch">
                <div class="d-flex col-3">
                </div>
                <div class="d-flex col-6 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="col">
                        <form method="post" action="/board/Write.do">
                            <div class="card_deco col-12 p-0 m-0">
	                            <div class="card-body p-2 m-3">
	                                <div class="form-group">
									  <label for="usr"><h3><kbd class="btn_deco btn_deco_text font-weight-bold">제목</kbd></h3></label>
									  <input type="text" id="usr" name="title" class="form-control form-control-lg" placeholder="제목을 입력하세요" >
									</div>
	                                <br>
	                                <div class="form-group">
									  <label for="comment"><h3><kbd class="btn_deco btn_deco_text font-weight-bold">질문 내용</kbd></h3></label>
									  <textarea id="comment" name="content" class="form-control form-control-lg" rows="5" placeholder="내용을 입력하세요" ></textarea>
									</div>
	                            </div>
	                        </div>
                            <div class="pt-2 pr-3 m-2 btn_align_right">
                            	<button type="submit" class="btn_update btn_update_text border-0 rounded" style="font-size:23px;">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="d-flex col-3 flex-wrap align-content-stretch pt-3 mt-3">
                </div>
            </div>
        </div>
    </main>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>