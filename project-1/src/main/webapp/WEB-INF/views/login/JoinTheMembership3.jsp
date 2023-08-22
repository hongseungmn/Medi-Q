<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
	
	/* step 3 */
	.register__step__wr {
	    align-items: center;
	    margin-bottom: 20px;
	    margin-top: 100px;
	}
	
	.register__step__wr .step__wr {
	    display: flex;
	    justify-content: space-around;
	    position: relative;
	}
	.register__step__wr .step__wr .line01 {
	    left: 33.5%;
	    transform: translateX(-50%);
	}
	.register__step__wr .step__wr .line02 {
	    right: 33.5%;
	    transform: translateX(50%);
	}
	.register__step__wr .step__wr .line03 {
	    right: 33.5%;
	    transform: translateX(50%);
	}
	.register__step__wr .step__wr .line04 {
	    right: 33.5%;
	    transform: translateX(50%);
	}
	.register__step__wr .step__wr .line00 {
	    position: absolute;
	    top: 16px;
	    m
	}
	.register__step__wr .step__wr .step00 {
	    text-align: center;
	}
	.register__step__wr .step__wr .step00.on .step__check {
	    opacity: 1;
	}
	.register__step__wr .step__wr .step00 .step__check {
	    display: inline-block;
	    width: 75px;
	    height: 75px;
	    border-radius: 50%;
	    background-color: #EF605D;
	    position: relative;
	    margin-bottom: 18px;
	    opacity: 0.09;
	}
	.register__step__wr .step__wr .step00 .step__check img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    opacity: 0;
	}
	.register__step__wr .step__wr .on .step__check img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    opacity: 1;
	    width: 20px;
	}
	
	.register__step__wr .step__wr .step00 .step {
	    color: #152358;
	    font-size: 14px;
	    font-weight: 700;
	    color: #BEBED5;
	}
	.register__step__wr .step__wr .step00.on .step__info {
	    color: #152358;
	}
	.register__step__wr .step__wr .step00 .step__info {
	    font-size: 20px;
	    font-weight: 700;
	    color: #BEBED5;
	}
	.line00{
		margin-top: 20px;
	}
	.first-line{
		padding-right: 106px;
	}
	.second-line{
		padding-right: 580px;
	}
	.third-line {
		padding-left: 136px;
	}
	.left-center{
		margin-left: 70px;
	}
	.right-center{
		margin-left: 120px;
	}
	.bottom-button{
		margin-bottom: 140px;
		border-color :#EF605D;
		background-color: #EF605D; 
		color: #fff; 
		width: 120px;
		height: 45px;
	}
	
	/* 로그인 결과 */
	.join-form{
		display: flex;
		justify-content: center;
		align-items: center;
		/*d-flex justify-content-center align-items-center*/
	}
	.join-form div{
		margin-bottom: 50px;
		margin-top: 50px;
	}
	.btn{
		padding: 0.55rem 0.75rem;
	}
</style>
<div class="container">
	<div class="container">

		<div class="register__step__wr hidden1024 mb-5" style="width: 100%;">
	        <div class="step__wr d-flex">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line01 first-line">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line02 second-line">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line03 first-line">
	            <img src="https://www.bundangcheil.com/images/register_step_line.png" alt="라인" class="line00 line04 third-line">
	            <div class="step00 step01 on">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 01</p>
	                <p class="step__info">약관동의</p>
	            </div>
	            <div class="step00 step02 on">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 02</p>
	                <p class="step__info">정보입력</p>
	            </div>
	            <div class="step00 step03 on">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 03</p>
	                <p class="step__info">가입완료</p>
	            </div>
	        </div>
	    </div>
		
		<!-- 회원가입 완료 화면 -->
		<div class="join-form">
			<div class="col-md-6">
				<img src="<c:url value="/images/basic/bg-remove.png"/>" alt="Image" class="img-fluid left-center ml-0"/>
			</div>
			<div class="col-md-6"><!-- 홈 /  로그인하기 버튼 2종류 -->
				<h1 class="mb-4"><span style="color: #EF605D">회원가입</span>이 완료되었습니다</h1>
				<h5><strong style="color: #EF605D">MEDI-Q</strong> 플랫폼 서비스를 정상적으로 이용하시려면 로그인하시기 바랍니다</h5>
				<div class="d-flex justify-content-center pt-3" style="height: 50px">
					<a type="button" href="<c:url value='/'/>" class="btn bottom-button ml-3">홈</a>
					<a type="button" href="<c:url value='/project/Login.do'/>" class="btn bottom-button ml-3">로그인</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>

	
</script>
</html>