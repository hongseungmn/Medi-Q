<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 예시로 Chart.js 라이브러리를 사용하여 막대 그래프 생성하는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- jquery.slim.min에서 slim뺌 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>



<style>

	body {
        background-color: #f5f5f0;
	}

    /* 사이드바 */
    #admin_sidebar {
        width: 290px;
        height: 835px;
        margin: 10px 5px 20px 40px;
        padding: 30px 30px;
        border: 1px solid #ccc;
        background-color: white; 
        
    }
    
    #admin_sidebar h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    #admin_sidebar ul {
        list-style: none;
        padding: 0;
    }

    #admin_sidebar li {
        margin-bottom: 10px;
    }

    #admin_sidebar a {
        display: block;
        padding: 5px 10px;
        text-decoration: none;
        color: #333;
        margin-top: 44px;
        margin-bottom: 44px;
        font-size: 15px;
        font-weight: bold;
        padding-left: 23px;
    }

    #admin_sidebar a:hover {
        background-color: #f0f0f0;
    }
    
    /* 사이드바 이모티콘 */
    i {
	  display: inline-block;
	  width: 30px; /* 원형의 지름 설정 */
	  height: 30px; /* 원형의 지름 설정 */
	  border-radius: 50%; /* 원형으로 만들기 위해 50%로 설정 */
	  background-color: #EF605D; /* 원하는 색상을 지정합니다. */
	  color: white;
	}
    
    /* 컨텐츠 전체 */
    #admin_content {
    	width: 1600px;
    	height: 835px;
        padding: 30px 10px;
        margin: 10px 40px 20px 5px;
        border: 1px solid #ccc;
        background-color: white; 
    }
    
    /* 4분할 */
    .each-container {
    	padding: 10px;
    	margin: 20px 15px;
    	
    }
    
    /* 컨텐츠 내 차트 */
    .chart-container {
    	width: 670px; 
    	height: 300px; 
    	margin: 5px;
    	padding: 20px 30px;
    	border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f7f7f7;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    

    /* 예시 테이블 스타일 */
    table {
        border-collapse: collapse;
        width: 100%;
        font-size: 12px;
        overflow: auto; /* 스크롤이 가능하도록 하기 위해 추가 */
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: center;
        padding: 8px;
    }

    th {
        background-color: rgba(75, 192, 192, 0.6);
        height: 40px;
    }

    tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    tbody tr:hover {
        background-color: #ddd;
    }
    
    /* 테이블 헤더 고정 */
	thead {
	    position: sticky;
	    top: 0;
	    background-color: #EF605D;
	}

    /* 버튼 스타일링 */
    .button-wrapper {
        display: flex;
        justify-content: center;
    }

    .button {
        border-radius: 4px;
        background-color: rgba(255, 206, 86, 1);
        border: none;
        color: white;
        text-align: center;
        cursor: pointer;
        margin: 2px;
        font-size: 9px;
    }
    
    .button:hover {
	    background-color: rgb(255,151,0); /* 버튼 호버 시 배경색이 더 진한 색으로 변경 */
    }

    .button span {
        cursor: pointer;
        display: inline-block;
    }
    
    /* 스크롤바 색상, 위치 설정 */
    .table-wrapper {
    }
    
	.table-wrapper::-webkit-scrollbar {
	  width: 10px; /* 스크롤바 너비 조절 */
	}
	
	.table-wrapper::-webkit-scrollbar-thumb {
	  background-color: #ccc; /* 스크롤바 색상 */
	  border-radius: 5px; /* 스크롤바 모서리 둥글게 설정 */
	}
	
	.table-wrapper::-webkit-scrollbar-thumb:hover {
	  background-color: #999; /* 스크롤바 호버시 색상 */
	}
	 
	/* 체인지 버튼 */ 
	#change {
	    border: 1px solid black;
	    border-radius: 5px;
	    cursor: pointer;
	    color: black;
	}
	
	/* td 호버 */
	td:hover {
	    cursor: pointer;
    }
	
	/* 마스코트 */
    .image-container {
	    position: relative; /* 이미지의 위치를 조정할 수 있게 함 */
	}
	
	#adminmascot {
	    position: relative; 
	    left: -85px; /* 이미지를 50px 왼쪽으로 이동 */
	    top: -10px;
	}
	
