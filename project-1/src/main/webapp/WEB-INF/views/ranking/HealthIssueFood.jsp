<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<jsp:include page="/WEB-INF/views/template/SelectFoodListStyleScript.jsp"/>

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
     </style>
<style>
  #healthIssueSelect {
    background-color: #ffffff;
    color: #333;
    width: 870px;
  	margin-left: 35px;
  }

  /* 마우스로 select 요소를 호버할 때의 스타일을 지정합니다 */
  #healthIssueSelect:hover {
    background-color: #ffffff;
    width: 870px;
  	margin-left: 35px;
  }

  /* select 요소가 드롭다운될 때의 스타일을 지정합니다 */
  #healthIssueSelect:focus {
    outline: none;
    border-color: ffff;
    width: 870px;
  	margin-left: 35px;
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
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b><span> ${healthissue}</span>에 좋은 제품 검색결과 </b><span> ${listsize}</span>건</h1>
					</div>
					<div class="ipt-main-wrap">
					<form id="healthIssueForm" action="/functionfood/healthissue.do" method="GET" >
						<div class="ipt-main-wrap-in">
							<select  id="healthIssueSelect" onchange="submitForm()" class="ipt-main">
								<option value="피로감">피로감</option>
								<option value="스트레스 & 수면">스트레스 & 수면</option>
								<option value="노화 & 항산화">노화 & 항산화</option>
								<option value="면역 기능">면역 기능</option>
								<option value="빈혈">빈혈</option>
								<option value="눈 건강">눈 건강</option>
								<option value="갑상선 건강">갑상선 건강</option>
								<option value="호흡기 건강">호흡기 건강</option>
								<option value="소화 & 위식도 건강">소화 & 위식도 건강</option>
								<option value="간 건강">간 건강</option>
								<option value="장 건강">장 건강</option>
								<option value="뼈 건강">뼈 건강</option>
								<option value="관절 건강">관절 건강</option>
								<option value="탈모 & 손톱 건강">탈모 & 손톱 건강</option>
								<option value="피부 건강">피부 건강</option>
								<option value="두뇌활동">두뇌활동</option>
								<option value="운동 능력 & 근육량">운동 능력 & 근육량</option>
								<option value="혈압">혈압</option>
								<option value="혈당">혈당</option>
								<option value="혈관 & 혈액순환">혈관 & 혈액순환</option>
								<option value="혈중 중성지방">혈중 중성지방</option>
								<option value="혈중 콜레스테롤">혈중 콜레스테롤</option>
								<option value="체지방">체지방</option>
								<option value="치아 & 잇몸">치아 & 잇몸</option>
								<option value="남성 건강">남성 건강</option>
								<option value="여성 건강">여성 건강</option>
								<option value="임산부 & 태아 건강">임산부 & 태아 건강</option>
								<option value="여성 갱년기">여성 갱년기</option>
							</select>
						</div>
					</form>
					</div>
					<div class="new-wide-wrap new-wide-wrap-070">
						<div class="left-wing  ">
						    <ul class="sm-menu-wrap">
						    </ul>
						</div>
						<div class="new-wide-main new-wide-main-070 product-result">
							<div id="itemList" class="item-cards">
								<c:forEach items="${listData}" var="item">
									<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
									<c:if test="${not empty item.imgURL}">
										<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
									</c:if>
			          				<c:if test="${empty item.imgURL}">	
										<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
									</c:if>
										<span class="txt1">${item.company}</span>
										<span class="txt2" style="max-width: 260px;">${item.productName}</span>
										<div class="review">
											<span class="star-point">&nbsp;<fmt:formatNumber value="${item.AVG_Score }" pattern=".00"  var="AVG"/>${AVG }</span>
											<span class="txt3">(${item.REVIEW_Count }개)</span>
										</div>
										<div class="card-tags">
											<c:set var="materialList" value="${fn:split(item.material, '$')}" />
											<c:forEach items="${materialList}" var="mater">
												<div class="card-tag">${mater }</div>
											</c:forEach>
										</div>
									</a>
								</c:forEach>
								<c:forEach items="${listData2}" var="item">
									<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
									<c:if test="${not empty item.imgURL}">
										<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
									</c:if>
				         			<c:if test="${empty item.imgURL}">	
										<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
									</c:if>
										<span class="txt1">${item.company}</span>
										<span class="txt2" style="max-width: 260px;">${item.productName}</span>
										<div class="review">
											<span class="star-point">&nbsp;0</span>
											<span class="txt3">(0개)</span>
										</div>
										<div class="card-tags">
										<c:set var="materialList" value="${fn:split(item.material, '$')}" />
											<c:forEach items="${materialList}" var="mater">
												<div class="card-tag">${mater }</div>
											</c:forEach>
										</div>
									</a>
								</c:forEach>
							</div><!-- item-cards의 끝 -->
						</div>
				<!--<button id="moreBtn" tabindex="0" class="item-more" onclick="searchMore()">30개 더 보기</button>  -->
			</div>
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
</script>
<script>
		function submitForm() {
			var selectedValue = document.getElementById("healthIssueSelect").value;
			window.location.href = "/functionfood/healthissue.do?healthissue=" + encodeURIComponent(selectedValue);
		}
	</script>
	<!-- 건강 고민 선택 드롭다운 메뉴 -->
	
</body>
</html>