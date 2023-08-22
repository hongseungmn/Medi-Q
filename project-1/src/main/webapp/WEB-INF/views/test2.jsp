<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<jsp:include page="/WEB-INF/views/template/SelectFoodListStyleScript.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     <style>
body{
	background-color: white;
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
.food-box {
    border: 1px solid #ccc;
    padding: 15px;
    margin: 10px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
    cursor: pointer;
  }
  
  .food-info {
    font-weight: bold;
    margin-bottom: 10px;
  }
  
  .label-value-container {
    display: flex;
    align-items: center;
    margin-bottom: 5px;
  }
  
  .label {
    color: #888;
    font-size: 12px;
    flex: 1;
  }
  .value {
    color: #333;
    font-size: 14px;
    flex: 2;
  }
  
  h1 {
	  text-align: center;
	}
  .chart_dnt_1,
  .chart_dnt_2 {
    width: 300px;
    display: inline-block;
  }
  
  .label-value-container {
		    display: none;
		    margin-top: 5px;
		}
		
		.food-box.expanded .label-value-container {
		    display: flex;
		}

.modal-content form {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }
    
    .btn-primary {
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            max-width: 400px;
            width: 90%;
        }

        /* Input Styles */
        .input-field {
            border: 1px solid black;
            margin-bottom: 10px;
            padding: 5px;
            border-radius: 5px;
            width: 100%;
        }

        .select-field {
            border: 1px solid black;
            margin-bottom: 10px;
            padding: 5px;
            border-radius: 5px;
            width: 100%;
            appearance: none;
            background-image: url('dropdown-icon.png');
            background-position: right center;
            background-repeat: no-repeat;
        }
    .txt2 {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .txt2 .btn {
    position: absolute; /* a 태그에 position 설정 추가 */
    right: 100px; /* a 태그를 오른쪽으로 이동 */
  }
  .btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #0099cc; /* 파란색 계열 */
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
  }

  .btn:hover {
    background-color: #0077b3; /* 마우스 호버 시 조금 더 진한 파란색 */
  }
  
  #ingestionbtn {
    background-color: #ffffff;
    color: black;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
  }

  #ingestionbtn:hover {
    background-color: #0077b3;
  }
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span><span style="color:#EF605D;">MEDI-Q</span> 영양제 인기순위</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">실제 섭취하는 유저들의 리뷰와 피드백으로 만든<br/> 가장 믿을만한 영양제 랭킹을 만나보세요</p>
            </h3>
        </div>
    </aside>
    