</style>
</head>
<body>

	<div class="d-flex" style="margin-top: 75px;">
		
		<!-- 관리자 사이드바 -->
		<div id="admin_sidebar">
	        <h4 class="text-center" style="padding-top: 10px; width:95%; padding-bottom: 30px; border-bottom: 1px solid #ccc;"><b>관리자 메뉴</b></h4>
	        <ul>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-home" style="font-size:17px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;관리자 메인
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMember.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-users" style="font-size:17px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;회원 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminDB.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-table" style="font-size:17px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;데이터베이스 통계
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminIssue.do"/>" style="display: flex; align-items: center;">
						<i class="fas fa-medkit" style="font-size:17px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;영양제 분석 통계
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminPredict.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-heartbeat" style="font-size:17px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;질병예측 결과 통계
	        		</a>
	        	</li>
	        </ul>
	        <div class="image-container">
        		<img id="adminmascot" src="/images/tsimages/mascot.png" style="height: 230px; width: 400px;">
        	</div>
	    </div><!-- 관리자 사이드바 -->
	    
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->	

		<!-- 전체 내용 -->
	    <div id="admin_content" style="display: flex; justify-content:center; flex-wrap: wrap;">
			
			<h4 class="text-center" style="width:95%; padding-bottom: 20px; border-bottom: 1px solid #ccc;"><b>데이터베이스 통계</b></h4>
	    
	    	<!-- 1번 div -->
	        <div class="each-container">
		        <!-- 도표1: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px;">
					<p class="text-center" style="font-size: 16px;"><b>Top10 영양제 테이블 통계</b></p>
					<div style="height: 200px; width: 608px;">
				    	<!-- 혼합 차트를 그릴 캔버스 -->
    					<canvas id="mixedChart" style="width: 608px; height: 200px;"></canvas>
				    </div>
				</div>
				 <!-- 도표2: 막대 그래프 -->
		        <div class="chart-container">
		        	<p class="text-center" style="font-size: 16px;"><b>Top10 영양소 테이블 통계</b></p>
		        	<div style="height: 200px; width: 608px;">
		            	<!-- 막대 차트를 그릴 캔버스 -->
    					<canvas id="barChart" style="width: 608px; height: 200px;"></canvas>
		            </div>
		        </div>
			</div>
	    	
	        <!-- 2번 div -->
			<div class="each-container append_mask_parent">
			
				<!-- 회원테이블 -->
		        <div class="chart-container table-wrapper" style="height: 650px;">
			        <div style="display: flex; justify-content: center; align-items: center; margin-bottom: 13px;">
					    <select id="change" class="form-control mr-4" style="width: 190px; font-size: 16px; font-weight: bold;">
					        <option selected>영양제 테이블 목록</option>
					        <option>영양소 테이블 목록</option>
					    </select>
					</div>
					<div id="append_mask_div"></div>
		        	<div class="table-wrapper" style="height: 531px; overflow-y: auto; padding-right: 5px;">
					    <table id="first">
					        <thead>
				                <tr>
				                    <th style="width:45px;">번호</th>
				                    <th>이름</th>
				                    <th>기능</th>
				                    <th style="width:120px;">포함 영양소</th>
				                    <th style="width:45px;">별점</th>
				                    <th style="width:55px;">리뷰수</th>
				                    <th style="width: 75px;">리뷰 갱신</th>
				                </tr>
				            </thead>
				            <tbody>
						        <c:forEach var="foodInfo" items="${foodInfos}" varStatus="loop">
								    <tr>
								        <td onclick="location.href='/detail.do?no=${foodInfo.no}'">${loop.count}</td>
								        <td onclick="location.href='/detail.do?no=${foodInfo.no}'">${foodInfo.productName }</td>
								        <td onclick="location.href='/detail.do?no=${foodInfo.no}'">${fn:replace(foodInfo.material, '$', ',') }</td>
								        <td onclick="location.href='/detail.do?no=${foodInfo.no}'">${fn:replace(foodInfo.nutrient, '$', ',') }</td>
								        <td onclick="location.href='/detail.do?no=${foodInfo.no}'">${foodInfo.avgStarScore }</td>
								        <td onclick="location.href='/detail.do?no=${foodInfo.no}'">${foodInfo.reviewCount }</td>
								        <td>
								        	<div class="button-wrapper">
							            		<!-- 갱신 버튼 -->
               									<button class="button update_review" value="${foodInfo.no}">
						                            <span>업데이트</span>
						                        </button>
					                        </div>
				                        </td>
								    </tr>
								</c:forEach>
					        </tbody>
					    </table>
					    <table id="second" style="display: none;">
					    	<thead>
				                <tr>
				                    <th style="width:50px;">번호</th>
				                    <th>이름</th>
				                    <th>기능</th>
				                    <th>포함 영양제</th>
				                    <th style="width:60px;">조회수</th>
				                </tr>
				            </thead>
				            <tbody>
						        <c:forEach var="mergedInfo" items="${mergedInfos}" varStatus="loop">
							        <tr onclick="location.href='/NutrientDetail.do?name=${mergedInfo.name}'">
							            <td>${loop.count }</td>
							            <td>${mergedInfo.name }</td>
							            <td>${mergedInfo.func }</td>
							            <td>${mergedInfo.productNames }</td>
							            <td>${mergedInfo.view }</td>
							        </tr>
						        </c:forEach>
					        </tbody>
					    </table>
			    	</div>
				</div>
			</div><!-- 테이블 -->
	    </div><!-- 전체 내용 -->
	    
	</div><!-- 컨테이너 -->
	
    <script>
	    
	 	// 페이지 로드 시 차트 생성
	    document.addEventListener('DOMContentLoaded', () => {

	     	// select 요소의 변경 이벤트를 감지하여 처리
	        $("#change").change(function() {
	            var selectedOption = $(this).val();
	            if (selectedOption === "영양소 테이블 목록") {
	                // 영양소 테이블 목록이 선택되었을 때
	                $("#first").hide(); // first 테이블을 숨김
	                $("#second").show(); // second 테이블을 보임
	            } else {
	                // 영양제 테이블 목록이 선택되었을 때
	                $("#first").show(); // first 테이블을 보임
	                $("#second").hide(); // second 테이블을 숨김
	            }
	        });
	    });
	    
	 	// 주어진 mixedLabels 변수의 값을 파싱하여 List로 변환하는 함수
        function parseMixedLabels(mixedLabels) {
          // 양끝의 대괄호 '['와 ']'를 제거한 후, 쉼표(,)로 구분하여 배열로 분리
          var labelsArray = mixedLabels.slice(1, -1).split(', ');
          
          // 각 라벨에 대한 공백을 제거하고 다시 List로 변환하여 리턴
          return labelsArray.map(label => label.trim());
        }
	 	
	 	// 혼합 차트 레이블
        var mixedLabels = '${foodTop10}';
     	// mixedLabels 값을 파싱하여 List로 변환
        var parsedLabels = parseMixedLabels(mixedLabels);
        
     	// 리뷰 개수
     	var data1 = '${foodTop10RC}';
     	var parsedData1 = parseMixedLabels(data1);
     	 
     	// 평균 별점
     	var data2 = '${foodTop10AS}';
     	var parsedData2 = parseMixedLabels(data2);
     	
        // 혼합 차트 데이터 (레이블 10개에 맞게 데이터 갯수도 10개로 맞춤)
        var mixedData = {
            labels: parsedLabels,
            datasets: [
                {
                	yAxisID: 'left-y-axis', // 왼쪽 Y축을 사용
                    type: 'bar',
                    label: '리뷰 개수(left-y)',
                    backgroundColor: 'rgba(255, 99, 132, 0.6)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 2,
                    data: parsedData1
                },
                {
                	 yAxisID: 'right-y-axis', // 오른쪽 Y축을 사용
                     type: 'line',
                     label: '평균 별점(right-y)',
                     backgroundColor: 'rgba(255, 159, 64, 0.6)',
                     borderColor: 'rgba(255, 159, 64, 1)',
                     borderWidth: 2,
                     fill: false,
                     data: parsedData2
                }
            ]
        };

        // 혼합 차트 그리기
        var mixedChartCtx = document.getElementById('mixedChart').getContext('2d');
        var mixedChart = new Chart(mixedChartCtx, {
        	type: 'bar',
            data: mixedData,
            options: {
                scales: {
                	'left-y-axis' : { 
                		type: 'linear',
                        position: 'left',
                        title: {
                            display: true
                        },
                        grid: {
                            display: false
                        },
                        ticks: {
                            beginAtZero: true
                        }
                	},
                	'right-y-axis' : {
                		type: 'linear',
                        position: 'right',
                        title: {
                            display: true
                        },
                        grid: {
                            display: false
                        },
                        ticks: {
                            beginAtZero: true
                        }
                	}
                }
            }
        });
	     	
     	// 막대 차트 레이블
        var barLabels = '${nutTop10}';
     	// mixedLabels 값을 파싱하여 List로 변환
        var parsedLabels = parseMixedLabels(barLabels);
     	
     	// 조회수
     	var data1 = '${nutTop10v}';
     	var parsedData1 = parseMixedLabels(data1);
     	
     	// 검색수
     	var data2 = '${nutTop10s}';
     	var parsedData2 = parseMixedLabels(data2);
     	
     	// 막대 차트 데이터 (레이블 10개에 맞게 데이터 갯수도 10개로 맞춤)
        var barData = {
            labels: parsedLabels,
            datasets: [
            	{
            		yAxisID: 'left-y-axis', // 왼쪽 Y축을 사용
                    type: 'bar',
	                label: '누적 조회수(left-y)',
	                backgroundColor: 'rgba(54, 162, 235, 0.6)',
	                borderColor: 'rgba(54, 162, 235, 1)',
	                borderWidth: 2,
	                data: parsedData1
            	},
                {
               	 yAxisID: 'right-y-axis', // 오른쪽 Y축을 사용
                    type: 'line',
                    label: '주간 검색량(right-y)',
                    backgroundColor: 'rgba(75, 192, 192, 0.6)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2,
                    fill: false,
                    data: parsedData2,
                    
               }
           	]
        };

        // 막대 차트 그리기
        var barChartCtx = document.getElementById('barChart').getContext('2d');
        var barChart = new Chart(barChartCtx, {
            type: 'bar',
            data: barData,
            options: {
                scales: {
                	'left-y-axis' : { 
                		type: 'linear',
                        position: 'left',
                        title: {
                            display: true
                        },
                        grid: {
                            display: false
                        },
                        ticks: {
                            beginAtZero: true
                        }
                	},
                	'right-y-axis' : {
                		type: 'linear',
                        position: 'right',
                        title: {
                            display: true
                        },
                        grid: {
                            display: false
                        },
                        ticks: {
                            beginAtZero: true
                        }
                	}
                }
            }
        });

   		//업데이트 버튼 클릭시 파일 업데이트
   		$(".update_review").click(function() {
   			console.log(this.value);
   			var maskWidth = document.querySelector("#first").offsetWidth;
   			var maskHeight = 560;
   			var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000;'><div id='loadingImg' style='display:none;'></div></div>";
   			var loadingImg = "<img src='<c:url value="images/Spinner.gif"/>' style='position: relative;top:190px;left:210px;display: block;'/>";
   		 	$('#append_mask_div').append(mask);
		    $('#mask').css({
		             'width' : maskWidth,
		             'height': maskHeight,
		             'opacity' : '0.3'
		     }); 
		     //마스크 표시
		     $('#mask').show();
		     $('#loadingImg').append(loadingImg);
		     $('#loadingImg').show();
   			
   			$.ajax({
                type: 'PUT',
                url: 'http://192.168.0.16/review/'+this.value,
                success: function (response) {
					console.log(response);
					alert(response);
					$('#append_mask_div, #loadingImg').empty();
					$('#mask, #loadingImg').hide();
                }
            
            });
   		});
    </script>
</body>
</html>