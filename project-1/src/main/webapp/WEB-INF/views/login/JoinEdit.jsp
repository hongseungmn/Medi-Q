<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
	input[type='date']::before {
	  content: attr(data-placeholder);
	  width: 100%;
	}
	
	.show{
		display: block;
		color: red;
		font-size: small;
		font-weight: bold;
	}
	.blue{
		color: blue;
	}
	.black{
		color: black;
	}
	
	.hide{
		display: none;
	}
</style>
<div class="container" style="margin-top: 80px">
	<div class="container">
		<div class="row d-flex justify-content-center align-items-center vh-100">
			<div class="col-md-6 mb-4">
				<h3 class="heading mb-4">내 정보 수정하기</h3>
				<p>
				<span class="text-info" style="font-size: 1.3rem">${info.id }</span>님 안녕하세요!<br/>
				회원정보 수정 양식을 입력해주세요
				</p>
				<p>
					<img src="<c:url value="/images/basic/joinEdit.jpg"/>" alt="Image" class="img-fluid"/>
				</p>
			</div>
			<div class="col-md-6 d-flex align-items-center mt-3">
				<form class="mb-5 needs-validation" action="<c:url value="${info.social_Fl=='Y' ? '/project/JoinEditSocialOk.do' : '/project/JoinEditOk.do' }" />" method="post" id="contactForm" novalidate>
					<input type="hidden" name="mode" value="edit"/>
					<div class="row">
						<div class="col-md-12 form-group">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden" name="first" value="${first}"/>
							<input type="hidden" name="token" value="${token}"/>
							<div class="d-flex">
								<input style="width: 300px;" type="text" class="form-control" placeholder="아이디" id="id" name="id" value='${info.id}' readonly/> 
							</div>
							<input style="width: 300px;" type="password" class="form-control my-1" id="password" placeholder="비밀번호" name="password" ${info.social_Fl eq "Y" ? "hidden" : "required" }/>
							<input style="width: 300px;" type="password" class="form-control" id="pwd" placeholder="확인용 비밀번호" name="pwd" ${info.social_Fl eq "Y" ? "hidden" : "required" }/>
							<input style="width: 300px;" type="text" class="form-control my-1" id="email" placeholder="이메일" name="email" value="${info.email }" ${info.social_Fl eq "Y" ? "hidden" : "readonly" }/>
								
							<!-- 글자색 빨간색, bold 주기 -->
							<div id="passwordOK" class="hide">비밀번호 8~16자의 영문(대/소문자),숫자,특수문자를 입력하세요</div>
							<div id="pwdOK" class="hide">동일한 비밀번호가 아닙니다</div>	
							<div id="emailOK" class="hide">잘못된 이메일 형식입니다</div>
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group"> 
							<input style="width: 300px;" type="text" class="form-control" id="name" placeholder="이름" name="name" value="${info.name }" required/>
							<!-- 정규표현식에 맞게 문구변경 -->
							<c:set var="userBirth" value="${fn:split(info.birth,' ')[0] }"/>
							<input style="width: 300px;" type="date" class="form-control my-1" id="birth" name="birth" value="${userBirth }" data-placeholder='${empty userBirth ? "생년월일" : userBirth}' required aria-required="true"/>
							<div class="d-flex align-items-center">
								<div class="custom-control custom-radio"><!-- radio box도 무조건 required??? -->
									<input type="radio" class="custom-control-input" name="gender" id="male" value="M" ${info.gender eq "M" ? "checked" :"" } required/>
									<label class="custom-control-label mr-3" for="male">남자</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="gender" id="female" value="F" ${info.gender eq "F" ? "checked" :"" }/> 
									<label class="custom-control-label" for="female">여자</label>
								</div>
							</div>
							
							<div id="nameOK" class="hide">한글이름 2글자 이상 입력해주세요</div>
							<div id="birthOK" class="hide">생년월일을 선택해주세요</div>
							<div id="genderOK" class="hide">성별을 선택해주세요</div>
						</div>
					</div>
					<button type="submit" class="btn btn-outline-primary">확인</button>
				</form>
			</div>
		</div>
	</div>