<!-- ------------------------------------------------------------------------------- -->    
<div class="all-wrap">
	<div class="all-wrap-in all-wrap-in-070">
		<div class="ingredient-search-top">
			<div class="content" style="background-color:#fdfbf6; padding-bottom: 20px;">
				<div class="top-wrap-070">
					<h1 class="txt2 text-center" style="margin-bottom: 30px; font-size: 30px;"><span>일일 섭취량</span>
					<a class="btn"  href="/food/test3.do">일일 섭취량 보러가기</a>	</h1>
				</div>
				<div style="text-align: right; margin-right: 100px">
				<button class="btn-primary" style="border: 1px solid black;" id="openModal">자신의 일일 칼로리 계산</button>
				</div>
				<!-- 모달 -->
			    <div class="modal" id="modal">
			        <div class="modal-content">
			            <form action="/food/userinfo.do" method="post">
			            	<p>키를 입력해주세요</p>
			                <input class="input-field" name="Height" placeholder="(cm)" type="number" required>
			                <p>몸무게를 입력해주세요</p>
			                <input class="input-field" name="Weight" placeholder="(kg)" type="number" required>
			                <p>탄수화물의 입력해주세요</p>
			                <input class="input-field" name="Cbhrate" placeholder="적정 비율 40~65(%)" type="number" required>
			                <p>단백질의 입력해주세요</p>
			                <input class="input-field" name="Prorate" placeholder="적정 비율 7~35(%)" type="number" required>
			                <p>지방의 비율을 입력해주세요</p>
			                <input class="input-field" name="Fatrate" placeholder="적정 비율 15~30(%)" type="number" required>
			                <div style="font-size: x-small;text-align: right;width: 350px;">평균적인 최적의 탄단지 비율은 5:2:3 라고 합니다</div>
			                <p>활동량을 입력해주세요</p>
			                <select class="select-field" name="healthIssueSelect" onchange="submitForm()">
			                    <option value="1">앉아서 일하는 경우</option>
			                    <option value="2">가벼운 활동(운동없이 약간의 활동)</option>
			                    <option value="3">보통 활동(주3~4회 운동)</option>
			                    <option value="4">활발한 활동(주 5~7회 운동)</option>
			                    <option value="5">매우 활발한 활동(일일 운동 및 육체적 노동)</option>
			                </select>
			                <input type="number" name="age" value="${age}" hidden>
			                <button class="btn-primary" id="caloriesBtn" name="cabtn">칼로리 계산</button>
			            </form>
			        </div>
			    </div>
				<c:if test="${not empty Fatrate }">
					<div class="chart_dnt_2">
						  <h1>칼로리기준 탄단지 비율</h1>
						  <canvas id="chart_doughnut_2"></canvas>
					</div>
	    			<p id="result"></p>
	    			<p id="resultCbh"></p>
	    			<p id="resultPro"></p>
	    			<p id="resultFat"></p>
    			</c:if>
				<c:if test="${not empty fat}">
					<div class="chart_dnt_1">
					  <h1>현재 섭취한 탄단지 비율</h1>
					  <canvas id="chart_doughnut_1"></canvas>
					</div>
					<p>총 섭취한 칼로리: ${calorie }kcal</p>
					<p>총 섭취한 탄수화물: ${carbohydrate }g</p>
					<p>총 섭취한 단백질: ${protein }g</p>
					<p>총 섭취한 지방: ${fat }g</p>
					<p>총 점수는 : ${TOSCORE}점</p>
				</c:if>
					<div class="search-etc">
					<div class="ipt-main-wrap">
						<form action="/food/foodsearch.do">
							<input id="searchProduct3" type="text" name="food" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${takefood}" required placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="new-wide-wrap new-wide-wrap-070">
			<div class="left-wing  ">
			    <ul class="sm-menu-wrap">
			        
			    </ul>
			</div>
			<c:forEach items="${foodlist }" var="foodlist">
				<div class="food-box">
				<form action="/food/intakefood.do">
				<div class="food-info">${foodlist.foodname}에 대한 정보</div>
				<input name="no" value="${foodlist.no }" type="hidden"/>
				  <!--
				  <div class="label-value-container">
				    <div class="label">음식 번호:</div>
				    <div class="value">${foodlist.no}</div>
				  </div>
				   --> 
				  <div class="label-value-container toggle">
				    <div class="label">음식 이름:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.foodname}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">제조사:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.company}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">1회 섭취량:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.oneprovide} ${foodlist.capacity}</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">칼로리:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.calorie} kcal</div>
				  </div>
				  
				  <div class="label-value-container toggle">
				    <div class="label">탄수화물:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.carbohydrate} g</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">총 당류:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.sugar} g</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">식이섬유:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.dietaryfiber} g</div>
				  </div>
				  
				  <div class="label-value-container toggle">
				    <div class="label">단백질:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.protein} g</div>
				  </div>
				  
				  <div class="label-value-container toggle">
				    <div class="label">지방:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.fat} g</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">포화 지방:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.saturatedfat} g</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">불포화 지방:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.unsaturatedfat} g</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">트랜스 지방:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.transfat} g</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">콜레스테롤:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.cholesterol} mg</div>
				  </div>
				  
				  <div class="label-value-container">
				    <div class="label">나트륨:</div>&nbsp;&nbsp;&nbsp;
				    <div class="value">${foodlist.sodium} mg</div>
				  </div>
				<div class="label-value-container" style="display: flex; justify-content: right; align-items: center;">
					<p>일일 섭취 횟수 :</p>&nbsp;&nbsp;
					<input name="re" type="number" style="width: 40px; border-radius:  10px 10px 10px 10px;text-align: center;" value="1">
				</div>
				<div class="label-value-container" style="display: flex; justify-content: right; align-items: center;">
				  	<button id="ingestionbtn" style="border: 1px solid black">섭취</button>
				</div>
				</form>
				</div>
			</c:forEach>
		</div>
	</div>
	<a id="goto_top" href="#" title="맨 위로"></a><!-- 위로가기 -->
