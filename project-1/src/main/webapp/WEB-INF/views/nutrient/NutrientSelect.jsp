<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
        .topContainer {
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
    font-weight: bold;
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

    <div class="container topContainer pb-5" style="margin-top: 100px;">
        <div>
            <ul class="nav">
                <li class="nav-item col-3">
                    <a style="font-size: 18px; cursor: pointer;" class="nav-link active" onclick="openTab(event, 'popular')" >인기 영양소</a>
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
        <div>
            <div id="popular" class="tab active border-0">
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
	        // Remove immediate display and directly apply fade-in effect
	        currentTab.style.opacity = 0;
	        currentTab.style.filter = 'alpha(opacity=0)';
	        currentTab.style.border = 0;
	        fadeInTab(currentTab);  // 선택한 탭 컨텐츠를 페이드인으로 보이게 함
	
	        evt.currentTarget.classList.add("active");  // 선택한 탭 링크에 'active' 클래스 추가
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
        
    </script>

</body>
</html>