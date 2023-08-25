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
        padding: 10px 4px;
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

	/* 모달 스타일 */
	.modal {
	    display: none; /* 초기에는 모달을 보이지 않도록 설정합니다. */
	    position: fixed; /* 고정된 위치에 배치하기 위해 position 속성을 fixed로 설정합니다. */
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.4); /* 반투명한 배경을 위해 rgba 색상 사용 */
	}
	
	/* 모달 컨텐츠 스타일 */
	.modal-content {
	    position: absolute;
	    top: 48%;
	    left: 50%;
	    transform: translate(-50%, -50%); /* 가로, 세로 기준 중앙에 배치하기 위해 transform 사용 */
	    background-color: #fefefe;
	    padding: 20px;
	    border-radius: 15px;
	    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	    width: 40%;
	}
	
	/* 모달 창 닫기 버튼 스타일 */
	.close {
	    position: absolute;
	    top: 20px;
	    right: 40px;
	    font-size: 30px;
	    cursor: pointer;
	}
	
	/* input 태그 스타일 */
	.modal input {
	    padding: 8px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    width: 40%;
	    box-sizing: border-box;
	    margin-top: 20px;
	    text-align: center;
	}
	
	/* label 태그 스타일 */
	.modal label {
	    display: inline-block;
	    width: 140px; /* 원하는 너비로 설정해주세요 */
	    font-weight: bold;
	    margin-right: 25px;
	    margin-left: 135px;
	    margin-top: 20px;
	    
	}
	
	/* button 태그 스타일 */
	.modal button {
	    padding: 10px 15px;
	    border: none;
	    background-color: #007bff;
	    color: white;
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	/* 두 번째 버튼(Modal 취소 버튼) 스타일 */
	.modal button:last-child {
	    background-color: #dc3545; /* 취소 버튼 색상을 빨간색으로 설정합니다. */
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
			
			<h4 class="text-center" style="width:95%; padding-bottom: 20px; border-bottom: 1px solid #ccc;"><b>회원 관리</b></h4>
	    
	    	<!-- 1번 div -->
	        <div class="each-container">
		        <!-- 도표1: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px;">
					<p class="text-center" style="font-size: 16px;"><b>일일 회원 통계</b></p>
					<div style="height: 200px; width: 550px; margin-left: 30px;">
				    	<canvas id="lineChart"></canvas>
				    </div>
				</div>
				 <!-- 도표2: 막대 그래프 -->
		        <div class="chart-container">
		        	<p class="text-center" style="font-size: 16px;"><b>회원 연령대 통계</b></p>
		        	<div style="height: 200px; width: 570px; margin-left: 20px;">
		            	<canvas id="pieChart"></canvas>
		            </div>
		        </div>
			</div>
	    	
	        <!-- 2번 div -->
			<div class="each-container">
				<!-- 회원테이블 -->
		        <div class="chart-container table-wrapper" style="height: 650px;">
		        	<p class="text-center" style="font-size: 16px;"><b>회원 목록</b></p>
		        	<div class="table-wrapper" style="height: 531px; overflow-y: auto; padding-right: 5px;">
					    <table>
					        <thead>
				                <tr>
				                	<th style="width:45px;">번호</th>
				                    <th style="width:80px;">아이디</th>
				                    <th style="width:52x;">이름</th>
				                    <th>생년월일</th>
				                    <th style="width:80px;">이메일</th>
				                    <th style="width:90px;">설정</th>
				                </tr>
				            </thead>
				            <tbody>
						        <c:forEach var="member" items="${members }" varStatus="loop">
							        <tr>
							        	<td>${loop.count}</td>
							            <td>${member.id }</td>
							            <td>${member.name }</td>
							            <td>${member.birth }</td>
							            <td>${member.email }</td>
							            <td>
							            	<div class="button-wrapper">
							            		<!-- 수정 버튼 -->
               									<button class="button" onclick="editMember('${member.id}')">
						                            <span>수정</span>
						                        </button>
						                        <!-- 삭제 버튼 -->
												<button class="button" onclick="deleteMember('${member.id}')">
						                            <span>삭제</span>
						                        </button>
						                    </div>
							            </td>
							        </tr>
						        </c:forEach>
					        </tbody>
					    </table>
			    	</div>
				</div>
			</div>
	    </div><!-- 전체 내용 -->
	    
	    <!-- 모달 -->
		<div class="modal" id="editMemberModal">
		    <div class="modal-content">
		        <span class="close" onclick="closeModal()">&times;</span>
		        <h2 class="text-center m-0">회원 정보 수정</h2>
				<hr style="border: 1px solid black; width: 95%;">
				<div>
	 		        <form id="editMemberForm">
			            <!-- 수정할 회원 정보 입력 폼 -->
			            <input type="hidden" name="id" id="memberId">
			            <div>
			                <label for="name">1. 이름</label>
			                <input type="text" name="name" id="name" required>
			            </div>
			            <div>
			                <label for="birth">2. 생년월일</label>
			                <input type="date" name="birth" id="birth" required>
			            </div>
			            <div>
			                <label>3. 성별</label>
			                <div style="display: inline-flex; align-items: center; margin-left: 60px;">
					            <input style="width: 20%;" type="radio" name="gender" value="M" id="male" required>
					            <label style="width: 60px; font-size:14px; margin-left: 3px; padding-top: 5px;" for="male">남성</label>
					            <input style="width: 20%;" type="radio" name="gender" value="F" id="female">
					            <label style="width: 60px; font-size:14px; margin-left: 3px; padding-top: 5px;" for="female">여성</label>
					        </div>
			            </div>
			            <div>
			                <label for="email">4. 이메일</label>
			                <input type="email" name="email" id="email" required>
			            </div>
			            <div>
			                <label for="active">5. 회원상태</label>
			                <div style="display: inline-flex; align-items: center;">
					            <input style="margin-left: 10px; width: 10%;" type="radio" name="active" value="Y" id="active" required>
					            <label style="width: 70px; font-size:13px; margin-left: 5px; margin-right:3px; padding-top: 5px;" for="active">활성화</label>
					            <input style="width: 10%;" type="radio" name="active" value="N" id="inactive" checked="checked">
					            <label style="width: 70px; font-size:13px; margin-left: 5px; margin-right:3px; padding-top: 5px;" for="inactive">비활성화</label>
					            <input style="margin-left: 15px; width: 10%;" type="radio" name="active" value="A" id="admin">
       							<label style="width: 70px; font-size:13px; margin-left: 5px; margin-right:3px; padding-top: 5px;" for="admin">관리자</label>
					        </div>
			            </div>
			            <div>
			                <label for="inactive_Date">6. 비활성화 변경일</label>
							<input type="date" name="inactive_Date" id="inactive_Date">
			            </div>
			            <div>
			                <label>7. 소셜회원 여부</label>
			                <div style="display: inline-flex; align-items: center; margin-left: 60px;">
					            <input style="width: 20%;" type="radio" name="socialFl" value="Y" id="socialY" required>
					            <label style="width: 60px; font-size:14px; margin-left: 3px; padding-top: 5px;" for="socialY">Y</label>
					            <input style="width: 20%;" type="radio" name="socialFl" value="N" id="socialN" checked="checked">
					            <label style="width: 60px; font-size:14px; margin-left: 3px; padding-top: 5px;" for="socialN">N</label>
					        </div>
			            </div>
			            <div>
						    <label for="site">8. 소셜회원 사이트</label>
						    <input type="text" name="site" id="site">
						</div>
			            <div style="display:flex; justify-content: center; margin-top: 50px;">
			                <button class="mr-3" type="button" onclick="saveMember()">저장</button>
			                <button type="button" onclick="closeModal()">취소</button>
			            </div>
			        </form>
		        </div>
		    </div>
		</div><!-- 모달 -->
			    
	    
	    
	    
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
        drawPieChart();
        getAgeDataAndDrawChart();
    });

	 	// 파이 차트
        function drawPieChart(agedata) {
	 		
		    if (!agedata || Object.keys(agedata).length === 0) {
		        console.log('파이차트 출력');
		        return;
		    }
		
		 	// Sort ageDataMap based on age groups
		    var sortedAgeData = {
		        "20대 미만": agedata["20대 미만"] || 0,
		        "20대": agedata["20대"] || 0,
		        "30대": agedata["30대"] || 0,
		        "40대": agedata["40대"] || 0,
		        "50대": agedata["50대"] || 0,
		        "60대 이상": agedata["60대 이상"] || 0,
		    };

		    var labels = Object.keys(sortedAgeData);
		    var data = Object.values(sortedAgeData);
		
		    new Chart(document.getElementById('pieChart'), {
		        type: 'pie',
		        data: {
		            labels: labels,
		            datasets: [{
		                data: data,
		                borderWidth: 1
		            }]
		        },
		        options: {
		            responsive: true,
		            maintainAspectRatio: false,
		        }
		    });
		}


        // Ajax 요청으로 연령대별 멤버 데이터를 가져와서 파이 차트를 그리는 함수
        function getAgeDataAndDrawChart() {
            // Ajax 요청
            $.ajax({
                type: 'GET',
                url: '/getAgeData.do',
                success: function (agedata) {
                    // 파이 차트 그리기
                    drawPieChart(agedata);
                },
                error: function (error) {
                    console.log('Error:', error);
                }
            });
        }
	 	
	    
		// 회원 삭제 함수
        function deleteMember(memberId) {

	        if (confirm("삭제하려는 회원 ID는 '" + memberId + "'입니다. 정말 삭제하시겠습니까?")) {
	            // 삭제 요청을 서버로 보내는 AJAX 요청
	        	$.ajax({
	                type: 'POST', // 또는 'GET'
	                url: '/deleteMember.do', // 삭제 요청을 처리할 서버의 URL
	                data: JSON.stringify({ memberId: memberId }), // memberId를 JSON 형식으로 변환하여 전달
	                contentType: 'application/json', // 데이터 타입 설정
	                dataType: 'json', // JSON 형태의 응답을 처리하기 위해 설정
	                success: function (data) {
	                    // 서버에서 삭제 성공 여부를 응답한 후에 수행할 동작
	                    if (data.success) {
	                        alert(memberId + data.message); // 회원 삭제 성공 메시지 출력
	                        location.reload(); // 페이지 새로고침
	                    } 
	                    else {
	                        alert(memberId + data.message); // 회원 삭제 실패 메시지 출력
	                    }
	                },
	                error: function (xhr, status, error) {
	                    // 서버 요청이 실패했을 때 수행할 동작
	                    alert(memberId + data.message); // 회원 삭제 실패 메시지 출력
	                }
	            });
	        }
    	}	
	    
		
     	// 회원 정보 수정 모달 열기
        function editMember(memberId) {
     		
            // memberId를 기반으로 서버에서 회원 정보를 가져온 후 모달에 세팅
            $.ajax({
                type: 'GET', // POST로 하기
                url: '/getMemberById/' + memberId, // memberId를 URL에 포함시킴
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                    	
                        const member = data.member;
                        // 회원 정보를 모달에 세팅
                        $('#memberId').val(member.id);
                        $('#name').val(member.name);
	
                        // 생년월일
                        console.log(member.birth) // "2000-02-10 00:00:00"
						var parsedDate = new Date(member.birth + "Z"); // "Z"를 추가하여 UTC 시간대로 파싱
						var formattedBirth = parsedDate.toISOString().split('T')[0];
						$('#birth').val(formattedBirth);

                     	// 성별 라디오 버튼 설정
                        if (member.gender === "M") {
                            $('#male').prop('checked', true);
                        } else if (member.gender === "F") {
                            $('#female').prop('checked', true);
                        }
                        
                        $('#email').val(member.email);
                     	
                        // 활성화 여부 설정
                        $('#active').prop('checked', member.active === "Y");
                        $('#inactive').prop('checked', member.active === "N");
                        $('#admin').prop('checked', member.active === "A");
                        
                     	// 비활성화 변경일 설정
                        const inactiveDateField = $('#inactive_Date');
					    const inactiveRadioValue = $('input[name="active"]:checked').val();
					 	
                     	// 비활성화 상태인 경우에만 비활성화 변경일 필드를 보여줌
                        if (member.active === "N") {
                            $('#inactive_Date').prop('disabled', false); // 비활성화일자 필드를 활성화
                         	// 항상 "inactive_Date" input 태그에 현재 날짜를 표시하도록 합니다.
						    const currentDate = new Date().toISOString().split('T')[0];
						    inactiveDateField.val(currentDate);
                        } 
                        else {
                            $('#inactive_Date').prop('disabled', true); // 비활성화일자 필드를 비활성화
                        }
                        
                     	// 소셜회원 여부 설정
                        $('#socialY').prop('checked', member.social_Fl === "Y");
                        $('#socialN').prop('checked', member.social_Fl !== "Y");
                        
                        // 소셜회원 여부가 N인 경우, 소셜회원 사이트 input에 기본적인 텍스트 표시
                        // 페이지 로드 시 기본값 설정
					    if ($('input[name="socialFl"]:checked').val() === "N") {
					        $('#site').val('소셜회원이 아닙니다');
					    }
                        else {
                        	$('#site').val(member.site)
                        }
                     	
                        // 모달 열기
                        $('#editMemberModal').show();
                    } 
                    else {
                        alert('회원 정보를 불러오는데 실패하였습니다.');
                    }
                },
                error: function (xhr, status, error) {
                    alert('회원 정보를 불러오는데 실패하였습니다.');
                }
            });
        }

        // 모달 닫기
        function closeModal() {
            $('#editMemberModal').hide();
        }

        // 회원 정보 저장
        function saveMember() {
		   
		    const jsonData = {};
		
		 	// 폼 데이터를 JSON 형식으로 변환
		    const formData = $('#editMemberForm').serializeArray();
		 	
		    // 폼 데이터를 JSON 형식으로 변환
		    $(formData).each(function (index, obj) {
		        jsonData[obj.name] = obj.value;
		    });
		
		 	// 비활성화 상태인 경우에만 비활성화일자 값 설정
		    if ($('input[name="active"]:checked').val() === "N") {
		        jsonData["inactive_date"] = new Date($('#inactive_Date').val()); // 비활성화일자 필드가 선택된 경우에만 값 설정
		    } else {
		        jsonData["inactive_date"] = null; // 비활성화일자 필드가 선택되지 않은 경우 null로 설정
		    }

		 	// SITE가 "소셜회원이 아닙니다"일 때 null로 처리합니다.
		    if (jsonData["socialFl"] === "N") {
		        jsonData["site"] = null;
		    } 
		    else if (jsonData["site"].trim() === '') { // 빈 문자열인 경우 null로 변환
		        jsonData["site"] = null;
		    }
		 	
		    // JSON 데이터를 문자열로 변환
		    const jsonString = JSON.stringify(jsonData);
		
		    $.ajax({
		        type: 'POST',
		        url: '/editMember',
		        data: jsonString, // JSON 형식으로 데이터를 보냄
		        contentType: 'application/json',
		        dataType: 'json',
		        success: function (data) {
		            if (data.success) {
		                alert(data.message);
		                closeModal();
		                // 페이지 새로고침 또는 필요한 동작 수행
		            } else {
		                alert(data.message); // 서버 측에서 전달한 메시지를 출력하여 확인
		            }
		        },
		        error: function (xhr, status, error) {
		            alert('회원 정보를 저장하는데 실패하였습니다.');
		        }
		    });
		}

     	
	     	
        
        
        
        
        
        
        
        
    </script>
</body>
</html>