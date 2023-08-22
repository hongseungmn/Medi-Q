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
	.btn{
		padding: 0.55rem 0.75rem;
	}
	
	/* 약관 동의 */
	*{margin: 0;padding: 0;box-sizing: border-box}
	#joinForm ul>li{list-style: none}
	a{text-decoration: none;}
	.clearfix::after{content: "";display: block;clear: both;}
	#joinForm input[type=checkbox]{zoom: 1.5;}
	#joinForm{width: 80%;margin: 0 auto;}
	ul.join_box{border: 1px solid #ddd;background-color: #fff;}
	.checkBox,.checkBox>ul{position: relative;}
	.checkBox>ul>li{float: left;}
	.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
	.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
	.checkBox textarea{width: 96%;height: 149px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
	.box input[type=checkbox]:hover{cursor: pointer;}
	/*
	.footBtwrap{margin-top: 15px;}
	.footBtwrap>li{float: left;width: 50%;height: 60px;}
	.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
	.fpmgBt1{background-color: #fff;color:#888}
	.fpmgBt2{background-color: lightsalmon;color: #fff}
	*/
	
	.hide{
		display: none;
	}	
	
	.block{
		display: block;
	}

</style>
<div class="container">
	<div class="container">

		<div class="register__step__wr hidden1024" style="width: 100%;">
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
	            <div class="step00 step02">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 02</p>
	                <p class="step__info">정보입력</p>
	            </div>
	            <div class="step00 step03">
	                <div class="step__check">
	                    <img src="https://www.bundangcheil.com/images/register_step_check.svg" alt="">
	                </div>
	                <p class="step">Step 03</p>
	                <p class="step__info">가입완료</p>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 약관동의 -->
	    <div class="" id="joinForm">
			<ul class="join_box">
			    <li class="checkBox check01">
			    	<ul class="clearfix">
			        	<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관, 프로모션 안내 푸쉬 수신에 모두 동의합니다.
			            </li>
			            <li class="mainbtn box">
			            	<input type="checkbox" name="check1" id="chk">  
			            </li>
			        </ul>
		        </li>
		        <li class="checkBox check02">
		            <ul class="clearfix">
		                 <li>이용약관 동의</li>
		                 <li class="box">
		                     <input type="checkbox" name="check2" required>
		                 </li>
		             </ul>
		                    
		             <textarea name="" id="">
제1조(정의)
① “MEDI-Q“란 MEDI-Q가 이용자에게 제공하기 위하여 부수되는 콘텐츠 서비스를 뜻하는 의미로 사용합니다.
② “이용자“란 “MEDI-Q“에 접속하여 이 약관에 따라 “MEDI-Q“가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ “회원“이라 함은 “MEDI-Q“에 회원등록을 한 자로서, 계속적으로 “MEDI-Q“가 제공하는 서비스를 이용할 수 있는 자를 말합니다.
④ “비회원“이라 함은 회원으로 가입하지 않고 “MEDI-Q“가 제공하는 서비스를 이용하는 자를 말합니다.

제2조(서비스의 제공 및 변경)
① “MEDI-Q”는 다음과 같은 서비스를 제공합니다.
1. 이용자의 “MEDI-Q” 서비스 이용에 도움이 되는 알람 및 콘텐츠 제공
2. 기타 “MEDI-Q”가 정하는 업무
② “MEDI-Q”가 제공하는 서비스는 비의료 건강관리서비스로서 질환의 치료 목적의 서비스가 아닌 보조적 건강관리 서비스입니다. 특히 만성질환자의 경우 본 서비스 이용대상자가 아니며 의사 또는 의료기관의 도움을 받으시기를 권고 드립니다.
③ 
④ “MEDI-Q”가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
⑤ 전항의 경우 “MEDI-Q”는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “MEDI-Q”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제3조(회원가입)
① 이용자는 “MEDI-Q”가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② “MEDI-Q”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
1. 가입신청자가 이 약관 제4조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제4조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “MEDI-Q”의 회원재가입 승낙을 얻은 경우에는 예외로 함.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 “MEDI-Q”의 기술상 현저히 지장이 있다고 판단되는 경우
4. 회원가입 및 전자상거래상의 계약에 관한 서비스는 만 14세 이상인자에 한함
③ 회원가입계약의 성립 시기는 “MEDI-Q”의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “MEDI-Q”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제4조(회원 탈퇴 및 자격 상실 등)
① 회원은 “MEDI-Q”에 언제든지 탈퇴를 요청할 수 있으며 “MEDI-Q”는 즉시 회원 탈퇴를 처리합니다.
② 회원이 다음 각 호의 사유에 해당하는 경우, “MEDI-Q”는 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청 시에 허위 내용을 등록한 경우
2. “MEDI-Q”를 이용하여 구입한 재화 등의 대금, 기타 “MEDI-Q”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 “MEDI-Q” 이용을 방해하거나 그 정보를 도용하는 등 질서를 위협하는 경우
4. “MEDI-Q”를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
③ “MEDI-Q”가 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “MEDI-Q”는 회원자격을 상실시킬 수 있습니다.
④ “MEDI-Q”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제5조(회원에 대한 통지)
① “MEDI-Q”가 회원에 대한 통지를 하는 경우, 회원이 “MEDI-Q”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
② “MEDI-Q”는 불특정다수 회원에 대한 통지의 경우 1주일이상 “MEDI-Q” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제6조(“MEDI-Q“의 의무)
① “MEDI-Q”는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하는데 최선을 다하여야 합니다.
② “MEDI-Q”는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보보호를 위한 보안 시스템을 갖추어야 합니다.
③ “MEDI-Q”가 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
④ “MEDI-Q”는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제7조(회원의 ID 및 비밀번호에 대한 의무)
① ID와 비밀번호에 관한 관리책임은 회원에게 있으며, 어떠한 경우에도 본인의 ID 또는 비밀번호를 양도하거나 대여할 수 없습니다.
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안되며, “MEDI-Q”의 귀책사유 없이 이를 유출, 양도, 대여한 행위로 인하여 발생하는 손실이나 손해에 대하여는 회원 본인이 그에 대한 책임을 부담합니다.
③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “MEDI-Q”에 통보하고 “MEDI-Q”의 안내가 있는 경우에는 그에 따라야 합니다.

제8조(이용자의 의무)
이용자는 다음 행위를 하여서는 안 됩니다.
1. 신청 또는 변경 시 허위 내용의 등록
2. 타인의 정보 도용
3. “MEDI-Q”에 게시된 정보의 변경
4. “MEDI-Q”가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. “MEDI-Q” 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. “MEDI-Q” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
		       		</textarea>
		       </li>
		       <li class="checkBox check03">
		            <ul class="clearfix">
		                <li>개인정보 수집 및 이용에 대한 안내</li>
		                <li class="box">
		                    <input type="checkbox" name="check2" required>   
		                </li>
		            </ul>
		
		            <textarea name="" id="">
■ 수집하는 개인정보 항목 및 수집방법
가. 수집하는 개인정보의 항목

- 회사는 회원가입, 고객 상담, 서비스 신청 및 제공 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
- 회원가입시(필수): 카카오ID(카카오로그인ID-카카오톡 연동정보(이름/이메일/회원번호)), 비밀번호, 이름, 성별, 생년월일
- 서비스 참여시(선택): 건강과 관련된 정보

- 홈페이지, 설문 진행, 게시판, 이메일을 통한 수집

■ 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

- 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 본인 인증
- 회원 관리 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달
- 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
■ 개인정보의 보유 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.

가. 회사 내부방침에 의한 정보보유 사유 회원이 탈퇴한 경우에도 불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 3년간 회원의 정보를 보유할 수 있습니다.
나. 관련 법령에 의한 정보 보유 사유 전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.

- 로그 기록
- 보존이유: 통신비밀보호법
- 보존기간: 3개월

■ 개인정보의 파기절차 및 방법
회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
- 파기절차
회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.
별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
- 파기방법
전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.

■ 이용자 및 법정대리인의 권리와 그 행사방법
- 이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.
- 이용자들의 개인정보 조회, 수정을 위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원 탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.
- 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.
- 귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.
- 회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.

■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
- 회사는 귀하의 정보를 수시로 저장하고 찾아내는 "쿠키(cookie)" 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.
모바일 어플리케이션과 같이 쿠키 기능을 사용할 수 없는 경우에는 쿠키와 유사한 기능을 수행하는 기술(광고식별자 등)을 사용할 수도 있습니다.
- 쿠키 등 사용 목적
1. 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
2. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
- 쿠키 설정 거부 방법
1. 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용 하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
2. 설정방법 예(인터넷 익스플로어의 경우): 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
3. 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.

■ 민감정보 수집 및 이용 동의(검진 결과)
MEDI-Q에서 건강 검진 결과를 보관 및 조회하고, 질병 발병 예측 등 맞춤형 건강 정보 서비스 이용을 위해서 민감정보 수집 및 이용에 대한 동의가 필요합니다. 본 서비스와 관련하여 “회원”은 민감정보 수집 및 이용에 대해 동의를 거부하실 수 있습니다. 동의를 거부할 경우, 관련 서비스를 이용하실 수 없습니다.

● 수집 · 이용 목적: 검진 결과의 보관, 조회 및 맞춤형 건강 정보 및 증진 서비스 이용을 위한 활용
● 수집 · 이용 항목: 건강 검진 결과, 연도별건강검진결과
● 보유 및 이용기간: “회사”는 원칙적으로 회원의 정보를 다음의 사유 발생 시 지체없이 파기하고 있습니다.

① 회원 탈퇴 시
② 서비스 종료 시
MEDI-Q는 개인 정보 보호에 최선을 다하며 회원으로부터 별도 동의를 받거나 관련 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.

※ 서비스 제공을 위해 필요한 최소한의 민감정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다. 더 자세한 내용에 대해서는 개인정보 처리방침을 참고하시기 바랍니다.
		       		</textarea>
		        </li>
		        <li class="checkBox check03">
		            <ul class="clearfix">
		                 <li>위치정보 이용약관 동의</li>
		                 <li class="box">
		                      <input type="checkbox" name="check2">	                            
		                 </li>
		            </ul>
		
		            <textarea name="" id="">
제 1 조 (목적)
이 약관은 MEDI-Q가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.

제 3 조 (서비스 내용 및 요금)
①회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
1.GeoTagging 서비스: 게시물 또는 이용자가 저장하는 콘텐츠에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다. 저장된 위치정보는 별도의 활용없이 보관되거나, 또는 장소를 기반으로 콘텐츠를 분류하거나 검색할 수 있는 기능이 제공될 수도 있습니다.
2.위치정보를 활용한 검색결과 및 콘텐츠 제공 : 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과, 주변결과(맛집, 주변업체, 교통수단 등), 번역결과를 제시합니다.
3.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
4.이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
5.길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스, 주소 자동 입력 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
②제1항 위치기반서비스의 이용요금은 무료입니다.

제 4 조 (개인위치정보주체의 권리)
①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.
②개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
③개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다.
이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다
④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다.
이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.
1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
⑤회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다.
단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
⑥개인위치정보주체는 제1항 내지 제4항의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.

제 5 조 (법정대리인의 권리)
①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
②법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을
행사할 수 있습니다.

제 6 조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간)
회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에
자동으로 기록하며, 6개월 이상 보관합니다.

제 7 조 (서비스의 변경 및 중지)
①회사는 위치기반서비스사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를 제한, 변경하거나 중지할 수 있습니다.
②제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 등에 공지하거나 개인위치정보주체에게 통지합니다.

제 8 조 (개인위치정보 제3자 제공 시 즉시 통보)
①회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공받는 자 및 제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다.
②회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다.
③다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.
1.개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
2.개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우

제 9 조 (8세 이하의 아동 등의 보호의무자의 권리)
①회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동”등이라 함)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
1.8세 이하의 아동
2.피성년후견인
3.장애인복지법 제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진 및 직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법 제32조의 규정에 의하여 장애인등록을 한 자에 한정)
②8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.
③보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.

