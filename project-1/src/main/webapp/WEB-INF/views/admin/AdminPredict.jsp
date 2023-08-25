<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 예시로 Chart.js 라이브러리를 사용하여 막대 그래프 생성하는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- jquery.slim.min에서 slim뺌 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<!-- Plotly.js -->
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>


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
        padding: 8px 4px;
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
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
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
			
			<h4 class="text-center" style="width:95%; padding-bottom: 20px; border-bottom: 1px solid #ccc;"><b>질병예측 결과 통계</b></h4>
	    
	    	<!-- 1번 div -->
	        <div class="each-container">
		        <!-- 도표1: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px; height: 650px;">
					<p class="text-center" style="font-size: 16px;"><b>연령대별 예측확률 통계</b></p>
					<canvas id="chart" style="width:608px; height:562px;"></canvas><!-- style="height: 550px; width: 570px;" -->
				</div>
			</div>
	    	
	        <!-- 2번 div -->
			<div class="each-container">
				<!-- 회원테이블 -->
		        <div class="chart-container table-wrapper" style="height: 650px;">
		        	<p class="text-center" style="font-size: 16px;"><b>예측결과 목록</b></p>
		        	<div class="table-wrapper" style="height: 531px; overflow-y: auto; padding-right: 5px;">
					    <table>
					        <thead>
				                <tr>
				                	<th style="width:40px;">번호</th>
				                    <th style="width:90px;">아이디</th>
				                    <th style="width:65px;">연령대</th>
				                    <th style="width:100px;">선택 질병예측</th>
				                    <th style="width:65px;">예측 확률</th>
				                    <th style="width:75px;">분석일</th>
				                </tr>
				            </thead>
				            <tbody>
						        <c:forEach var="info" items="${analyzeInfo }" varStatus="loop">
							        <tr>
							        	<td>${loop.count}</td>
							            <td>${info.ID}</td>
							            <td>${info.AGE_RANGE}</td>
							            <td data-disease="${info.P_DISEASE}">
						                    <c:choose>
						                        <c:when test="${info.P_DISEASE == 'Diabetes'}">당뇨병</c:when>
						                        <c:when test="${info.P_DISEASE == 'Cardiovascular'}">심혈관질환</c:when>
						                        <c:when test="${info.P_DISEASE == 'SkinLesion'}">피부질환</c:when>
						                        <c:when test="${info.P_DISEASE == 'Stroke'}">뇌졸중</c:when>
						                        <c:when test="${info.P_DISEASE == 'LungCancer'}">폐암</c:when>
						                        <c:when test="${info.P_DISEASE == 'Parkinson'}">파킨슨병</c:when>
						                    </c:choose>
						                </td>
							            <td>${info.P_RESULT}</td>
							            <td>${info.P_DATE}</td>
							        </tr>
						        </c:forEach>
					        </tbody>
					    </table>
			    	</div>
				</div>
			</div>
	    </div><!-- 전체 내용 -->
	    
	</div><!-- 컨테이너 -->
	
    <script>
	    // DOM이 로드될 때 실행되는 함수
	    document.addEventListener("DOMContentLoaded", function() {
	        // 질병들의 목록
	        var diseasesOrder = ['당뇨병', '심혈관질환', '파킨슨병', '뇌졸중', '피부질환', '폐암'];
	
	        // 데이터셋 초기화
	        var datasets = {};
	
	        // 각 질병별 데이터셋을 초기화
	        diseasesOrder.forEach(disease => {
	            datasets[disease] = {};
	        });
	
	        // 연령대 구분
	        var ageRanges = ['20대 미만', '20대', '30대', '40대', '50대', '60대 이상'];
	
	        // 각 질병별 연령대 데이터 초기화
	        Object.keys(datasets).forEach(disease => {
	            ageRanges.forEach(ageRange => {
	                datasets[disease][ageRange] = {
	                    count: 0,
	                    total: 0
	                };
	            });
	        });
	
	        // HTML 테이블에서 데이터 가져오기
	        var dataFromServer = document.querySelectorAll("tbody tr");
	
	        // 각 행별로 데이터 처리
	        dataFromServer.forEach(function(row) {
	            // 질병 코드로부터 질병 이름 매핑
	            var diseaseCode = row.children[3].getAttribute('data-disease');
	            var disease;
	
	            switch (diseaseCode) {
	                case 'Diabetes':
	                    disease = '당뇨병';
	                    break;
	                case 'Cardiovascular':
	                    disease = '심혈관질환';
	                    break;
	                case 'SkinLesion':
	                    disease = '피부질환';
	                    break;
	                case 'Stroke':
	                    disease = '뇌졸중';
	                    break;
	                case 'LungCancer':
	                    disease = '폐암';
	                    break;
	                case 'Parkinson':
	                    disease = '파킨슨병';
	                    break;
	            }
	
	         	// 연령대와 확률 값 추출
	            var ageRange = row.children[2].textContent;
	            var probability = parseFloat(row.children[4].textContent);
	
	            // 해당 질병과 연령대의 카운트와 총 합 업데이트
	            datasets[disease][ageRange].count++;
	            datasets[disease][ageRange].total += probability;
	        });
	
	        // 각 질병별 연령대의 평균 확률 계산
	        Object.keys(datasets).forEach(function(disease) {
	            Object.keys(datasets[disease]).forEach(function(ageRange) {
	                datasets[disease][ageRange] = (datasets[disease][ageRange].total || 0) / datasets[disease][ageRange].count;
	            });
	        });
	
	        // 차트를 그리기 위한 설정
	        var ctx = document.getElementById('chart').getContext('2d');
	        var colors = [
	        	'rgba(255, 99, 132, 0.6)',
		        'rgba(54, 162, 235, 0.6)',
		        'rgba(255, 206, 86, 0.6)',
		        'rgba(75, 192, 192, 0.6)',
		        'rgba(153, 102, 255, 0.6)',
		        'rgba(255, 159, 64, 0.6)'
		        ];
	
	     	// 차트 데이터 설정
	        var chartData = {
	            labels: ageRanges,
	            datasets: Object.keys(datasets).map(function(disease, idx) {
	                return {
	                    label: disease,
	                    data: ageRanges.map(function(ageRange) {
	                        return datasets[disease][ageRange] || 0;
	                    }),
	                    fill: false
	                };
	            })
	        };
	
	     	// 차트 생성
	        var chart = new Chart(ctx, {
	            type: 'line',
	            data: chartData,
	            options: {
	                scales: {
	                    y: {
	                        beginAtZero: true
	                    }
	                }
	            }
	        });
	    });

    </script>
</body>
</html>