</div>
<c:set var="social" value="${info.social_Fl=='Y' }"/>
</body>
<script>
	//오늘 이전 날짜만 선택할 수 있도록
	var birth = document.querySelector('input[type=date]');
	
	var now_utc = Date.now() // 지금 날짜를 밀리초로
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0]; //오늘 날짜
	birth.setAttribute("max", today);
	
	//캘린더 값이 변경될 때 바로 변하도록(data-placeholder 때문)
	birth.onchange = function(){
		if(birth.value != '생년월일'){
			//console.log(birth.value)
			birth.dataset.placeholder = birth.value;
		}
	}
	
	//change로 유효성 확인하기
	var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#\$%\^&\*\(\)\+\|\=\-])[A-Za-z\d~!@#\$%\^&\*\(\)\+\|\=\-]{8,16}$/;
	var reg_email = /^(?=.*[A-Za-z])(?=.*\d)[a-z][a-z0-9]{5,11}@[a-z]{3,8}\.(com|net|co\.kr)$/;
	var reg_name = /^(?=.*[가-힣])[가-힣]{2,}$/;
	var social = '<c:out value="${social}"/>';

	$('#password').on('input',function(){
		if(!reg_pwd.test($(this).val())){
			$('#passwordOK').html('비밀번호 8~16자의 영문(대/소문자),숫자,특수문자를 입력하세요').removeClass('hide').addClass('show');
		}
		else{
			$('#passwordOK').html('사용가능한 비밀번호입니다').addClass('blue');
		}
	})////////////
		
	$('#pwd').on('input',function(){
		if($('#password').val() !== $(this).val()){
			$('#pwdOK').html('입력한 비밀번호와 다릅니다').removeClass('hide').addClass('show');
		}
		else{
			$('#pwdOK').html('입력한 비밀번호와 동일합니다').addClass('blue');
		}
	})//////////////////
	
	$('#name').on('input',function(){
		if(!reg_name.test($(this).val())){
			$('#nameOK').html('한글이름 2글자 이상 입력해주세요').removeClass('hide').addClass('show');
		}
		else{
			$('#nameOK').html('');
		}
	})/////////////
	
	//자바스크립트 유효성 검사
	document.forms[0].onsubmit = function(e){

		if(!this.checkValidity()){
            this.classList.add('was-validated'); //div에 지정한 valid/invalid 메시지 뿌리기 위해
            
            if(!social){//일반 회원일 때만
	            if(!$('#password').val()){
	            	$('#passwordOK').removeClass('hide').addClass('show');
	            }
	            else{
	            	$('#passwordOK').removeClass('show').addClass('hide');
	            }
	            if(!$('#pwd').val()){
	            	$('#pwdOK').removeClass('hide').addClass('show');
	            }
	            else{
	            	$('#pwdOK').removeClass('show').addClass('hide');
	            }
	            if(!$('#email').val()){
	            	$('#emailOK').removeClass('hide').addClass('show');
	            }
	            else{
	            	$('#emailOK').removeClass('show').addClass('hide');
	            }
            }

            if(!reg_name.test($('#name').val())){
            	$('#nameOK').removeClass('hide').addClass('show');
            }
            else{
            	$('#nameOK').removeClass('show').addClass('hide');
            }
            if(!$('#birth').val()){
            	$('#birthOK').removeClass('hide').addClass('show');
            }
            else{
            	$('#birthOK').removeClass('show').addClass('hide');
            }

            //console.log($('input[name=gender]:checked').val())
            if(!$('input[name=gender]:checked').val()){
            	$('#genderOK').removeClass('hide').addClass('show');
            }
            else{
            	$('#genderOK').removeClass('show').addClass('hide');
            }
            
            e.preventDefault();//이벤트 취소
        }
	};
	
</script>
</html>