제 10 조 (개인위치정보의 보유목적 및 이용기간)
①회사는 위치기반서비스를 제공하기 위해 필요한 최소한의 기간 동안 개인위치정보를 보유 및 이용합니다.
②회사는 대부분의 위치기반서비스에서 개인위치정보를 일회성 또는 임시로 이용 후 지체없이 파기합니다. 단, ‘GeoTagging’ 서비스와 같이 이용자가 게시물, 콘텐츠와 함께 개인위치정보를 네이버 서비스에 게시 또는 보관하는 경우, 해당 게시물, 콘텐츠의 보관기간 동안 개인위치정보가 함께 보관됩니다.
		       		</textarea>
		         </li>
		         <li class="checkBox check04">
		             <ul class="clearfix">
		                  <li>이벤트 등 프로모션 알림 푸쉬 수신</li>
		                  <li class="box">
		                       <input type="checkbox" name="check2">  
		                  </li>
		             </ul>
		         </li>
		    </ul>
	    </div>
	    
	    <div class="d-flex justify-content-center pt-3">
			<button type="button" id="next" class="btn bottom-button ml-3">다음</button>
		</div>
		
	</div>
</div>
</body>
<script>
	//약관동의 페이지에서 페이지 이동하기
	$('#next').click(function(){//다음 버튼 클릭 시
		if($('[name=check2]:checked').length==$('[name=check2]').length){//약관 모두 동의 시
			location.href='<c:url value="/project/Join2.do"/>';
		}
		else{
			alert('약관을 모두 읽고 동의해주세요');
		}
	});

	//모두 선택 시 체크박스 모두 선택되도록
	$('.checkBox :checkbox').click(function(){
		//console.log('first:',$('.checkBox :checkbox:first').prop('id')==='chk')
		if($(this).attr('id')==='chk'){//모두 선택 체크를 했을 때
			//console.log('length:',$('[name=check2]:checked').length)
			if($(this).prop("checked")){
				$('[name=check2]').prop('checked',true);
			}
			else{
				$('[name=check2]').prop('checked',false);
			}
		}
		else{//모두 선택 말고 다른 체크박스 선택 시
			if($(this).prop('checked')){
				if($('[name=check2]').length==$('[name=check2]:checked').length){
					$('.checkBox :checkbox:first').prop('checked',true);
				}
			}
			else{
				$('#chk').prop('checked',false);
			}
			
		};
	});
	
</script>
</html>