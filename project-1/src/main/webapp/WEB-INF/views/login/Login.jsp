<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
 :root{
    --background-theme:#e6e9f0;
    --text-color:#000;
}

*,html{
    margin:0px;
    padding:0px;
    font-size: .8rem;
    color: var(--text-color);
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body{
    width:100%;
    background-color:var(--background-theme);
}
h1{
    font-size: 3.2rem;
}
p{
  font-size: 1.2rem;  
}
/* Sections */
.login_section{
    min-height: 100vh;
    display: flex;
    align-items:center;
    position: relative;
    justify-content:center;
}

.accounts_container{
    height: 550px;
    min-height: 550px;
    max-height: 100%;
    border-radius:10px;
    box-shadow: 8px 8px 8px rgba(0,0,0,0.1);
    background-color: #fcfcfc;
    overflow: hidden; 
}


.accounts_image img{
    object-fit: cover;
    object-position: center;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}
.accounts_col form .form-group{
    position: relative !important;
}
.accounts_col form .form-control{
    font-size:1.6rem;
    padding:20px 10px;
    margin-bottom:20px;
    background:transparent !important;
}
.accounts_col form label{
	position:absolute;
    z-index: 1;
    pointer-events: none;
    top: 50%;
    transform: translateY(-50%);
    font-size:1.2rem;
    left:10px;
}
.accounts_col form .form-group i{
    position:absolute;
    z-index: 1;
    pointer-events: none;
    top: 50%;
    transform: translateY(-50%);
    font-size:1.2rem;
    left:10px;

}
.accounts_col form label{
    transition: .2s linear;
}
.change_label{
    background-color:#fcfcfc;
    transition: .2s linear;
    transform: scale(0.8);
    top:0 !important;
}
.accounts_col form .form-group i{
    left:90% !important;
    cursor: pointer;
    pointer-events:visible;
}
.register_btn{
    padding:10px 0!important;
    font-size: 1.6rem !important;
    font-weight: 600 !important;

}

.already_member_box p,
.already_member_box span{
    cursor: pointer;
}
.login_form{
    display:none;
}
.signup_form{
    display:none;
}
.css-tbibp8 {
    margin: 20px 0px 10px;
    border-top: 1px solid rgb(228, 229, 237);
    padding: 16px;
}
.css-1y19fas {
    margin: 0px;
    color: rgb(33, 34, 36);
    font-size: 1.4rem;
    font-weight: 700;
    line-height: 1;
    letter-spacing: 0px;
}
.css-1dqn28w {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    margin-top: 5px;
}

.css-18u83hy {
    width: 150px;
    height: 60px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    cursor: pointer;
    text-decoration: none;
    color:white;
    flex-direction: column;
    align-items: center;
    text-decoration: none;
    font-weight: bold;
    font-size: 12px;
    border-radius: 10px;
}
.enu6cyp2 img {
    border-style: none;
}

.social a strong { 
    color: black;
    font-size: 13px;
    font-weight: 600;
    text-decoration: none;
}
</style>
	<section class="login_section">
          <div class="container outer_container accounts_container">
            <div class="row h-100">
              <div class="col col-sm-12 col-md-12 col-lg-8 m-0 p-0 w-100 h-100 accounts_col">
                <div class="accounts_image w-100 h-100">
                  <img src="https://img.freepik.com/free-photo/social-media-instagram-digital-marketing-concept-3d-rendering_106244-1717.jpg?t=st=1647414398~exp=1647414998~hmac=2c478ef6affd973ccd71ea4d394d9283db4a0c6c4c686ba0b9f6091c8a56e5a1&w=1480" alt="accounts_image" class="img-fluid w-100 h-100" />
                </div> <!--accounts_image-->
              </div> <!--account_col-->
              <div class="col col-sm-12 col-md-12 col-lg-4 m-0 p-0 accounts_col">
                <!--accounts_forms-->
                <div class="accounts_forms  w-100 h-100" id="login">
                    <c:if test="${not empty searchPwd }">
						<c:set var="asterisks" value=""/>
						<c:forEach begin="0" end="${fn:length(searchPwd) - 4}" varStatus="loop">
							 <c:set var="asterisks" value="${asterisks}*"/>
						</c:forEach>
						<c:set var="searchPwdFn" value="${fn:substring(searchPwd, 0, 3)}${asterisks}"/>
					</c:if>
                  <div class="title  mt-2 p-2 w-100 d-flex " style=" justify-content: space-between; align-items: center;">
                    <div>
                    	<img class="px-2"src="<c:url value="/images/mainicon.png"/>" loading="lazy" width="50" height="25">
           				<img src="<c:url value="/images/maintitle.png"/>" loading="lazy" width="100" height="25">
           			</div>	
           			 <h2 class="mt-3 mr-3" style="font-weight: bold; color:#FD9F28">로그인</h2>
                  </div>

                  <!--title-->
                  <c:if test="${! empty NOT_LOGIN }">
						<span class="pl-5 font-weight-bold" style="font-size:16px;">${NOT_LOGIN }</span>
				  </c:if>
                  <form  action="<c:url value="/project/Login.do" />" method="post" name="form" class="form  w-100 p-4" id="form">
	                   <div class="form-group">
	                     <label for="id">아이디</label>
	                     <input  value="${username}" type="text" name="id" class="form-control" id=id onfocus="labelUp(this)" onblur="labelDown(this)" required />
	                   </div>
	                   <div class="form-group">
	                     <label for="password">비밀번호</label>
	                     <i class="fa fa-eye-slash" id="eye_icon_login"></i>
	                     <input type="password" name="password" class="form-control" id="password" onfocus="labelUp(this)" onblur="labelDown(this)" required />
	                   </div>
	                    <div class="custom-control custom-checkbox ml-3 px-2 mb-3 align-self-center">
	                        <!--label로 감싸지 말자 : 감싸면 체크 X-->
	                        <input type="checkbox" class="custom-control-input" name="saveId" id="id-save" value="Y" ${empty username ? "" : "checked" }/>
	                        <label class="custom-control-label" for="id-save" style="font-size:12px">아이디 저장하기</label>   
	                    </div>
	                   <div class="form-group mb-0">
	                       <button type="submit" class="btn btn-primary register_btn w-100">로그인</button>
	                   </div>
                  </form>
      
                  
	                <div class="css-tbibp8 enu6cyp0">
	                   <h5 class="css-1y19fas e870mj50">SNS 간편 로그인</h5>
	                   <div class="css-1dqn28w enu6cyp1 mt-5" style="justify-content: space-around;">
	                       <a href="https://nid.naver.com/oauth2.0/authorize?client_id=m0_NavLMe3aWfFRsood6&response_type=code&redirect_uri=http://localhost:9090/project/naverLogin.do&state=" class="css-18u83hy enu6cyp2" style="background-color: rgb(30, 200, 0);">
	                           <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/naver-logo_v2.png" width="24" height="24" alt="소셜 로고">
	                           네이버 로그인
	                       </a>
	                       <a href="https://kauth.kakao.com/oauth/authorize?client_id=16c1121d0de60f9066904fb3ffc57c36&redirect_uri=http://localhost:9090/project/kakaoLogin.do&response_type=code" class="css-18u83hy enu6cyp2" style="background-color: rgb(249, 224, 0);">
	                           <img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/kakao-logo_v2.png" width="24" height="24" alt="소셜 로고">
	                           카카오 로그인
	                       </a>
	                   </div>
	               </div>
	               <div class="social d-flex" style="justify-content: space-evenly">
	                   <a href="#" id="searchId" class=" py-2 mr-md-1 search" data-toggle="modal" data-target="#modalSearchIdNPwd" data-backdrop="static">
	                       <strong>아이디찾기</strong>
	                   </a> 
	                   <a href="#" id="searchPwd" class=" py-2 ml-md-1 search" style="margin-left: 10px;" data-target="#modalSearchIdNPwd" data-backdrop="static">
	                       <strong>비밀번호찾기</strong>
	                   </a>
	                   <a href="<c:url value="/project/Join.do" />" class=" py-2 mr-md-1">
	                      <strong  style="border:0px;">회원가입</strong>
	                   </a> 
	               </div>
                </div> <!--accounts_forms-->
              </div> <!--account_col-->
            </div> <!--row-->
          </div><!--accounts_container-->
        </section> <!--login_section-->
		<div class="modal fade" id="modalSearchIdNPwd">	
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="width: 100rem">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">타이틀</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body d-flex" style="height: 15rem">
						<form class="form-inline" action="" method="POST">
							<h5 class="ml-2 text">내용</h5>
							<input type="hidden" name="mode"/>
							<input type="text" class="form-control mx-2" name="email" placeholder="이메일 입력해주세요" style="font-size:1.2rem; width: 300px; height: 35px;"/>
							<input type="text" class="form-control mx-2" id="user" name="id" placeholder="아이디를 입력해주세요" style="font-size:1.2rem; width: 300px; height: 35px; display: none"/>
							<input type="text" class="form-control mx-2 my-2" name="name" placeholder="이름를 입력해주세요"  style="font-size:1.2rem; width: 300px; height: 35px;"/>
							<button type="button" class="btn btn-info mx-3 submit">확인</button>
							<span id="checkOK" class="mx-3" style="font-size:1.2rem; display:none"></span>
						</form>			
					</div>
				</div>
			</div>
		</div>
		
		
<script>
	//유효성 검사
	var form = document.forms[1];
	var span = document.querySelector('#checkOK');	
	var mode = document.querySelector('input[name=mode]');
	var searchTags = document.querySelectorAll('.search');
	//console.log(searchTags)
	searchTags.forEach(function(search) {
		search.onclick = function(e) {
			document.querySelector('input[name=name]').textContent='';
			document.querySelector('input[name=email]').value='';
			document.querySelector('input[name=id]').textContent='';
			span.textContent='';
			//console.log(e.target.textContent)
			if(e.target.textContent === '아이디찾기'){
				mode.value = 'ID';
				document.querySelector('.modal-title').textContent = '아이디 찾기';
				document.querySelector('.text').textContent = "아이디를 찾기 위해 이메일과 이름을 입력해주세요";
				document.querySelector('#user').style.display='none';
				document.querySelector('input[name=name]').style.display='';
			}
			else if(e.target.textContent === '비밀번호찾기'){
				mode.value = 'PWD';
				e.target.parentElement.setAttribute("data-toggle", "modal");
				document.querySelector('.modal-title').textContent = '비밀번호 찾기';
				document.querySelector('.text').textContent = "비밀번호를 찾기 위해 이메일과 아이디를 입력해주세요";
				document.querySelector('#user').style.display='';
				document.querySelector('input[name=name]').style.display='none';
			}
		
			//아이디 비밀번호 찾기 ajax로 넘기기
			//console.log($('.submit'))
			$('.submit').click(function(){
				console.log('form.id:',form.id.style.display)
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
				
				if(!form.id.style.display.length){
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
				console.log('isValidate:',isValidate)
				if(!isValidate){
					return false;			
				}
				else{
					$.ajax({
						url:'<c:url value="/project/SearchIdNPwd.do"/>',
						dataType:'json',
						data:{id:$('#user').val(),
								email:$('input[name=email]').val(),
								name:$('input[name=name]').val(),
								mode:$('input[name=mode]').val()}
					}).done(function(data){
						if(data.message=='Not-Member'){
							$('#checkOK').css({'display':'','color':'red'});
							$('#checkOK').html("입력하신 정보의 회원이 없습니다<br/>이메일과 이름을 확인해주세요");
						}
						else if(data.message=='Social-Member'){
							$('#checkOK').css({'display':'','color':'red'});
							$('#checkOK').html("소셜 로그인 시 해당 서비스 이용이 불가합니다");
						}
						else if(data.mode=='ID'){
							$('#checkOK').css({'display':'','color':'black'});
							$('#checkOK').html("입력하신 이메일로 아이디 전송을 완료했습니다");
						}
						else{//이메일 보냈다고 문자남기기
							$('#checkOK').css({'display':'','color':'black'});
							$('#checkOK').html("입력하신 이메일로 비밀번호 전송을 완료했습니다");
						}
					}).fail(function(){
						console.log('error');
					});	
					
					return true;
				}
			});
		}
	})
	
	
		// 아이디 플레이스 홀더가 위로 올라가는 로직
        function labelUp(input){
            input.parentElement.children[0].setAttribute("class", "change_label");    
        }  

        // 포커스가 끊기면 다시 내려옴
        function labelDown(input){
            if(input.value.length === 0){
                input.parentElement.children[0].classList.remove("change_label");
            }
                
        } 

        // 비밀번호 show & hide
        var eye_icon_signup = document.getElementById('eye_icon_signup');
        var eye_icon_login = document.getElementById('eye_icon_login');
        var login_password = document.getElementById("password");
        eye_icon_login.addEventListener('click', ()=>{
            hideAndShowPass(eye_icon_login, login_password);  
        });

        const hideAndShowPass = (eye_icon, password) => {
            if(eye_icon.classList.contains("fa-eye-slash")){
                eye_icon.classList.remove('fa-eye-slash');
                eye_icon.classList.add('fa-eye');
                password.setAttribute('type', 'text');
                
            }
            else{
                eye_icon.classList.remove('fa-eye');
                eye_icon.classList.add('fa-eye-slash');
                password.setAttribute('type', 'password');
            }
        };
</script>
</body>
</html>