<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- MyPage.jsp -->
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<!-- 로그인 후에만 들어올 수 있도록 -->
<style>
	a:hover{
		text-decoration: none;
		color: rgb(13, 184, 193);
	}
	a{
		color: black;
	}
	.borderline{
		border: solid 1.5px lightgrey;
	}
	.custom-file-input:lang(en)~.custom-file-label::after {
        content: "파일찾기";
    }
</style>
<body>
	<div class="container" style="margin-top: 100px">
		<div class="rounded-lg borderline p-3 mb-3 shadow">
			<div class="row d-flex px-3 py-3">
				<c:if test="${info.profImgFl eq 'Y' }" var="isProfImg">
					<c:set var="uploadFolder" value="${fn:split(profImg.pLocation,'\\\\')[fn:length(fn:split(profImg.pLocation, '\\\\'))-1] }"/>
					<img class="rounded-circle" alt="사용자 이미지" src="<c:url value="/${uploadFolder }/${profImg.pName }.${profImg.pExtension }" />" style="width: 80px; height: 80px">
				</c:if>
				<c:if test="${not isProfImg }">
					<img class="rounded-circle" alt="기본 프로필" src="<c:url value="/images/friend.png" />" style="width: 80px; height: 80px">
				</c:if>
				<span class="align-self-center mr-auto ml-2" style="font-weight: bold">
					${info.id }
				</span>
				<input type="button" id="imgEdit" value="이미지 수정" class="btn btn-outline-info align-self-center mx-2" data-target="#modalView" data-backdrop="static"/>
				<a type="button" href="" class="btn btn-outline-info align-self-center" data-target="#modalView" data-backdrop="static">회원정보 수정</a>
			</div>
			<div id="btnType" class="row border-top px-3 pt-3">
				<c:if test="${not empty bRecent or not empty bmRecent }" var="isEmptyBtn">
					<a type="button" class="btn btn-info" href="#">전체보기</a>
					<a type="button" class="mx-2 btn btn-info" href="#">게시물</a>
					<a type="button" class="btn btn-info" href="#">북마크</a>
				</c:if>
				<c:if test="${not isEmptyBtn }">
					최근 활동한 내역이 없어요...
				</c:if>
			</div>
		</div>
		<div class="row">
			<c:if test="${empty bRecent or empty bmRecent }" var="isEmpty">
				<img src="images/empty.jpg" alt="Image" class="img-fluid mt-n1 mx-auto" style="max-height: 400px"/>
			</c:if>
			<c:if test="${not isEmpty }">
				<!-- 게시글 작성 활동 폼 -->
				<div class="col-md-6 board">
					<c:forEach var="bList" items="${bRecent }">
						<div class="rounded-lg borderline p-3 mt-2 shadow">
							<div class="row d-flex">
								<div class="mx-3">
									<i class="fa-regular fa-pen-to-square text-primary"></i>
								</div>
								<div class="mr-auto">
									<div class="row-6">
										<span class="text-muted">게시글을 작성 했습니다</span>
										<span class=small>${bList.postDate }</span>
									</div>
									<div class="row-6">
										<span ><a href="<c:url value="/JoHyeIn/View.do?no=${bList.no }"/>">${bList.title }</a></span>
										<span class="small text-muted">${bList.id }</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- 북마크 작성 활동 폼 -->
				<div class="col-md-6 bookmark">
					<c:forEach var="bmList" items="${bmRecent }">
						<div class="rounded-lg borderline p-3 mt-2 shadow">
							<div class="row d-flex">
								<div class="mx-3">
									<i class="fa-solid fa-bookmark text-success"></i>
								</div>
								<div class="mr-auto">
									<div class="row-6">
										<span class="text-muted">북마크에 저장했습니다</span>
										<span class="small">${bmList.bmDate }</span>
									</div>
									<div class="row-6">
										<span><a href="<c:url value="/JoHyeIn/View.do?no=${bmList.no }"/>">${bmList.title }</a></span>
										<span class="small text-muted">${bmList.boardId }</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
		<!-- 북마크 취소 작성 활동 폼 -->
		<!-- 
		<div class="rounded-lg borderline p-3 mt-2 shadow">
			<div class="row d-flex">
				<div class="mx-3">
					<i class="fa-regular fa-bookmark text-success"></i>
				</div>
				<div class="mr-auto">
					<div class="row-6">
						<span>북마크 저장을 취소했습니다</span>
						<span class=small>누른 날/시간</span>
					</div>
					<div class="row-6">
						<span>제목</span>
						<span class=small>아이디</span>
					</div>
				</div>
			</div>
		</div>
		 -->
	</div>
	<!-- 수정/삭제시 사용할 모달 시작 -->
	<div class="modal fade" id="modalView">	
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">모달 헤더</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body d-flex justify-content-center" style="height: 130px">
					<form class="form-inline justify-content-center" action="" method="POST">
						<input type="hidden" name="mode" value="editBtn"/>			
						<input type="hidden" name="id" value="${info.id }"/>
						<input type="password" name="password" class="form-control mx-2" placeholder="비밀번호를 입력하세요"/>
						<div class="custom-file" style="width: 300px; display: none">
				            <input type="file" class="custom-file-input" name="profImg" id="customFile" accept=".jpg,.img,.png,.bmp,.gif">
				            <label class="custom-file-label justify-content-start" for="customFile">${empty profImg ? "파일 선택" : profImg.pName+='.'+=profImg.pExtension }</label>
				        </div>
				        <a type="button" name="defaultImg" href="<c:url value="/JoHyeIn/ProfImgEdit.do"/>" class="btn btn-outline-info mx-2" style="display: none">기본이미지로 변경</a>
						<input type="button" class="btn btn-info mx-2" value="확인" />
					</form>			
				</div>
			</div>
		</div>
	</div>
	<!-- 수정/삭제시 사용할 모달 끝 -->
</body>
</html>
<script>
	//게시물,북마크,최근활동 클릭 시 이벤트 처리
	var btnType = document.querySelectorAll('#btnType a[type=button]');
	btnType.forEach(function(target){
		target.onclick=function(){
			document.querySelector('.bookmark').style.display='';
			document.querySelector('.board').style.display='';
			switch(this.textContent){
				case "게시물":
					document.querySelector('.bookmark').style.display='none';
					break;
				case "북마크":
					document.querySelector('.board').style.display='none';
					break;
				default:
			}
		};
	})
	
	//이미지 수정하기
	$('#imgEdit').click(function(){
		$(this).attr('data-toggle','modal');
		$('form').attr('action','<c:url value="/JoHyeIn/ProfImgEdit.do"/>');
		$('form').attr('enctype','multipart/form-data');
		$('.modal-title').html('수정할 프로필 이미지를 선택해주세요');
		$('input[type=password]').css('display','none');
		$('.custom-file').css('display','');
		$('a[name=defaultImg]').css('display','');
		
		$(".custom-file-input").on("change", function() {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings().html(fileName);
        });
	})

	//회원 정보 수정하기
	$('#imgEdit').next().click(function(){
		$(this).attr('data-toggle','modal');
		$('form').attr('action','<c:url value="/project/Password.do"/>');
		$('.modal-title').html('회원정보 수정을 위해 비밀번호를 입력해주세요');
		$('.custom-file').css('display','none');
		$('a[name=defaultImg]').css('display','none');
		$('input[type=password]').css('display','');
	});
	</script>