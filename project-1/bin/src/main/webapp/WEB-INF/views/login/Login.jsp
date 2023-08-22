<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
	.social a:hover{
		text-decoration:none;
	}
</style>
<div class="img" style="background-image: url(<c:url value="/resources/images/bg.jpg" />); background-size: cover;">   
	<div class="container d-flex justify-content-center align-items-center vh-100">
		<div class="row justify-content-center">
			<div class="col">
				<div class="login-wrap p-0">
					<c:if test="${not empty searchPwd }">
						<c:set var="asterisks" value=""/>
						<c:forEach begin="0" end="${fn:length(searchPwd) - 4}" varStatus="loop">
							 <c:set var="asterisks" value="${asterisks}*"/>
						</c:forEach>
						<c:set var="searchPwdFn" value="${fn:substring(searchPwd, 0, 3)}${asterisks}"/>
					</c:if>
					<h1 class="mb-5 text-center">Login</h1>
					
					<c:if test="${! empty NOT_LOGIN }">
						<span class="font-weight-bold">${NOT_LOGIN }</span>
					</c:if>
					<form action="<c:url value="/project/Login.do" />" class="signin-form" method="POST">
						<div class="form-group">
							<input type="text" id="id" name="id" class="form-control" placeholder="Username" value="${username }"/>
						</div>
						<div class="form-group">
							<input type="password" id="password" name="password" class="form-control" placeholder="Password"/> 
						</div>
						<div class="form-group d-flex justify-content-between">
							<div class="custom-control custom-checkbox mb-3 align-self-center">
					            <!--label로 감싸지 말자 : 감싸면 체크 X-->
					            <input type="checkbox" class="custom-control-input" name="saveId" id="id-save" value="Y" ${empty username ? "" : "checked" }/>
					            <label class="custom-control-label" for="id-save"><h6>Remember Me</h6></label>
					        </div>
					        <div class="form-group">
							<button type="submit" class="form-control btn btn-primary submit px-3">
								Sign In
							</button>
						</div>
						</div>
					</form>
					<div class="social d-flex justify-content-between">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=16c1121d0de60f9066904fb3ffc57c36&redirect_uri=http://localhost:9090/project/kakaoLogin.do&response_type=code">
							<img src="<c:url value="/resources/images/kakao.png"/>" class="px-2 py-2 mr-md-1" />
						</a> <!-- 카카오로그인 -->
						<a href="https://nid.naver.com/oauth2.0/authorize?client_id=m0_NavLMe3aWfFRsood6&response_type=code&redirect_uri=http://localhost:9090/project/naverLogin.do&state=">
							<img src="<c:url value="/resources/images/naver.png"/>" class="px-2 py-2 mr-md-1" style="width: 100px"/>
						</a> <!-- 네이버로그인 -->
						<a href="#" id="searchId" class="px-2 py-2 mr-md-1 text-dark search" data-toggle="modal" data-target="#modalSearchIdNPwd" data-backdrop="static">
							<strong>아이디찾기</strong>
						</a> 
						<a href="#"	id="searchPwd" class="px-2 py-2 ml-md-1 text-dark search" data-target="#modalSearchIdNPwd" data-backdrop="static">
							<strong>비밀번호찾기</strong>
						</a>
						<a href="<c:url value="/project/Join.do" />" class="px-2 py-2 mr-md-1 text-dark">
							<strong>회원가입</strong>
						</a> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalSearchIdNPwd">	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content" style="width: 450px">
			<!-- Modal Header -->
			<div class="modal-header">
				<h5 class="modal-title">타이틀</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body d-flex justify-content-center" style="height: 190px">
				<form class="form-inline" action="" method="POST">
					<h6 class="ml-2 text">내용</h6>
					<input type="hidden" name="mode"/>
					<input type="text" class="form-control mx-2" name="email" placeholder="이메일 입력해주세요" style="width: 300px"/>
					<input type="text" class="form-control mx-2" name="user" placeholder="아이디를 입력해주세요" style="width: 300px; display: none"/>
					<input type="text" class="form-control mx-2 my-2" name="name" placeholder="이름를 입력해주세요"  style="width: 300px;"/>
					<a type="button" class="btn btn-info mx-3 submit">확인</a>
					<span id="checkOK" class="mx-3" style="display:none"></span>
				</form>			
			</div>
		</div>
	</div>
</div>
<script>
	//유효성 검사
	var form = document.forms[1];
	var span = document.querySelector('#checkOK');
	//console.log(form.email.style.display.length)
	form.onsubmit = function(e){
		var isValidate = false;
		if(!form.email.value){
			span.style.display='';
			span.style.color='red';
			span.textContent = '이메일을 입력해주세요';
			isValidate = false;
			return false;
		}
		else{
			isValidate = true;
		}
		
		if(!form.name.style.display){
			if(!form.name.value){
				span.style.display='';
				span.style.color='red';
				span.textContent = '이름을 입력해주세요';
				isValidate = false;
				return false;
			}
			else{
				isValidate = true;
			}
		}
		
		if(form.id.style.display.length){
			if(!form.id.value){
				span.style.display='';
				span.style.color='red';
				span.textContent = '아이디를 입력해주세요';
				isValidate = false;
				return false;
			}
			else{
				isValidate = true;
			}
		}
		
		if(!isValidate){
			return false;			
		}
		else{
			return true;
		}
	}
	
	var mode = document.querySelector('input[name=mode]');
	var searchTags = document.querySelectorAll('.search');
	
	searchTags.forEach(function(search) {
		search.onclick = function(e) {
			document.querySelector('input[name=name]').textContent='';
			document.querySelector('input[name=email]').value='';
			document.querySelector('input[name=user]').textContent='';
			span.textContent='';
			if(e.target.textContent === '아이디찾기'){
				mode.value = 'ID';
				document.querySelector('.modal-title').textContent = '아이디 찾기';
				document.querySelector('.text').textContent = "아이디를 찾기 위해 이메일과 이름을 입력해주세요";
				document.querySelector('input[name=user]').style.display='none';
				document.querySelector('input[name=name]').style.display='';
			}
			else if(e.target.textContent === '비밀번호찾기'){
				mode.value = 'PWD';
				e.target.parentElement.setAttribute("data-toggle", "modal");
				document.querySelector('.modal-title').textContent = '비밀번호 찾기';
				document.querySelector('.text').textContent = "비밀번호를 찾기 위해 이메일과 아이디를 입력해주세요";
				document.querySelector('input[name=user]').style.display='';
				document.querySelector('input[name=name]').style.display='none';
			}
	
		//아이디 비밀번호 찾기 ajax로 넘기기
		$('.submit').click(function(){
			$.ajax({
				url:'<c:url value="/project/SearchIdNPwd.do"/>',
				dataType:'json',
				data:{id:$('input[name=user]').val(),
						email:$('input[name=email]').val(),
						name:$('input[name=name]').val(),
						mode:$('input[name=mode]').val()}
			}).done(function(data){
				span.style.display='';
				span.style.color='black';
				if(data.mode=='ID'){
					span.innerHTML = "입력하신 이메일로 아이디 전송을 완료했습니다";
				}
				else{//이메일 보냈다고 문자남기기
					span.innerHTML = "입력하신 이메일로 비밀번호 전송을 완료했습니다";
				}
			}).fail(function(){
				console.log('error');
			});
		});
		
			}
	})
	
</script>
</body>
</html>