</div><!-- all-wrap의 끝 -->
<script>
        if ($(this).scrollTop() > 20) {
            $('#goto_top').fadeIn();
            $('.f-footer-row1').addClass('active');
            $('.h-header').addClass('scroll');
            $('.all-wrap-in').addClass('scroll');
        } else {
            $('#goto_top').fadeOut();
            $('.h-header').removeClass('scroll');
            $('.all-wrap-in').removeClass('scroll');
        }

        /*화면 스크롤에 따른 조건부 노출 : 최하단 고정 행, 위로가기 버튼 */
        $(window).scroll(function() {
            if ($(this).scrollTop() > 20) {
                $('#goto_top').fadeIn();
                $('.f-footer-row1').addClass('active');
                $('.h-header').addClass('scroll');
                $('.all-wrap-in').addClass('scroll');
            } else {
                $('#goto_top').fadeOut();
                $('.h-header').removeClass('scroll');
                $('.all-wrap-in').removeClass('scroll');
            }

            /*우측 플로팅 영역관련*/
            var height1 = $(window).scrollTop();
            /*var rfixed = $('.r-fixed-area');
            var section1 = rfixed.offset().top;*/

            if(height1 > 200){
                $('.height1.active').addClass('fixed');
            }else{
                $('.height1.active').removeClass('fixed');
            }

            if(height1 > 6){
                $('.height2.active').addClass('fixed');
            }else{
                $('.height2.active').removeClass('fixed');
            }
        });

        $('#goto_top').click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
        var myChart1 = {
        		  init : function(){
        		    myChart1.chart_line();
        		    myChart1.chart_doughnut.init_doughnut();
        		  },
        		  
        		  // 차트 - 라인
        		  chart_line : function(){
        		    
        		  }, 
        		  
        		  // 차트 - 도넛   
        		  chart_doughnut : {
        		    init_doughnut : function(){
        		      myChart1.chart_doughnut.chart_1();
        		    },
        		    chart_1 : function(){    
        		      var chart = document.getElementById("chart_doughnut_1");
        		      var data = {
        		          labels: ["탄수화물","지방","단백질"],
        		          datasets: [
        		              {
        		                  data: [${carbohydrate}, ${fat}, ${protein}],
        		                  backgroundColor: [
        		                      "#f23456",
        		                      "#afff2a",
        		                      "#f5dc5a"
        		                  ],
        		                  hoverBackgroundColor: [
        		                      "#123456",
        		                      "#654321",
        		                      "#456123"
        		                  ]
        		              }]
        		      };
        		      var myDoughnutChart = new Chart(chart, {
        		          type: 'doughnut',
        		          data: data,
        		          options: {
        		              responsive: true,
        		              legend: false,
        		              title: {
        		                  display: false,
        		                  text: 'Chart.js Doughnut Chart'
        		              },
        		              animation: {
        		                  animateScale: true,
        		                  animateRotate: true
        		              },
        		              tooltips: {
        		                  callbacks: {
        		                      label: function(tooltipItem, data) {
        		                          var dataset = data.datasets[tooltipItem.datasetIndex];
        		                          var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
        		                              return previousValue + currentValue;
        		                          });
        		                          var currentValue = dataset.data[tooltipItem.index];
        		                          var precentage = Math.floor(((currentValue/total) * 100)+0.5);
        		                          return data.labels[tooltipItem.index] + " : " + precentage + " %";
        		                      },
        		                       mode: 'label'
        		                  }
        		              },
        		              cutoutPercentage:40,
        		          },
        		      });
        		    },
        		    // 차트1
        		  }
        		}
        		myChart1.init();
        
        
