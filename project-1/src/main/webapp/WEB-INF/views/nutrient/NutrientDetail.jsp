<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
        .container {
            margin-top: 80px;
        }
        
        .nav {
            display: flex;
            justify-content: space-between; 
            list-style: none;
        }
        
        .nav-item {
            padding-left: 2px;
            padding-right: 2px;
        }
        
        .nav-link {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 10px;
            flex-grow: 1;
            text-align: center;
        }
        
        .nav-link:hover {
            color: inherit;
            background-color: inherit;
        }
        
        .nav-link:hover::before {
            color: inherit;
            background-color: inherit;
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
            
        }
       
        .nav-link.active::before {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
        }
    
        .tab {
            display: none;
            padding: 0 20px 20px 20px;
            border: 1px solid #ddd;
            border-top: none;
        }
        
        .tab.active {
            display: block;
        }

        .box-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .box {
            width: 110px;
            height: 110px;
			box-shadow: 0px 0px 7px rgba(0, 0, 0, 0.4);
        	transition: box-shadow 0.3s ease;
            border: 1px solid #ddd;
            border-radius: 10px 10px 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            position: relative;
            margin: 17.8px; /*배치되는 div 크기 맞추기*/
        }

        .box a {
            color: black;
            text-decoration: none;
        }

        .box:hover {
            font-weight: bold;
            box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.4);
        }

        .box.active {
            background-color: #bbb;
        }

        /*프로그레스 바*/
        .progress {
        	margin-top: -7px;
            width: 100%;
            height: 30px;
            background-color: #fcf8e3;
            position: relative;
            overflow: hidden;
            border: solid 1px;
        }

        .progress-bar-inner {
            position: absolute;
            top: 0;
            left: 0;
            width: 0%;
            height: 100%;
            background-color: rgb(253, 186, 41);
            animation: fillProgress 1.5s linear forwards;
        }
        .progress-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black;
            font-weight: bold;
        }

        
        /* 이미지 추가 */
		.image {
			position: relative;
			display: flex;
	        justify-content: center;
	        align-items: center;
			
		}
		
		.bj-img {
			border-radius: 10px 10px 10px 10px;
		}
		
		
		.image .text {
			position: absolute;
			top: 40px;
		 	font-weight: bold;
			color: black;
		}
        
		/*아래방향 화살표*/
		.arrow-down {
			width: 0;
	    	height: 0;
			border-left: 7px solid transparent;
			border-right: 7px solid transparent;
			border-top: 7px solid black;
		}

		/* 관련 영양제 뿌려주기 */
	    .scrollable-container {
	        /*height: 750px;   스크롤 가능한 컨테이너의 높이 */
	        overflow-y: auto;  /* 세로 스크롤바 표시 */
	    }
	
	    .nutrient-item {
	        padding: 10px;
	        border-bottom: 1px solid #ccc;  /* 각 영양소 항목의 아래 경계선 설정 */
    	}
    	
    	/* WebKit 스크롤바 스타일링 */
	    .scrollable-container::-webkit-scrollbar {
	        width: 8px;  /* 스크롤바 너비 */
	        height: 4px;
	    }

		.scrollable-container::-webkit-scrollbar-thumb {
	        background-color: rgb(253, 186, 41);  /* 스크롤바 썸네일 배경색 */
	        border-radius: 4px;  /* 스크롤바 썸네일 모서리 반경 */
	    }
		
	    .scrollable-container::-webkit-scrollbar-track {
	        background-color: #f1f1f1;  /* 스크롤바 트랙 배경색 */
	        border-radius: 4px;  /* 스크롤바 트랙 모서리 반경 */
	    }
	    
	    .scrollable-container::-webkit-scrollbar-thumb:hover {
		    background-color: #dc3545;  /* 스크롤바 썸네일 배경색 (호버 상태) */
		}
		
		/* 검색창 스타일 추가 */
		.search {
		  display: flex;
		}
		
		.searchTerm {
		  border-right: none;
		  padding: 5px;
		  height: 64px;
		  border-radius: 32px;
		  outline: none;
		  /*border: 3px solid #EF605D;*/
		}
		
		.searchTerm:focus{
		  color: black;
		}
		
		.searchButton {
		  width: 124px;
		  height: 64px;
		  /*border: #EF605D;*/
		  background: #EF605D;
		  text-align: center;
		  color: #fff;
		  border-radius: 32px;
		  cursor: pointer;
		  font-size: 20px;
		}
		
		/* 인기 검색어 */
		.s-txt1 {
		    height: 42px;
		    line-height: 42px;
		    font-weight: 700;
		    font-size: 18px;
		    float: left;
		    color: #787E8B;
		    padding-right: 20px;
            margin-left: 20px;
		}
		
		.search-keyword{
			float: left;
		    height: 42px;
		    line-height: 42px;
		    display: inline-block;
		    background: #F4F6FA;
		    border-radius: 21px;
		    font-weight: 500;
		    color: #787E8B;
		    font-size: 18px;
		    padding: 0px 15px;
		    margin-left: 20px;
		    text-decoration: none;
		    cursor: pointer;
		}
		
		.search-keyword:hover {
			text-decoration: none;
			color: #787E8B;
		}
		
	/*상단 배너 스타일*/
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
    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_rnd.jpg") no-repeat;
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
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
        <!-- 브랜드 스토리 -->
        <div class="visual-img-con animatedleft"></div>	
        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span style="font-family: 'Pretendard';">
	                <span style="color:#EF605D; font-weight: 700;">MEDI-Q</span>
	                영양소 찾아보기</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">식품의약품안전처에서 제공한 올바른 정보를 확인해보세요!</p>
            </h3>
        </div>
    </aside>

    <div class="container pb-5" style="margin-top: 100px;">
        <div>
            <ul class="nav">
                <li class="nav-item col-3">
                    <a style="font-size: 18px; cursor: pointer;" class="nav-link active" onclick="openTab(event, 'popular')">인기 영양소</a>
                </li>
                <li class="nav-item col-3">
                    <a style="font-size: 18px; cursor: pointer;" class="nav-link" onclick="openTab(event, 'vitamin')">비타민</a>
                </li>
                <li class="nav-item col-3">
                    <a style="font-size: 18px; cursor: pointer;" class="nav-link" onclick="openTab(event, 'mineral')">미네랄 및 기타영양소</a>
                </li>
                <li class="nav-item col-3">
                    <a style="font-size: 18px; cursor: pointer;" class="nav-link" onclick="openTab(event, 'functional')">기능성 원료</a>
                </li>
            </ul>
        </div>
        <div class="tab pt-1 pb-5" style="display:block; border:0px;">
            <div class="active border-0 text-center" style="padding-top:20px">
            	<!-- 조회수 -->
            	<div class="d-flex justify-content-end">
            		<span class="badge badge-warning" style="width: 130px;">
           				<span style="font-size:16px; color:black; text-decoration: none;">&nbsp;조회수: ${n_view }${i_view }&nbsp;</span>
           			</span>
            	</div>
                <!-- 이미지 -->
                <div class="image mt-2">
	                <img class="bg-img w-100" style="height:200px" src="<c:url value="/images/nutrient_img/bg_nt.png"/>"/>
	                <div class="text" style="color: black; margin-top:22px;">
		           		<b style="font-size: 30px;">💊&nbsp;${title_name}</b><br/>
		           		<small>궁금했던 모든 것, 바로 확인해보세요!</small>
                	</div>
    			</div>
            </div>
            <div class="d-flex justify-content-center">
                <div id="outer" class="d-flex justify-content-center mt-4 pt-4 pb-5 w-100"><!-- style="border: #ddd solid; border-radius: 10px;" -->
                    <div id="inner" class="w-75 ">
                        <div class="">
                            <h4 style="margin-left: 8%;"><b>1. 관련 건강고민</b></h4>
                            <hr class="bg-warning" style="margin-bottom: 35px;">
                            <c:forEach var="n_func" items="${n_FUNC }" varStatus="loop">
    							<span class="text-center" style="font-size: 15px; display: inline-block; width: 260px;"><mark>&nbsp;${loop.count}) ${n_func}&nbsp;</mark></span>
    							<c:if test="${(loop.count % 3 == 0) && !loop.last}">
    								<hr/>
    							</c:if>
                            </c:forEach>
                            <c:forEach var="i_func" items="${i_FUNC }" varStatus="loop">
    							<span class="text-center" style="font-size: 15px; display: inline-block; width: 260px;"><mark>&nbsp;${loop.count}) ${i_func}&nbsp;</mark></span>
                            	<c:if test="${(loop.count % 3 == 0) && !loop.last}">
    								<hr/>
    							</c:if>
                            </c:forEach>
                        </div>
                        <div class="mt-5">
                            <h4 style="margin-left: 8%;"><b>2. 상세설명</b></h4>
                            <hr class="bg-warning" style="margin-bottom: 35px;">
                            <div class="d-flex justify-content-center">
                            <c:if test="${not empty desc }">
	                            <p style="font-size: 15px; width: 83%;">${desc }</p>
	                        </c:if>    
	                        <c:if test="${not empty i_desc }">
	                            <p style="font-size: 15px; width: 83%;">${i_desc }</p>
	                        </c:if>    
                            </div>
                        </div>
                        <div class="mt-4">
                            <h4 style="margin-left: 8%;"><b>3. 섭취량</b></h4>
                            <hr class="bg-warning" style="margin-bottom: 35px;">
                            <div class="justify-content-center">
                                <div class="d-flex flex-column align-items-center pb-4">
                                
                                <!-- 5대 상한 있음 -->
	                            <c:if test="${not empty n_UL_M }" var="limit">
                        	        <c:if test="${not empty n_UL_M}">
		                            <div style="font-size: 13px; margin-bottom: 18px; width: 80%" class="mt-2">
	                                		<span style="margin-left:20%;  margin-right: 14%;">남성 권장 섭취량: ${n_DRI_M }</span>
	                                	<c:if test="${not empty n_UL_M}">
	                                		<span>남성 상한 섭취량: ${n_UL_M }</span><br/>
	                                	</c:if>
		                                	<span style="margin-left:20%;  margin-right: 14%;">여성 권장 섭취량: ${n_DRI_F }</span>
		                                <c:if test="${not empty n_UL_F}">
		                                	<span>여성 상한 섭취량: ${n_UL_F }</span><br/>
		                                </c:if>
	                                
		                                <div style="height:1px; margin-top: 12px;">
		                                	<span class="arrow-down" style="margin-left: 30%;"></span>
		                                	<span class="arrow-down" style="margin-left: 37%;"></span>
		                                </div>
		                            </div>
		                            <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
		                            </c:if>
	                            </c:if>
	                            
	                            <!-- 5대 상한 없음 -->
	                            <c:if test="${not limit && empty i_DRI}">
		                            <p style="font-size: 13px; margin-bottom: 13px;" class="mt-2">
	                                	남성 권장 섭취량: ${n_DRI_M }<br/>
		                                여성 권장 섭취량: ${n_DRI_F }<br/>
		                                <div style="height:1px;">
		                                	<span class="arrow-down"></span>
		                                </div>
	                                </p> 
	                                <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
	                            </c:if>
	                            
	                            <!-- 기능성 상한 있음 -->
	                            <c:if test="${not empty i_DRI && not empty i_UL }">
		                            <div style="font-size: 13px; margin-bottom: 18px; width: 80%" class="mt-2">
	                                	<span style="margin-left:24%;  margin-right: 20%;">권장 섭취량: ${i_DRI }</span>
	                                	<span>상한 섭취량: ${i_UL }</span><br/>
		                                <div style="height:1px; margin-top: 12px;">
		                                	<span class="arrow-down" style="margin-left: 30%;"></span>
		                                	<span class="arrow-down" style="margin-left: 37%;"></span>
		                                </div>
		                            </div>
		                            <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
                            	</c:if>
	                            
	                            <!-- 기능성 상한 없음 -->	
	                            <c:if test="${not empty i_DRI && empty i_UL }">
		                            <p style="font-size: 13px; margin-bottom: 13px;" class="mt-2">
		                                	권장 섭취량: ${i_DRI }<br/>
		                                <div style="height:1px;">
		                                	<span class="arrow-down"></span>
		                                </div>
		                            </p>
		                            <div class="progress w-75 progress-bar text-danger" > 
	                                    <div class="progress-bar-inner"></div>
	                                    <div class="progress-text"></div>
	                                </div> 
                            	</c:if>
                            	
	                            </div>
                            </div>
                        </div>
                        <c:if test="${not empty n_DRI_M }" var="vit"></c:if>
                        <c:if test="${vit }">
	                        <div style="margin-top: 60px;">
		                        <c:if test="${not empty n_LACK }">
		                            <h4 style="margin-left: 8%;"><b>4. 결핍시 증상</b></h4>
                            		<hr class="bg-warning" style="margin-bottom: 35px;">
		                            <div class="d-flex justify-content-center">
		                            	<p style="font-size: 15px; width: 83%;"><span style="font-size: 20px;">🔻</span> ${n_LACK }이 있어요.</p>
		                            </div>
		                        </c:if>
	                        </div>
                        </c:if>
                        <c:if test="${vit }">
                        	<c:if test="${not empty caution }">
		                        <div class="mt-5">
		                            <h4 style="margin-left: 8%;"><b>5. 주의사항</b></h4>
                            		<hr class="bg-warning" style="margin-bottom: 35px;">
		                            <div class="d-flex justify-content-center">
		                            	<p style="font-size: 15px; width: 83%;">${caution }</p>
		                            </div>	
		                        </div>
		                    </c:if>
                        </c:if>
                        <c:if test="${not vit }">
                            <c:if test="${not empty i_caution }">
		                        <div class="mt-5">
		                            <h4 style="margin-left: 8%;"><b>4. 주의사항</b></h4>
		                            <hr class="bg-warning" style="margin-bottom: 35px;">
		                            <div class="d-flex justify-content-center">
		                            	<p style="font-size: 15px; width: 83%;">${i_caution }</p>
		                            </div>
		                        </div>
		                    </c:if>
                        </c:if>
                        <c:if test="${vit }">
	                        <div class="mt-4">
		                        <c:if test="${not empty caution}" var="exist">
		                            <h4 style="margin-left: 8%;"><b>6. 섭취 음식</b></h4>
		                            <hr class="bg-warning" style="margin-bottom: 35px;">
		                            <div class="d-flex justify-content-center">
		                            	<p style="font-size: 15px; width: 83%;"><span style="font-size: 20px;">✔</span> ${n_FOOD }에서 섭취할 수 있어요.</p>
		                            </div>
		                        </c:if>
		                        <c:if test="${not exist }">
		                        	<h4 style="margin-left: 8%;"><b>5. 섭취 음식</b></h4>
		                            <hr class="bg-warning" style="margin-bottom: 35px;">
		                            <div class="d-flex justify-content-center">
		                            	<p style="font-size: 15px; width: 83%;"><span style="font-size: 20px;">✔</span> ${n_FOOD }에서 섭취할 수 있어요.</p>
		                            </div>
		                        </c:if>
	                        </div>
	                    </c:if>
	                    <!-- 5대 영양소 -->
	                    <c:if test="${vit }">
	                        <div class="mt-5">
		                        <c:if test="${not empty caution}" var="exist">
		                            <h4 style="margin-left: 8%;"><b>7. 추천 영양제</b></h4>
		                        </c:if>
		                        <c:if test="${not exist }">
		                        	<h4 style="margin-left: 8%;"><b>6. 추천 영양제</b></h4>
		                        </c:if>
		                            <hr class="bg-warning" style="margin-bottom: 35px;">
		                            <c:forEach var="productInfo" items="${n_productInfoList}" varStatus="loop">
		                            <c:if test="${loop.count == 1 && n_productInfoList.size() != 0 }">
		                            	<p class="text-center pt-4" style="font-size: 17px;"><b>'${param.name}'을(를) 포함하고 있는 영양제 Top ${n_productInfoList.size()}에요!</b></p>
		                            </c:if>
		                            <p style="font-size: 15px;">
		                                <div class="scrollable-container">
										    <div class="box-container justify-content-center">
										    	
										    	<!-- 이미지 있는 경우 우선 가져옴 -->
											    <c:if test="${not empty productInfo.PRODUCTNAME}" var="first">
													<div class="box" style="white-space: nowrap; width:85%;" onclick="location.href='/detail.do?no=${productInfo.NO}'">
					    								<c:if test="${loop.count == 1}">
															<b class="text-center" style="width:150px; font-size: 15px;">🥇 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 2}">
															<b class="text-center" style="width:150px; font-size: 15px;">🥈 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 3}">
															<b class="text-center" style="width:150px; font-size: 15px;">🥉 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 4}">
															<b class="text-center" style="width:150px; font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp; ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 5}">
															<b class="text-center" style="width:150px; font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp; ${loop.count }위</b>
														</c:if>
														
												    	<!-- imgurl 있으면 가져옴 -->
												    	<c:if test="${productInfo.IMGURL != null }" var="existimg">
												        	<img src="${productInfo.IMGURL}" alt="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="width: 100px; height: 100px;">
												        </c:if>
												        <!-- imgurl 없으면 대체이미지 -->
												        <c:if test="${not existimg }">
 													        <img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="width: 100px; height: 100px;">
												        </c:if>
												        
												        <b class="text-center" style="font-size: 13px; width: 300px;">&nbsp;${productInfo.PRODUCTNAME}</b>
												    </div>
											    </c:if>
											</div>
										</div>  
									</p>
									</c:forEach>   
	                            <c:if test="${n_productInfoList.size() == 0 }">
	                            	<p class="text-center pt-4" style="font-size: 17px;"><b>'${param.name}'을(를) 포함하고 있는 등록된 영양제가 없어요.😓<br/><small>한국 식품의약품안전처에서 검증된 원료인지 확인해주세요!</small></b></p>
	                            </c:if> 
	                        </div>
	                    </c:if>
	                    <!-- 기능성 원료인 경우 -->
	                    <c:if test="${not vit }">
		                    <div class="mt-5">
		                    	<c:if test="${empty i_caution }">
		                    		<h4 style="margin-left: 8%;"><b>4. 추천 영양제</b></h4>
		                    	</c:if>
		                    	<c:if test="${not empty i_caution }">
		                    		<h4 style="margin-left: 8%;"><b>5. 추천 영양제</b></h4>
		                    	</c:if>
	                            <hr class="bg-warning" style="margin-bottom: 35px;">
	                            <c:forEach var="productInfo" items="${i_productInfoList}" varStatus="loop">
	                            <c:if test="${loop.count == 1 && i_productInfoList.size() != 0 }">
	                            	<p class="text-center pt-4" style="font-size: 17px;"><b>'${param.name}'을(를) 포함하고 있는 영양제 Top ${i_productInfoList.size()}에요!</b></p>
		                        </c:if>    
		                            <p style="font-size: 15px;">
		                                <div class="scrollable-container">
										    <div class="box-container justify-content-center">
										    	<!-- 이미지 있는 경우 우선 가져옴 -->
											    <c:if test="${not empty productInfo.PRODUCTNAME}" var="first">
													<div class="box" style="white-space: nowrap; width:85%;" onclick="location.href='/detail.do?no=${productInfo.NO}'">
					    								<c:if test="${loop.count == 1}">
															<b class="text-center" style="width:150px; font-size: 15px;">🥇 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 2}">
															<b class="text-center" style="width:150px; font-size: 15px;">🥈 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 3}">
															<b class="text-center" style="width:150px; font-size: 15px;">🥉 ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 4}">
															<b class="text-center" style="width:150px; font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp; ${loop.count }위</b>
														</c:if>
														<c:if test="${loop.count == 5}">
															<b class="text-center" style="width:150px; font-size: 15px;">&nbsp;&nbsp;&nbsp;&nbsp; ${loop.count }위</b>
														</c:if>
														
												    	<!-- imgurl 있으면 가져옴 -->
												    	<c:if test="${productInfo.IMGURL != null }" var="existimg">
												        	<img src="${productInfo.IMGURL}" alt="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="width: 100px; height: 100px;">
												        </c:if>
												        <!-- imgurl 없으면 대체이미지 -->
												        <c:if test="${not existimg }">
 													        <img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" style="width: 100px; height: 100px;">
												        </c:if>
												        
												        <b class="text-center" style="font-size: 13px; width: 300px;">&nbsp;${productInfo.PRODUCTNAME}</b>
												    </div>
											    </c:if>
											</div>
										</div>  
									</p>
								</c:forEach>   
								<c:if test="${i_productInfoList.size() == 0  }">
	                            	<p class="text-center pt-4" style="font-size: 17px;"><b>'${param.name}'을(를) 포함하고 있는 등록된 영양제가 없어요.😓<br/><small>한국 식품의약품안전처에서 검증된 원료인지 확인해주세요!</small></b></p>
	                            </c:if>
	                        </div>
	                    </c:if>	
                    </div>
                </div>
            </div>
        </div>
        
        	<!-- 탭 이동처리 -->
       		<div id="popular" class="tab border-0">
                <!-- 인기성분에 해당하는 상자 내용 -->
                <!-- 이미지 -->
   				<div class="image mt-4">
	                <img class="bg-img w-100" style="height:200px" src="<c:url value="/images/nutrient_img/bg_nt.png"/>"/>
	                <div class="text text-color:black text-center" style="margin-top:22px;">
		           		<b style="font-size: 30px;">👨‍⚕&nbsp;인기 성분 TOP 10</b><br/>
		           		<small>100가지 영양성분 중 가장 인기있는 10개 성분의 Best 제품을 만나보세요!</small>
                	</div>
    			</div>
    			<!-- 검색창 -->
				<div class="d-flex justify-content-center">
					<div class="search d-flex justify-content-center" style="padding: 50px 0px 20px; position: relative; width: 960px;">
					    <input id="searchInput" style="font-size:20px; width: 100%;" type="text" class="searchTerm text-center" placeholder="어떤 영양소를 찾고 계신가요?‍"/>
					    <button type="submit" class="searchButton" style="position: absolute; right: 0;">
				        <i class="fa fa-search"></i>
				   	    </button>
				    </div>
				</div>
				<!-- 인기 검색어 -->
				<div class="search-etc" style="padding: 20px 0px 20px; justify-content: center; display: flex;">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
						<c:forEach var="name" items="${top5}">
							<a tabindex="0" class="search-keyword" href="/NutrientDetail.do?name=${name}">${name}</a>
						</c:forEach>
					</div>
				</div>
    			<!-- 영양소 div -->
                <div class="box-container">
	                <c:forEach var="name" items="${top10}">
					    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>
                
            <div id="vitamin" class="tab">
                <!-- 비타민에 해당하는 상자 내용 -->
                <!-- 이미지 -->
   				<div class="image mt-4">
	                <img class="bg-img w-100" style="height:200px" src="<c:url value="/images/nutrient_img/bg_nt.png"/>"/>
	                <div class="text text-color:black text-center" style="margin-top:22px;">
		           		<b style="font-size: 30px;">🍊&nbsp;비타민 찾아보기</b><br/>
		           		<small>14가지 비타민의 중요성과 효과를 자세히 알아보세요!</small>
                	</div>
    			</div>
    			<!-- 검색창 -->
				<div class="d-flex justify-content-center">
					<div class="search d-flex justify-content-center" style="padding: 50px 0px 20px; position: relative; width: 960px;">
					    <input id="searchInput" style="font-size:20px; width: 100%;" type="text" class="searchTerm text-center" placeholder="어떤 영양소를 찾고 계신가요?‍"/>
					    <button type="submit" class="searchButton" style="position: absolute; right: 0;">
				        <i class="fa fa-search"></i>
				   	    </button>
				    </div>
				</div>
				<!-- 인기 검색어 -->
				<div class="search-etc" style="padding: 20px 0px 20px; justify-content: center; display: flex;">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
						<c:forEach var="name" items="${top5v}">
							<a style="font-size: 13px;" tabindex="0" class="search-keyword" href="/NutrientDetail.do?name=${name}">${name}</a>
						</c:forEach>
					</div>
				</div>
    			<!-- 영양소 div -->
    			<div class="box-container">
	                <c:forEach var="name" items="${vitaminNames}">
					    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>

            <div id="mineral" class="tab">
                <!-- 미네랄에 해당하는 상자 내용 -->
                <div class="image mt-4">
	                <img class="bg-img w-100" style="height:200px" src="<c:url value="/images/nutrient_img/bg_nt.png"/>"/>
	                <div class="text text-color:black text-center" style="margin-top:22px;">
		           		<b style="font-size: 30px;">🥗&nbsp;미네랄 및 기타영양소 찾아보기</b><br/>		           		
		           		<small>14가지 미네랄 및 기타영양소의 중요성과 효과를 자세히 알아보세요!</small>
                	</div>
    			</div>
    			<!-- 검색창 -->
				<div class="d-flex justify-content-center">
					<div class="search d-flex justify-content-center" style="padding: 50px 0px 20px; position: relative; width: 960px;">
					    <input id="searchInput" style="font-size:20px; width: 100%;" type="text" class="searchTerm text-center" placeholder="어떤 영양소를 찾고 계신가요?‍"/>
					    <button type="submit" class="searchButton" style="position: absolute; right: 0;">
				        <i class="fa fa-search"></i>
				   	    </button>
				    </div>
				</div>
				<!-- 인기 검색어 -->
				<div class="search-etc" style="padding: 20px 0px 20px; justify-content: center; display: flex;">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
						<c:forEach var="name" items="${top5m}">
							<a tabindex="0" class="search-keyword" href="/NutrientDetail.do?name=${name}">${name}</a>
						</c:forEach>
					</div>
				</div>
    			<!-- 영양소 div -->
    			<div class="box-container">
    			    <c:forEach var="name" items="${etcNames}">
					    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>
                
            <div id="functional" class="tab">
                <!-- 기능성 원료에 해당하는 상자 내용 -->
                <div class="image mt-4">
	                <img class="bg-img w-100" style="height:200px" src="<c:url value="/images/nutrient_img/bg_nt.png"/>"/>
	                <div class="text text-color:black text-center" style="margin-top:22px;">
		           		<b style="font-size: 30px;">🌿&nbsp;기능성 원료 찾아보기</b><br/>
		           		<small>74가지 기능성 원료의 중요성과 효과를 자세히 알아보세요!</small>
                	</div>
    			</div>
    			<!-- 검색창 -->
				<div class="d-flex justify-content-center">
					<div class="search d-flex justify-content-center" style="padding: 50px 0px 20px; position: relative; width: 960px;">
					    <input id="searchInput" style="font-size:20px; width: 100%;" type="text" class="searchTerm text-center" placeholder="어떤 영양소를 찾고 계신가요?‍"/>
					    <button type="submit" class="searchButton" style="position: absolute; right: 0;">
				        <i class="fa fa-search"></i>
				   	    </button>
				    </div>
				</div>
				<!-- 인기 검색어 -->
				<div class="search-etc" style="padding: 20px 0px 20px; justify-content: center; display: flex;">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
						<c:forEach var="name" items="${top5i}">
							<a tabindex="0" class="search-keyword" href="/NutrientDetail.do?name=${name}">${name}</a>
						</c:forEach>
					</div>
				</div>
    			<!-- 영양소 div -->
    			<div class="box-container">
	                <c:forEach var="name" items="${ingredientNames}">
					    <div class="box col-sm-2" style="white-space: nowrap;" onclick="location.href='/NutrientDetail.do?name=${name}'">
					        <b style="font-size: 14px;">${name}</b>
					    </div>
					</c:forEach>
                </div>
            </div>
    
    </div>
    <script>

	    function fade(element) {
	    	var op = 0;  // 초기 투명도
	    	var timer = setInterval(function () {
	            if (op >= 1) {
	            	clearInterval(timer);  // 애니메이션 종료
	            }
	            element.style.opacity = op;  // 투명도 설정
	            element.style.filter = 'alpha(opacity=' + op * 100 + ')';  // IE8 이하 대응
	            op += 0.1;  // 투명도 증가량
	        }, 50);  // 간격(ms)
	    }
	
	    function fadeInTab(tabElement) {
	        tabElement.style.display = "block";  // 탭 컨텐츠 보이기
	        fade(tabElement);  // 페이드인 효과 적용
	    }
	
	    function openTab(evt, tabName) {
	    	var i, tabContent, tabLinks;
	
	        tabContent = document.getElementsByClassName("tab");
	        for (i = 0; i < tabContent.length; i++) {
	            tabContent[i].style.display = "none";  // 모든 탭 컨텐츠 숨기기
	        }
	
	        tabLinks = document.getElementsByClassName("nav-link");
	        for (i = 0; i < tabLinks.length; i++) {
	            tabLinks[i].classList.remove("active");  // 모든 탭 링크에서 'active' 클래스 제거
	        }
	
	        var currentTab = document.getElementById(tabName);
	        console.log(currentTab)
	        // Remove immediate display and directly apply fade-in effect
	        currentTab.style.opacity = 0;
	        currentTab.style.filter = 'alpha(opacity=0)';
	        currentTab.style.border = 0;
	        fadeInTab(currentTab);  // 선택한 탭 컨텐츠를 페이드인으로 보이게 함
           
	    	evt.currentTarget.classList.add("active");  // 선택한 탭 링크에 'active' 클래스 추가
	    }
	        
        
     	// 진행 바 업데이트를 위한 변수 및 값 설정
        var progressElement = document.querySelector('.progress-bar-inner'); // 진행 바 요소 선택
        var textElement = document.querySelector('.progress-text'); // 텍스트 요소 선택

        var animationDuration = 1500; // 애니메이션 지속 시간 (밀리초)
        var targetValue = 50; // 목표 값 (%) 27~73
        
        // 상한 존재시 50% -> 73%로 변경
        var n_UL_M = "${n_UL_M}";
        var i_UL = "${i_UL}";
        
        if(n_UL_M.trim() !== "" || i_UL.trim() !=="" ){
        	targetValue = 72;
        }
        
        var updateInterval = 30; // 업데이트 간격 (밀리초)

        var progressValue = 0; // 현재 진행 값
        var currentValue = 0; // 현재 표시 값

        var increment = 1; // 증가량 계산

        // 진행 바 업데이트 함수
        function updateProgress() {
            progressValue += increment; // 진행 값 증가
            currentValue = Math.min(Math.round(progressValue), targetValue); // 현재 표시 값 계산
            
            progressElement.style.width = currentValue + '%'; // 진행 바 너비 설정
            textElement.textContent = '💊 적합한 섭취량을 알아보세요!' // 텍스트 내용 설정

            if (currentValue >= targetValue) {
                clearInterval(progressInterval); // 목표 값에 도달하면 업데이트 간격을 멈춤
            }
        }

        // 주기적으로 진행 바 업데이트 실행
        const progressInterval = setInterval(updateProgress, updateInterval);

        // 상세페이지 넘어왔을 때 위쪽 탭 밑줄 없애는 코드
        document.addEventListener('DOMContentLoaded', function() {
  			var show = document.querySelector('body > div.container.pb-5 > div.tab.pt-1.pb-5');
  			var removetarget = document.querySelector('body > div.container.pb-5 > div:nth-child(1) > ul > li:nth-child(1) > a');
  			if (show.style.display === 'block') {
    			removetarget.classList.remove("active");
  			}
		});
        
        // 제품 이미지 로드 에러시 해당 img태그 삭제 후 대체 img태그 수정
        function handleImageError(imgElement) {
			// 대체 이미지 태그 생성
			var altSrc = imgElement.alt;
			var newImg = document.createElement('img');
			newImg.setAttribute('src', altSrc);
			newImg.setAttribute('style', imgElement.getAttribute('style'));
			
			// 기존 img 태그를 대체 이미지 태그로 교체
			imgElement.parentNode.replaceChild(newImg, imgElement);
		}
		
		// 모든 img 태그에 대해 이벤트 리스너 등록
		var imgTags = document.getElementsByTagName('img');
		for (var i = 0; i < imgTags.length; i++) {
			imgTags[i].addEventListener('error', function() {
			handleImageError(this);
			});
		}
        
		//영양소 검색 및 자동완성
        $(function() {    //화면 다 뜨면 시작
        	
        	var searchSource = []; // 자동완성 목록
        	
        	var vit = "${vitaminNames}"; // 비타민명 추가
        	var vitArray = vit.slice(1, -1).split(","); // 적절한 구분자에 따라 문자열을 배열로 분할합니다.
        	Array.prototype.push.apply(searchSource, vitArray);
        	
        	var etc = "${etcNames}"; // 기타명 추가
        	var etcArray = etc.slice(1, -1).split(",");
        	Array.prototype.push.apply(searchSource, etcArray);
        	
        	var ing = "${ingredientNames}";
        	var ingArray = ing.slice(1, -1).split(",");
        	Array.prototype.push.apply(searchSource, ingArray);
	        
	        $(".searchTerm").autocomplete({  //오토 컴플릿트 시작
	            source : searchSource,    // source 는 자동 완성 대상
	            select : function(event, ui) {    //아이템 선택시
	                //console.log(ui.item);
	                var name = ui.item.value.trim();
	                var url = "/NutrientDetail.do?name="+encodeURIComponent(name);
	                window.location.href = url; // 페이지를 해당 URL로 이동합니다.
	                
	             	// 검색어 서버에 전송
	                $.ajax({
	                    url: "/search.do",
	                    method: "POST",
	                    contentType: "application/json",
	                    data: JSON.stringify(name),
	                    success: function(response) {
	                        console.log("Search history saved");
	                    },
	                    error: function(err) {
	                        console.error("Error saving search history:", err);
	                    }
	                });
	            },
	            focus : function(event, ui) {    //포커스 가면
	                return false;//한글 에러 잡기용도로 사용됨
	            },
	            minLength: 1,// 최소 글자수
	            autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
	            classes: {    //잘 모르겠음
	                "ui-autocomplete": "highlight"	                
	            },
	            delay: 10,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
	//            disabled: true, //자동완성 기능 끄기
	            position: { 
	            	my : "right top",
	            	at: "right+7 bottom"
	            },   
	            close : function(event){    //자동완성창 닫아질때 호출
	                //console.log(event);
	            },
	            open: function(event, ui) {
	                var autocompleteWidget = $(this).autocomplete("widget");
	                autocompleteWidget.css("width", "905px");
	                autocompleteWidget.css("text-align", "center");
	                autocompleteWidget.css("left", "50%");  // 왼쪽 위치를 50%로 설정하여 가로 중앙에 배치
	                autocompleteWidget.css("transform", "translateX(-50%)");  // 반 너비만큼 이동하여 가운데로 정렬
	            }
	        });

	        $(document).on("click", ".searchButton", function() {
	            var name = $(this).siblings(".searchTerm").val().trim();
	            if (name) {
	                var url = "/NutrientDetail.do?name=" + encodeURIComponent(name);
	                window.location.href = url;

	                // 검색어 서버에 전송
	                $.ajax({
	                    url: "/search.do",
	                    method: "POST",
	                    contentType: "application/json",
	                    data: JSON.stringify(name),
	                    success: function(response) {
	                        console.log("Search history saved");
	                    },
	                    error: function(err) {
	                        console.error("Error saving search history:", err);
	                    }
	                });
	            }
	        });
	    });
		
        
        // 이미지 있는 경우
        var firstBlock = document.querySelector('c\\:if[test="${not empty productInfo.PRODUCTNAME && not empty productInfo.IMGURL}"][var="first"]');
        
        // 이미지 없는 경우
        var secondBlock = document.querySelector('c\\:if[test="${! first}"]');
		
        if (secondBlock && secondBlock.parentNode) {
        	  secondBlock.parentNode.insertBefore(firstBlock, secondBlock);
       	}
        
		
        
		
		
		
        
        
    </script>
</body>
</html>
