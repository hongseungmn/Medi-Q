<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 예시로 Chart.js 라이브러리를 사용하여 막대 그래프 생성하는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
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
			
			<h4 class="text-center" style="width:95%; padding-bottom: 20px; border-bottom: 1px solid #ccc;"><b>관리자 메인</b></h4>
	    
	    	<!-- 1번 div -->
	        <div class="each-container">
		        <!-- 도표1: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px;">
					<p class="text-center" style="font-size: 16px; margin-bottom: 8px;"><b>일일 회원 통계</b></p>
					<div style="height: 200px; width: 550px; margin-left: 30px;">
				    	<canvas id="lineChart"></canvas>
				    </div>
				</div>
				<!-- 도표2: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px;">
					<p class="text-center" style="font-size: 16px; margin-bottom: 8px;"><b>연령대별 예측확률 통계</b></p>
					<canvas id="chart" style="width:608px; height:200px;"></canvas><!-- style="height: 550px; width: 570px;" -->
				</div>
			</div>
	        <!-- 2번 div -->
	        <div class="each-container">
		        <!-- 도표3: 버블 차트 -->
				<div class="chart-container" style="margin-bottom: 50px; height: 650px;">
					<p class="text-center" style="font-size: 16px;"><b>연령대별 건강고민 통계</b></p>
					<div id="myDiv" style="margin-left: 19px;"></div><!-- style="height: 550px; width: 570px;" -->
				</div>
			</div>
			
		    
	    </div><!-- 전체 내용 -->
	    <table id="hiddenData" style="display: none;">
	        <c:forEach var="info" items="${analyzeInfo_ }" varStatus="loop">
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
	    </table>
	    
	</div><!-- 컨테이너 -->
	
    <script>
	    
	 	// 라인 차트
	    let chart; // 변수를 전역으로 선언하여 차트 객체를 재사용
	    
	 	// 최근 일주일 날짜 가져오기
	    function getLastWeekDates() {
	        const today = new Date();
	        const days = ['일', '월', '화', '수', '목', '금', '토'];
	        const dates = [];
	
	        for (let i = 6; i >= 0; i--) {
	            const day = new Date(today);
	            day.setDate(today.getDate() - i);
	            const month = String(day.getMonth() + 1).padStart(1, '0');
	            const date = String(day.getDate()).padStart(2, '0');
	            const dayOfWeek = days[day.getDay()];
	            const formattedDate =  month + '/' + date + '(' + dayOfWeek + ')';
	            dates.push(formattedDate);
	        }
	
	        return dates;
	    }
	    
	 	// 라인 차트 업데이트 함수
	    function updateChart(loginData, signUpData) {
	        // 이전 차트가 존재하면 삭제하여 메모리 누수를 방지
	        if (chart) {
	            chart.destroy();
	        }
	        
	        chart = new Chart(document.getElementById('lineChart'), {
	            type: 'line',
	            data: {
	                labels: getLastWeekDates(), // 현재 날짜를 기준으로 최근 일주일 날짜를 가져옴
	                datasets: [{
	                        label: '일일 로그인수',
	                        data: loginData,
	                        fill: false
	                    },
	                    {
	                        label: '일일 회원가입수',
	                        data: signUpData,
	                        fill: false
	                    }
	                ]
	            },
	            options: {
	                responsive: true,
	                maintainAspectRatio: false,
	                scales: {
	                    y: {
	                        beginAtZero: true
	                    }
	                }
	            }
	        });
	    }
	    
	 	// 서버에서 데이터를 가져와 차트 업데이트
	    function fetchDataAndUpdateChart() {
	        // AJAX 요청 보내기
	        $.ajax({
	            url: '/countLoginMember.do', // 서버의 URL을 입력하세요.
	            type: 'GET',
	            dataType: 'json',
	            success: function (loginData) {
	                // 회원가입 데이터를 가져오는 AJAX 요청 보내기
	                $.ajax({
	                    url: '/countSignUpMember.do', // 회원가입 데이터를 가져오는 서버의 URL을 입력하세요.
	                    type: 'GET',
	                    dataType: 'json',
	                    success: function (signUpData) {
	                        // 서버에서 가져온 데이터로 차트 업데이트
	                        updateChart(loginData, signUpData);
	                    },
	                    error: function (error) {
	                        console.error('Error fetching sign-up data from server:', error);
	                    }
	                });
	            },
	            error: function (error) {
	                console.error('Error fetching data from server:', error);
	            }
	        });
	    }
	 	
	    document.addEventListener('DOMContentLoaded', () => {
	        // 라인 차트 업데이트
	        updateChart([], []);
	        
	        // 상태 변경 시 비활성화 변경일 필드 상태를 업데이트하는 함수 호출
	        $('input[name="active"]').change(function () {
	            updateInactiveDateFieldStatus();
	        });
	        
	        // 상태에 따라 비활성화 변경일 필드 상태를 업데이트하는 함수
	        function updateInactiveDateFieldStatus() {
	            const inactiveDateField = $('#inactive_Date');
	            const inactiveRadioValue = $('input[name="active"]:checked').val();
	            
	            // 항상 "inactive_Date" input 태그에 현재 날짜를 표시하도록 합니다.
	            const currentDate = new Date().toISOString().split('T')[0];
	            inactiveDateField.val(currentDate);
	            
	            if (inactiveRadioValue === "N") {
	                inactiveDateField.prop('disabled', false);
	            } else {
	                inactiveDateField.prop('disabled', true);
	                inactiveDateField.val(''); // 비활성화 상태일 때는 빈 문자열로 설정하여 값을 지웁니다.
	            }
	        }
	        
	        fetchDataAndUpdateChart();
	    });
	
	    // 질병 예측 그래프
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
	
	     	// HTML 테이블에서 데이터 가져오기 (비표시 상태의 tr로부터 데이터를 가져옴)
	        var dataFromServer = document.querySelectorAll("#hiddenData tr");

	     	// 각 행별로 데이터 처리
	        dataFromServer.forEach(function(row) {
	            // 질병 이름 가져오기
	            var disease = row.querySelector("[data-disease]").textContent.trim();

	            // 연령대와 확률 값 추출
	            var ageRange = row.children[2].textContent;
	            var probability = parseFloat(row.children[4].textContent);

	         // 데이터 유효성 검사
	            if (!datasets[disease] || !datasets[disease][ageRange]) {
	                console.error('Invalid data:', disease, ageRange);
	                return;  // 현재 반복 중단하고 다음 행으로 이동
	            }
	            
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
	     	
        // 영양제 분석 버블 차트
        const selectionCountDataJson = JSON.parse('${selectionCountDataJson}');
    	
	    const labels = ["20대 미만", "20대", "30대", "40대", "50대", "60대 이상"];
	
	    var healthIssues = [
	        "피로감", "스트레스 & 수면", "노화 & 항산화", "면역 기능", "빈혈", "눈 건강", "갑상선 건강", "호흡기 건강",
	        "소화 & 위식도 건강", "간 건강", "장 건강", "뼈 건강", "관절 건강", "탈모 & 손톱 건강", "피부 건강",
	        "두뇌활동", "운동 능력 & 근육량", "혈압", "혈당", "혈관 & 혈액순환", "혈중 중성지방", "혈중 콜레스테롤",
	        "체지방", "치아 & 잇몸", "남성 건강", "여성 건강", "임산부 & 태아 건강", "여성 갱년기"
	    ];
	
	    healthIssues = healthIssues.reverse(); // 역순 재배치
	
	    var traces = [];
	    
	    labels.forEach(function(label, index) {
	        var x = [];
	        var y = [];
	        var markerSize = [];
	        var colors = [];
	        var colorscale = [
	            [0, 'rgb(0, 128, 255)'],
	            [0.5, 'rgb(102, 255, 178)'],
	            [1, 'rgb(255, 0, 0)']
	        ];

	        healthIssues.forEach(function (issue) {
	            var count = (selectionCountDataJson[label] && selectionCountDataJson[label][issue]) || 0;
	            x.push(label);
	            y.push(issue);
	            markerSize.push(count);
	            colors.push(count);
	        });
	        
	        var maxCount = Math.max(...colors); // Calculate maxCount after colors have been populated

	        traces.push({
	            x: x,
	            y: y,
	            mode: 'markers',
	            marker: {
	                size: markerSize,
	                sizemode: 'area',
	                sizeref: 0.01,
	                color: colors,
	                colorscale: colorscale,
	                colorbar: {
	                    title: '빈도',
	                    thickness: 20, // reduce colorbar thickness
	                    len: 0.5,
	                    tickvals: [Math.min(...colors), maxCount], // specify tick positions
	                    ticktext: [Math.min(...colors), maxCount], // specify tick labels
	                    showticklabels: false, // Add this line to hide the numeric labels
	                },
	                cmin: Math.min(...colors),
	                cmax: maxCount
	            },
	            hovertemplate: '%{y}, 선택 수: %{marker.size}<extra></extra>',
	        });
	    });

	    var layout = {
	        showlegend: false,
	        hovermode: 'closest',
	        height: 550,
	        width: 570,
	        margin: {
	            l: 100,
	            r: 20,
	            t: 0,
	            b: 25
	        },
	        yaxis: {
	            tickfont: {
	                size: 10
	            }
	        },
	        coloraxis: {colorbar: {title: 'Counts'}}
	    };

	    Plotly.newPlot('myDiv', traces, layout);
	     
	    
    </script>
</body>
</html>