</script>
<script>
		    var dailyCalories = ${dailyCalories};
		    console.log('dailyCalories : ' + ${dailyCalories})
		    // 계산된 칼로리 출력
		    var resultElement = document.getElementById('result');
		    resultElement.innerHTML = "하루에 필요한 칼로리: " + dailyCalories.toFixed(2) + "kcal";
		    var Cbhrate = (${dailyCalories}*(${Cbhrate}/100))/4;
		    var Prorate = (${dailyCalories}*(${Prorate}/100))/4;
		    var Fatrate = (${dailyCalories}*(${Fatrate}/100))/9;
		    var resultCbhElement = document.getElementById('resultCbh');
		    var resultPRoElement = document.getElementById('resultPro');
		    var resultFatElement = document.getElementById('resultFat');
		    resultCbhElement.innerHTML = "먹어야 하는 탄수화물: " + Cbhrate.toFixed(2) + "g";
		    resultPRoElement.innerHTML = "먹어야 하는 단백질: " + Prorate.toFixed(2) + "g";
		    resultFatElement.innerHTML = "먹어야 하는 지방: " + Fatrate.toFixed(2) + "g";
		    var myChart = {
	        		  init : function(){
	        		    myChart.chart_line();
	        		    myChart.chart_doughnut.init_doughnut();
	        		  },
	        		  
	        		  // 차트 - 라인
	        		  chart_line : function(){
	        		    
	        		  }, 
	        		  
	        		  // 차트 - 도넛   
	        		  chart_doughnut : {
	        		    init_doughnut : function(){
	        		      myChart.chart_doughnut.chart_2();
	        		    },
	        		    chart_2 : function(){    
	        		      var chart = document.getElementById("chart_doughnut_2");
	        		      var data = {
	        		          labels: ["탄수화물","단백질","지방"],
	        		          datasets: [
	        		              {
	        		                  data: [Cbhrate,Prorate , Fatrate],
	        		                  backgroundColor: [
	        		                      "#f23456",
	        		                      "#afff2a",
	        		                      "#f5dc5a"
	        		                  ],
	        		                  hoverBackgroundColor: [
	        		                      "#123456",
	        		                      "#654321",
	        		                      "#456123"
	        		                  ]
	        		              }]
	        		      };
	        		      var myDoughnutChart = new Chart(chart, {
	        		          type: 'doughnut',
	        		          data: data,
	        		          options: {
	        		              responsive: true,
	        		              legend: false,
	        		              title: {
	        		                  display: false,
	        		                  text: 'Chart.js Doughnut Chart'
	        		              },
	        		              animation: {
	        		                  animateScale: true,
	        		                  animateRotate: true
	        		              },
	        		              tooltips: {
	        		                  callbacks: {
	        		                      label: function(tooltipItem, data) {
	        		                          var dataset = data.datasets[tooltipItem.datasetIndex];
	        		                          var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
	        		                              return previousValue + currentValue;
	        		                          });
	        		                          var currentValue = dataset.data[tooltipItem.index];
	        		                          var precentage = Math.floor(((currentValue/total) * 100)+0.5);
	        		                          return data.labels[tooltipItem.index] + " : " + precentage + " %";
	        		                      },
	        		                       mode: 'label'
	        		                  }
	        		              },
	        		              cutoutPercentage:40,
	        		          },
	        		      });
	        		    },
	        		    // 차트2
	        		  }
	        		}
	        		myChart.init();
</script>
<script>
const openModalBtn = document.getElementById('openModal');
const modal = document.getElementById('modal');
const modalContent = document.querySelector('.modal-content');

openModalBtn.addEventListener('click', () => {
    modal.style.display = 'flex';
});

modalContent.addEventListener('click', (event) => {
    event.stopPropagation();
});

window.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const parentContainer = document.querySelector("#parent-container");
    const inputSection = document.querySelector(".label-value-container input[name='re']");

    parentContainer.addEventListener("click", function (event) {
        if (event.target === inputSection) {
            return;
        }

        if (event.target.classList.contains("food-box")) {
            event.target.classList.toggle("expanded");
        }
    });
});

</script>
</body>
</html>