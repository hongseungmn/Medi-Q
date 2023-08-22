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
    
<div class="all-wrap">
	<div class="all-wrap-in all-wrap-in-070">
		<div class="ingredient-search-top">
			<div class="content" style="background-color:#fdfbf6; padding-bottom: 20px;">
			<!-- 건기식 또는 회사이름을 적었을 경우 -->
			<c:if test="${not empty foodname}">
				<div class="top-wrap-070">
					<h1 class="txt2 text-center" style="margin-bottom: 30px; font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<span>💡 ${foodname}</span>에 대한 <br class="u680">제품 검색 결과 <span>${listData.size() + listData2.size()}</span>건</h1>
				</div>
				<div class="ipt-main-wrap">
				<c:if test="${casesel == 1 }">
					<form action="/functionfood/select.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct1" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct1()"></button>
							<button type="button" class="d-flex justify-content-center align-items-center" id="searchBtn" data-toggle="modal" data-target="#searchModal">
								<img id="camera_icon" src="<c:url value='/images/chatbot/camera_icon.png'/>">
							</button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/select.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 2}">
					<form action="/functionfood/selectnutrient.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct2" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct2()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectnutrient.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 3}">
					<form action="/functionfood/selectcompany.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct3" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
				<div class="search-etc">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
						<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<a tabindex="0" class="search-keyword" href="/functionfood/selectcompany.do?foodname=${Keyword }">${Keyword }</a>
						</c:forEach>
					</div>
				</div>
				</c:if>
				
			</div>
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
							<span class="txt2">${item.productName}</span>
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
						<span class="txt2">${item.productName}</span>
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
			</c:if>
				<!-- 화면을 처음들어 갔을 경우 건기식 또는 회사이름을 안적었을 경우 -->
				<c:if test="${empty foodname}">
				<c:if test="${casesel == 1 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b>💊 현재 인기있는 <span> 건강기능식품</span></b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/select.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct1" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button type="button" class="d-flex justify-content-center align-items-center" id="searchBtn" data-toggle="modal" data-target="#searchModal">
								<img id="camera_icon" src="<c:url value='/images/chatbot/camera_icon.png'/>">
							</button>
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct1()"></button>
							
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/select.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 2 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b>💊 현재 인기있는 <span> 영양소</span>로 검색해 보세요</b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/selectnutrient.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct2" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct2()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectnutrient.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 3 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b><span> 제품명</span>과<span> 회사명</span>으로 검색해 보세요</b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/selectcompany.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct3" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectcompany.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
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
							<span class="txt2">${item.productName}</span>
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
				</div><!-- item-cards의 끝 -->
				
				</c:if>
				<!--<button id="moreBtn" tabindex="0" class="item-more" onclick="searchMore()">30개 더 보기</button>  -->
			</div>
		</div>
	</div>
	<a id="goto_top" href="#" title="맨 위로"></a><!-- 위로가기 -->
</div><!-- all-wrap의 끝 -->
<style>
	#searchBtn{
		width:60px;
		height:60px;
		border-radius:30px;
		background-color:#EF605D;
		position:relative;
		left:965px;
		top:2px;
		z-index:50;
	}
	#camera_icon{
		width:30px;
		height:30px;
	}
</style>
<!-- ocr 추가 부분 -->
<div class="modal fade" id="searchModal">
	<div class="modal-dialog modal-dialog-centered" style="width:480px;">
		<div class="modal-content">
			<!-- 타이틀 부분 -->
			<div class="modal-header d-flex flex-wrap justify-content-center align-items-center p-0 m-0">
				<h2 class="font-weight-bold p-0 ml-5">사진으로 영양제 검색</h2>
				<button type="button" class="close_btn p-0 m-0 text-info" style="font-size:35px; position:relative; left:40px;" data-dismiss="modal">&times;</button>
			</div>
			<!-- 사진 출력 부분 -->
			<div class="modal-body m-2" style="width:400px; height:380px; position:relative; left:50px;">
				<div class="d-inline-flex justify-content-center pb-2">
					<input type="file" id="file_photo" accept="image/*" hidden>
					<input type="text" id="file_text" class="ml-3" style="height:38px;">
					<button type="button" id="btn_search" class="btn btn-primary ml-2">사진 찾기</button>
				</div>
				<div id="preview" class="d-flex justify-content-center align-items-center m-3" style="width:280px;height:280px;"></div>
			</div>
			<!-- 버튼 부분 -->
			<div class="modal-footer d-flex justify-content-center">
				<form action="/searchphotono.do" class="d-flex align-content-center" method="GET">
					<input type="text" class="border border-info" id="searchPhoto" name="searchPhotoName" style="width:300px; height:38px;">
					<button type="submit" class="btn btn-danger ml-3" id="search_btn">검색</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- ocr 추가 부분 끝 -->
<script>
/* 파일 선택 관련 시작 */
window.addEventListener('DOMContentLoaded',function(){
    var file = document.querySelector('#file_photo');
    var button = document.querySelector('#btn_search');
    var text = document.querySelector('#file_text');
    var preview = document.querySelector('#preview');
    var currentImage = null;
    
    $(document).ready(function(){
    	$('#searchBtn').click(function(){
    		$("#searchModal").modal({backdrop: "static" });
    	});
    });

    button.onclick = function(){
        var evt = new MouseEvent("click", {
            bubbles: true,
            cancelable: true,
            view: window,
        });
        file.dispatchEvent(evt);
    };

    file.onchange = function(e){
        console.log('파일 선택 완료:', e.target.value);
        var path = e.target.value.split('\\');
        text.value = path[path.length - 1];
        
        if (currentImage) {
            preview.removeChild(currentImage);
            currentImage = null;
        }
        
        const selectedFile = e.target.files[0];

        if (selectedFile) {
            const reader = new FileReader();

            reader.onload = function(e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                //img.style.maxWidth = '95%';
                img.style.height = '100%';

                currentImage = img;
                preview.appendChild(img);
                
				//Base64인코딩
    			var base64=e.target.result.split(",")[1];
    			//console.log(base64);
    			//여기서 Base64인코딩된 문자열을 Flask REST API서버로 전송한다
    			$.ajax({
    				url:"http://192.168.0.60:5000/ocr",
    				method:'post',
    				data:JSON.stringify({'base64':base64}),
    				contentType:"application/json",
    				dataType:'text'
    			}).done(function(data){
    				console.log('플라스크 서버로부터 받은 데이타:',data);
    				document.querySelector('#searchPhoto').value = data;
    			});
            };
            reader.readAsDataURL(selectedFile);
        }
    };
    
    $('.close_btn').click(function(e){
    	if(currentImage != null){
			preview.removeChild(currentImage);
			currentImage = null;
    	}
		document.querySelector('#file_text').value = '';
		document.querySelector('#searchPhoto').value = '';
	});
    
    $('#search_btn').click(function(e){
    	setTimeout(function() {
            document.querySelector('#file_text').value = '';
            document.querySelector('#searchPhoto').value = '';
        }, 1000);
    });
});
/* 파일 선택 관련 끝 */
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
</body>
</html>