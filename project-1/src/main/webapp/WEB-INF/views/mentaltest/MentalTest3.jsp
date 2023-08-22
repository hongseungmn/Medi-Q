<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="m" uri="/WEB-INF/tlds/common.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
        .line{
            border: rgb(241, 79, 106) 1px solid;
            margin-top: 1.5rem;
        }
        body{
        	font-size: 1rem;
        }
        [type='radio']{
            margin-left: 1.5rem;
        }
        .topBtn{
            margin-top: 24px;
            margin-left: 20px;
            width: 50px;
            height: 50px;
            cursor: pointer;
        }
        #text img{
        	width: 30px;
        	height: 30px;
        }
</style>
<body>
	<fmt:bundle basename="config.tokens">
			<fmt:message key="secret-key" var="key"/>
        </fmt:bundle>
        <c:set var="token" value="${cookie['User-Token'].value }"/>
	<c:set var="payload" value='${m:getTokenPayloads(token,key) }' />
	
	<div class="container" style="margin-top: 100px">
		<!-- tap 화면 -->
		<div>
			<ul class="nav nav-tabs nav-justified">
				<li class="nav-item">
			    	<a class="nav-link" href='<c:url value="/project/MentalTest1.do"/>'>심리적 스트레스</a>
			    </li>
			    <li class="nav-item">
			      	<a class="nav-link" href='<c:url value="/project/MentalTest2.do"/>'>흡연 유형 평가</a>
			    </li>
			    <li class="nav-item">
			      	<a class="nav-link active" href='#'>알코올 의존(AUDIT-K)</a>
			    </li>
			    <li class="nav-item">
			      	<a class="nav-link" href='<c:url value="/project/MentalTest4.do"/>'>우울증(CES-D)</a>
			    </li>
			</ul>
		</div>
	
        <h2 class="text-primary font-weight-bold mt-5">알코올 사용장애 평가(AUDIT-K)</h2>
        <small><strong class="small font-weight-bold text-black-50">평가도구원문 : Alcohol Use Disorder Identification Test-Korea(AUDIT-K)</strong></small>
        <div class="d-flex justify-content-between">
	        <p class="mt-2" style="font-size: 1rem">
	            다음 문항은 알코올 의존 정도를 파악하기 위한 것입니다.<br/>
	            질문에 나오는 1잔이란 술의 종류와 관계없이 1잔의 양을 의미합니다.<br/>
	            각 문항을 읽고, 자신의 현재 상태를 가장 잘 나타내는 것에 표시해주시기 바랍니다.
	        </p>
	        <button id="resultCheck" class="btn btn-outline-primary py-0" style="height: 40px" onclick="javascript:result();" data-target="#result" data-backdrop="static">최근 결과 확인하기</button>
	    </div>
        <div class="line"></div>
	    <div>
	        <table>
	            <tbody>
	            	<tr class="trTitle">
	                    <th class="pt-4"><span class="text-primary">Q</span> 성별을 선택해주세요</th>
	                </tr>
	                <tr class="border-bottom tr-content">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q00" id="alc_q00_01" value="m" ${not empty info.gender && info.gender eq 'M' ? "checked" : "" }/>
	                        <label for="alc_q00_01">남성</label>
	                        <input type="radio" name="alc_q00" id="alc_q00_02" value="f" ${not empty info.gender && info.gender eq 'F' ? "checked" : "" }/>
	                        <label for="alc_q00_02">여성</label>
	                    </td>
	                </tr>
	                <tr>
	                    <th><span class="text-primary">01</span> 얼마나 자주 술을 마십니까?</th>
	                </tr>
	                <tr class="border-bottom tr-content">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q1" id="alc_q01_01" value="0"/>
	                        <label for="alc_q01_01">전혀 안마심</label>
	                        <input type="radio" name="alc_q1" id="alc_q01_02" value="1"/>
	                        <label for="alc_q01_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q1" id="alc_q01_03" value="2"/>
	                        <label for="alc_q01_03">월 2~4회</label>
	                        <input type="radio" name="alc_q1" id="alc_q01_04" value="3"/>
	                        <label for="alc_q01_04">주 2~3회</label>
	                        <input type="radio" name="alc_q1" id="alc_q01_05" value="4"/>
	                        <label for="alc_q01_05">주 4회 이상</label>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><span class="text-primary">02</span> 술을 마시면 한 번에 몇 잔 정도 마십니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q2" id="alc_q02_01" value="0"/>
	                        <label for="alc_q02_01">한두 잔</label>
	                        <input type="radio" name="alc_q2" id="alc_q02_02" value="1"/>
	                        <label for="alc_q02_02">3~4 잔</label>
	                        <input type="radio" name="alc_q2" id="alc_q02_03" value="2"/>
	                        <label for="alc_q02_03">5~6 잔</label>
	                        <input type="radio" name="alc_q2" id="alc_q02_04" value="3"/>
	                        <label for="alc_q02_04">7~9 잔</label>
	                        <input type="radio" name="alc_q2" id="alc_q02_05" value="4"/>
	                        <label for="alc_q02_05">10잔 이상</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">03</span> 한 번에 소주 1병 또는 맥주 4병 이상 마시는 경우는 얼마나 자주 있습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q3" id="alc_q03_01" value="0"/>
	                        <label for="alc_q03_01">전혀 없다</label>
	                        <input type="radio" name="alc_q3" id="alc_q03_02" value="1"/>
	                        <label for="alc_q03_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q3" id="alc_q03_03" value="2"/>
	                        <label for="alc_q03_03">월 1회</label>
	                        <input type="radio" name="alc_q3" id="alc_q03_04" value="3"/>
	                        <label for="alc_q03_04">주 1회</label>
	                        <input type="radio" name="alc_q3" id="alc_q03_05" value="4"/>
	                        <label for="alc_q03_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">04</span> 지난 1년간 한번 술을 마시기 시작하면 멈출 수 없었던 때가 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q4" id="alc_q04_01" value="0"/>
	                        <label for="alc_q04_01">전혀 없다</label>
	                        <input type="radio" name="alc_q4" id="alc_q04_02" value="1"/>
	                        <label for="alc_q04_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q4" id="alc_q04_03" value="2"/>
	                        <label for="alc_q04_03">월 1회</label>
	                        <input type="radio" name="alc_q4" id="alc_q04_04" value="3"/>
	                        <label for="alc_q04_04">주 1회</label>
	                        <input type="radio" name="alc_q4" id="alc_q04_05" value="4"/>
	                        <label for="alc_q04_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">05</span> 지난 1년간 평소 같으면 할 수 있었던 일을 술 때문에 하지 못한적이 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q5" id="alc_q05_01" value="0"/>
	                        <label for="alc_q05_01">전혀 없다</label>
	                        <input type="radio" name="alc_q5" id="alc_q05_02" value="1"/>
	                        <label for="alc_q05_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q5" id="alc_q05_03" value="2"/>
	                        <label for="alc_q05_03">월 1회</label>
	                        <input type="radio" name="alc_q5" id="alc_q05_04" value="3"/>
	                        <label for="alc_q05_04">주 1회</label>
	                        <input type="radio" name="alc_q5" id="alc_q05_05" value="4"/>
	                        <label for="alc_q05_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">06</span> 지난 1년간 술 마신 다음 날 해장술을 마신 적은 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q6" id="alc_q06_01" value="0"/>
	                        <label for="alc_q06_01">전혀 없다</label>
	                        <input type="radio" name="alc_q6" id="alc_q06_02" value="1"/>
	                        <label for="alc_q06_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q6" id="alc_q06_03" value="2"/>
	                        <label for="alc_q06_03">월 1회</label>
	                        <input type="radio" name="alc_q6" id="alc_q06_04" value="3"/>
	                        <label for="alc_q06_04">주 1회</label>
	                        <input type="radio" name="alc_q6" id="alc_q06_05" value="4"/>
	                        <label for="alc_q06_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">07</span> 지난 1년간 술 마신 후에 죄책감이 들거나 후회를 한 적이 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q7" id="alc_q07_01" value="0"/>
	                        <label for="alc_q07_01">전혀 없다</label>
	                        <input type="radio" name="alc_q7" id="alc_q07_02" value="1"/>
	                        <label for="alc_q07_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q7" id="alc_q07_03" value="2"/>
	                        <label for="alc_q07_03">월 1회</label>
	                        <input type="radio" name="alc_q7" id="alc_q07_04" value="3"/>
	                        <label for="alc_q07_04">주 1회</label>
	                        <input type="radio" name="alc_q7" id="alc_q07_05" value="4"/>
	                        <label for="alc_q07_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">08</span> 지난 1년간 음주 때문에 전날 밤 일이 기억나지 않았던 적이 얼마나 자주 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q8" id="alc_q08_01" value="0"/>
	                        <label for="alc_q08_01">전혀 없다</label>
	                        <input type="radio" name="alc_q8" id="alc_q08_02" value="1"/>
	                        <label for="alc_q08_02">월 1회 미만</label>
	                        <input type="radio" name="alc_q8" id="alc_q08_03" value="2"/>
	                        <label for="alc_q08_03">월 1회</label>
	                        <input type="radio" name="alc_q8" id="alc_q08_04" value="3"/>
	                        <label for="alc_q08_04">주 1회</label>
	                        <input type="radio" name="alc_q8" id="alc_q08_05" value="4"/>
	                        <label for="alc_q08_05">거의 매일</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">09</span> 음주로 인해 자신이나 다른 사람이 다친적이 있습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q9" id="alc_q09_01" value="0"/>
	                        <label for="alc_q09_01">없었다</label>
	                        <input type="radio" name="alc_q9" id="alc_q09_02" value="2"/>
	                        <label for="alc_q09_02">있지만, 지난 1년간에는 없었다</label>
	                        <input type="radio" name="alc_q9" id="alc_q09_03" value="4"/>
	                        <label for="alc_q09_03">지난 1년간 있었다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">10</span> 가족이나 친구, 혹은 건강 전문가나 의사가 당신이 술 마시는 것을 걱정하거나 술 끊기를 권유한 적이 있었습니까?</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="alc_q10" id="alc_q10_01" value="0"/>
	                        <label for="alc_q10_01">없었다</label>
	                        <input type="radio" name="alc_q10" id="alc_q10_02" value="2"/>
	                        <label for="alc_q10_02">있지만, 지난 1년간에는 없었다</label>
	                        <input type="radio" name="alc_q10" id="alc_q10_03" value="4"/>
	                        <label for="alc_q10_03">지난 1년간 있었다</label>
	                    </td>
	                </tr>
	
	            </tbody>
	        </table>
	
	        <div class="d-inline-flex">
	            <button id="resultM" class="btn btn-lg btn-primary my-4" data-toggle="modal" data-target="#result" data-backdrop="static" >알코올 사용장애 검사결과 보기</button>
	            <!--
	            <img class="topBtn" src="./img/top-btn.png" alt="top-button"/>
	            -->
	            <img class="topBtn" src='<c:url value="/images/basic/top-btn2.png"/>' alt="top-button"/>
	        </div>
        </div>
    </div><!--container-->
    <!-- The Modal -->
    <div class="modal fade" id="result" style="display: none">
        <div class="modal-dialog  modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header justify-content-between">
                    <h4 class="modal-title my-3">알코올 사용장애 검사결과 보기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="text" class="d-flex flex-wrap">
                        <h5 id="resultT" class="font-weight-bold mb-3">음주군</h5>
                        <p id="resultC">부가설명</p>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                	<p class="text-primary">
                		※본 결과는 정신건강에 대한 대체적인 경향을 체크할 수 있도록 제공된 것입니다.<br/>
                		  정확한 증상과 판단을 위해서는 전문가의 상담 또는 진료가 필요함을 안내드립니다.
                	</p>
		          	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
		        </div>
            </div>
        </div>
    </div><!--container-->
</body>
<script>
	//버튼 클릭 시 맨 위로 이동
    var topBtn = document.querySelector(".topBtn");
    topBtn.onclick = (()=>{
    	window.scrollTo({ top: 0, behavior: "smooth" });  
    })

    //알코올 사용장애 결과 뿌리기
	$('#resultM').click(function(){
		var sum=0;
		$('#resultT').removeClass('text-danger text-primary');
		if($(':radio:checked').length != 11){
			$(this).attr('data-toggle','');
			if (!$('[name=alc_q00]:checked').length){
		    	var this_ = $('[name=alc_q00]')
			   	alert("성별을 선택하세요.");
			   	this_.focus();
			   	return;
		    }
			else{
				for (i=1;i<$(':radio').parent().length;i++){
					//console.log('i:',i)
					//console.log('checked:',$('[name=str_q1]:checked'))
				    if (!$('[name=alc_q'+i+']:checked').length){
				    	var this_ = $('[name=alc_q'+i+']')
					   	alert(i+"번 질문에 답을 선택하세요.");
					   	this_.focus();
					   	return;
				    }
				}
			}
		}
		else if($('[name=alc_q00]:checked').val()=='m'){//남자일 때
			$(this).attr('data-toggle','modal');
			$(':radio:checked').slice(1).each(function(){
				sum += parseInt($(this).val());
				//console.log('sum:',sum)
			});	
				$.ajax({
					data:{
						name:'test3',
						sum:sum
					},
					url:'<c:url value="/project/MentalResult.do"/>',
		    		method:'post',
		    		dataType:'json'
				}).done((result)=>{
					console.log('success:',result)
					
					if(sum < 10){
						$('#resultT').addClass('text-primary');
						$('#resultT').html(`<img alt='엄지' src='/images/basic/like.png'/>정상 음주군입니다`);
						$('#resultC').html(`
								비교적 안전하고 건강한 음주습관을 지니고 있으며<br/>
								알콜중독이 의심되지 않습니다<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span<br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우
								5.19세 미만 청소년인 경우
								`);
					}
					else if(sum >= 10 && sum <= 19){
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>위험 음주군입니다`);
						$('#resultC').html(`
								음주량과 음주횟수가 너무 많은 위험음주 습관을 지니고 있습니다.<br/>
								아직은 술 때문에 큰 문제는 없지만 음주습관을 바꾸도록 해야합니다.<br/>
								단기 개입 및 모니터링이 필요합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주량과 횟수를 모두 줄여야 합니다.</span><br/>
								1.과음하지 않아야 합니다.1일 5잔(여자4잔) 이상, 1주일 동안 남자 13잔, 여자 6잔 이상은 과음입니다.<br/>
								2.과음한 후 2~3일은 반드시 금주해야 합니다.<br/>
								3.자신만의 절주방법을 정해야 합니다.<br/>
								예) 2차 안가기, 천천히 마시기, 약한 술 마시기, 섞어 마시지 않기 등<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음을 계속할 경우 발생할 수 있는 문제점은?</span><br/>
								1.건강문제 : 간질환, 췌장질환, 위장질환, 성기능저하, 노화, 불면증 ,암 발생 증가<br/>
								2.사고발생 : 교통사고, 음주운전, 작업중 사고, 운동중 사고, 경찰에 불려다니는 일<br/>
								3.대인관계 : 부부, 자녀, 동료, 친구와의 불화, 잦은 실수<br/>
								4.일(직업) : 업무능력 저하, 지각, 결근, 약속불이행<br/>
								5.경제문제 : 물건분실, 치료비용, 지나친 술값 지불<br/>
								6.정신적문제 : 기억력 저하, 뇌의 노화, 알코올성 치매, 우울증, 자살충동<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음충동이 들 때는 어떻게 해야 할까?</span><br/>
								1.과음우려가 있을 때는 바로 집으로 간다.<br/>
								2.뒤에 할 일을 남겨 놓거나 다른 대안활동(공연, 운동, 차마시기 등)을 찾는다.<br/>
								3.술 친구를 만나지 않는다.<br/>
								4.2잔 정도만 마시고 음료수를 마신다.<br/>
								5.절주해야하는 이유를 다시 한번 떠올린다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">주기적으로 건강상태를 체크해야 합니다.</span><br/>
								1.신체증상을 주의 깊게 살피고 주기적인 검진을 받아야 합니다.<br/>
								2.숙취가 오랫동안 지속되고 필름끊김 현상이 6개월에 2~3회이상 될 때는 금주해야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주문제를 위해 알코올상담센터나 정신보건센터의 도움을 받도록 합니다.</span></br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span><br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우<br/>
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우<br/>
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)<br/>
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우<br/>
								5.19세 미만 청소년인 경우<br/>
								`);
					}
					else{
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>알코올 사용 장애군입니다`);
						$('#resultC').html(`
								알코올의존 상태에 이미 들어셨습니다.<br/>
								사용 장애 추정군, 신체증상/불안/불면/사회부적응/우울 등이 나타날 수 있어<br/>
								세심한 관심과 전문가의 치료적 개입이 필요합니다.<br/>
								술은 줄이는 단계가 아니라 끊어야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주와 관련된 목표를 조정해야합니다.</span><br/>
								1.음주량과 횟수를 조절하는 것이 매우 어려운 단계입니다.<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/>
								3.술을 마시고 실수하는 경우와 중요한 업무를 처리하지 못하는 일이 늘어납니다.<br/>
								4.술을 끊는 것이 알코올 사용장애에서 벗어나는 가장 확실한 방법입니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">정신의료기관(정신과 전문의)이나 알코올상담센터, 정신보건센터에서 전문서비스를 받도록 합니다.</span><br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">자조집단에 참여를 권유합니다.</span><br/>
								1.알코올 중독자 및 가족분들을 위한 익명 상담 사이트 : <a href='http://cafe.naver.com/woori1339'>http:\/\/cafe.naver.com/woori1339</a>, 1644-6139<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">알코올 의존증 개선을 위한 치료를 꼭 받으셔야 합니다.</span><br/>
								1.비타민 등 영양공급<br/>
								2.금단증상에 대한 제독치료<br/>
								3.단주를 촉진하기 위한 약물치료(충동억제제, 항불안제, 항우울제)<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">신체에 병이 생기면 치료를 받아서 나을 수 있는 것처럼 알코올 중독도 치료받으면 나을 수 있습니다.</span>
								`);
					}
				}).fail(()=>{
					console.log('error')
				});
		}///////////남자일 때
		else{//여자일 때
			$(this).attr('data-toggle','modal');
			$(':radio:checked').slice(1).each(function(){
				sum += parseInt($(this).val());
			});
				$.ajax({
					data:{
						name:'test3',
						sum:sum
					},
					url:'<c:url value="/project/MentalResult.do"/>',
		    		method:'post',
		    		dataType:'json'
				}).done((result)=>{
					console.log('success:',result)
				
					if(sum < 6){
						$('#resultT').addClass('text-primary');
						$('#resultT').html(`<img alt='엄지' src='/images/basic/like.png'/>정상 음주군입니다`);
						$('#resultC').html(`
								비교적 안전하고 건강한 음주습관을 지니고 있으며<br/>
								알콜중독이 의심되지 않습니다<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span><br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우
								5.19세 미만 청소년인 경우
								`);
					}
					else if(sum >= 6 && sum < 10){
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>위험 음주군입니다`);
						$('#resultC').html(`
								알코올의존 상태에 이미 들어셨습니다.<br/>
								사용 장애 추정군, 신체증상/불안/불면/사회부적응/우울 등이 나타날 수 있어<br/>
								세심한 관심과 전문가의 치료적 개입이 필요합니다.<br/>
								술은 줄이는 단계가 아니라 끊어야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주량과 횟수를 모두 줄여야 합니다.</span><br/>
								1.과음하지 않아야 합니다.1일 5잔(여자4잔) 이상, 1주일 동안 남자 13잔, 여자 6잔 이상은 과음입니다.<br/>
								2.과음한 후 2~3일은 반드시 금주해야 합니다.<br/>
								3.자신만의 절주방법을 정해야 합니다.<br/>
								예) 2차 안가기, 천천히 마시기, 약한 술 마시기, 섞어 마시지 않기 등<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음을 계속할 경우 발생할 수 있는 문제점은?</span><br/>
								1.건강문제 : 간질환, 췌장질환, 위장질환, 성기능저하, 노화, 불면증 ,암 발생 증가<br/>
								2.사고발생 : 교통사고, 음주운전, 작업중 사고, 운동중 사고, 경찰에 불려다니는 일<br/>
								3.대인관계 : 부부, 자녀, 동료, 친구와의 불화, 잦은 실수<br/>
								4.일(직업) : 업무능력 저하, 지각, 결근, 약속불이행<br/>
								5.경제문제 : 물건분실, 치료비용, 지나친 술값 지불<br/>
								6.정신적문제 : 기억력 저하, 뇌의 노화, 알코올성 치매, 우울증, 자살충동<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음충동이 들 때는 어떻게 해야 할까?</span><br/>
								1.과음우려가 있을 때는 바로 집으로 간다.<br/>
								2.뒤에 할 일을 남겨 놓거나 다른 대안활동(공연, 운동, 차마시기 등)을 찾는다.<br/>
								3.술 친구를 만나지 않는다.<br/>
								4.2잔 정도만 마시고 음료수를 마신다.<br/>
								5.절주해야하는 이유를 다시 한번 떠올린다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">주기적으로 건강상태를 체크해야 합니다.</span><br/>
								1.신체증상을 주의 깊게 살피고 주기적인 검진을 받아야 합니다.<br/>
								2.숙취가 오랫동안 지속되고 필름끊김 현상이 6개월에 2~3회이상 될 때는 금주해야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주문제를 위해 알코올상담센터나 정신보건센터의 도움을 받도록 합니다.</span></br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span><br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우<br/>
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우<br/>
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)<br/>
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우<br/>
								5.19세 미만 청소년인 경우<br/>
								`);
					}
					else{
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>알코올 사용 장애군입니다`);
						$('#resultC').html(`
								알코올의존 상태에 이미 들어셨습니다.<br/>
								전문의의 진찰과 치료를 시작하는 것이 필요합니다.<br/>
								술은 줄이는 단계가 아니라 끊어야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주와 관련된 목표를 조정해야합니다.</span><br/>
								1.음주량과 횟수를 조절하는 것이 매우 어려운 단계입니다.<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/>
								3.술을 마시고 실수하는 경우와 중요한 업무를 처리하지 못하는 일이 늘어납니다.<br/>
								4.술을 끊는 것이 알코올 사용장애에서 벗어나는 가장 확실한 방법입니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">정신의료기관(정신과 전문의)이나 알코올상담센터, 정신보건센터에서 전문서비스를 받도록 합니다.</span><br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">자조집단에 참여를 권유합니다.</span><br/>
								1.알코올 중독자 및 가족분들을 위한 익명 상담 사이트 : <a href='http://cafe.naver.com/woori1339'>http:\/\/cafe.naver.com/woori1339</a>, 1644-6139<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">알코올 의존증 개선을 위한 치료를 꼭 받으셔야 합니다.</span><br/>
								1.비타민 등 영양공급<br/>
								2.금단증상에 대한 제독치료<br/>
								3.단주를 촉진하기 위한 약물치료(충동억제제, 항불안제, 항우울제)<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">신체에 병이 생기면 치료를 받아서 나을 수 있는 것처럼 알코올 중독도 치료받으면 나을 수 있습니다</span>.
								`);
					}
				}).fail(()=>{
					console.log('error')
				});
		}
	});
	
	function result(){
		if(${empty payload.sub}){
			alert('로그인 후에 이용 가능한 서비스 입니다');
			return false;
		}
    	$.ajax({
    		data:{name:"result",test:"test3"},
    		url:'<c:url value="/project/MentalResult.do"/>',
    		method:'post',
    		dataType:'json'
    	}).done((result)=>{
    		if(!result){
    			alert('최근 결과가 없습니다');
    		}
    		else{
    			result = parseInt(result);
    			
    			$('#resultCheck').attr('data-toggle','modal');
				$('#resultT').removeClass('text-danger text-primary');
				
    			if($('[name=alc_q00]:checked').val()=='m'){//남자일 때
    				if(result < 10){
						$('#resultT').addClass('text-primary');
						$('#resultT').html(`<img alt='엄지' src='/images/basic/like.png'/>정상 음주군입니다`);
						$('#resultC').html(`
								비교적 안전하고 건강한 음주습관을 지니고 있으며<br/>
								알콜중독이 의심되지 않습니다<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span<br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우
								5.19세 미만 청소년인 경우
								`);
					}
					else if(result >= 10 && result <= 19){
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>위험 음주군입니다`);
						$('#resultC').html(`
								음주량과 음주횟수가 너무 많은 위험음주 습관을 지니고 있습니다.<br/>
								아직은 술 때문에 큰 문제는 없지만 음주습관을 바꾸도록 해야합니다.<br/>
								단기 개입 및 모니터링이 필요합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주량과 횟수를 모두 줄여야 합니다.</span><br/>
								1.과음하지 않아야 합니다.1일 5잔(여자4잔) 이상, 1주일 동안 남자 13잔, 여자 6잔 이상은 과음입니다.<br/>
								2.과음한 후 2~3일은 반드시 금주해야 합니다.<br/>
								3.자신만의 절주방법을 정해야 합니다.<br/>
								예) 2차 안가기, 천천히 마시기, 약한 술 마시기, 섞어 마시지 않기 등<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음을 계속할 경우 발생할 수 있는 문제점은?</span><br/>
								1.건강문제 : 간질환, 췌장질환, 위장질환, 성기능저하, 노화, 불면증 ,암 발생 증가<br/>
								2.사고발생 : 교통사고, 음주운전, 작업중 사고, 운동중 사고, 경찰에 불려다니는 일<br/>
								3.대인관계 : 부부, 자녀, 동료, 친구와의 불화, 잦은 실수<br/>
								4.일(직업) : 업무능력 저하, 지각, 결근, 약속불이행<br/>
								5.경제문제 : 물건분실, 치료비용, 지나친 술값 지불<br/>
								6.정신적문제 : 기억력 저하, 뇌의 노화, 알코올성 치매, 우울증, 자살충동<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음충동이 들 때는 어떻게 해야 할까?</span><br/>
								1.과음우려가 있을 때는 바로 집으로 간다.<br/>
								2.뒤에 할 일을 남겨 놓거나 다른 대안활동(공연, 운동, 차마시기 등)을 찾는다.<br/>
								3.술 친구를 만나지 않는다.<br/>
								4.2잔 정도만 마시고 음료수를 마신다.<br/>
								5.절주해야하는 이유를 다시 한번 떠올린다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">주기적으로 건강상태를 체크해야 합니다.</span><br/>
								1.신체증상을 주의 깊게 살피고 주기적인 검진을 받아야 합니다.<br/>
								2.숙취가 오랫동안 지속되고 필름끊김 현상이 6개월에 2~3회이상 될 때는 금주해야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주문제를 위해 알코올상담센터나 정신보건센터의 도움을 받도록 합니다.</span></br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span><br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우<br/>
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우<br/>
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)<br/>
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우<br/>
								5.19세 미만 청소년인 경우<br/>
								`);
					}
					else{
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>알코올 사용 장애군입니다`);
						$('#resultC').html(`
								알코올의존 상태에 이미 들어셨습니다.<br/>
								사용 장애 추정군, 신체증상/불안/불면/사회부적응/우울 등이 나타날 수 있어<br/>
								세심한 관심과 전문가의 치료적 개입이 필요합니다.<br/>
								술은 줄이는 단계가 아니라 끊어야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주와 관련된 목표를 조정해야합니다.</span><br/>
								1.음주량과 횟수를 조절하는 것이 매우 어려운 단계입니다.<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/>
								3.술을 마시고 실수하는 경우와 중요한 업무를 처리하지 못하는 일이 늘어납니다.<br/>
								4.술을 끊는 것이 알코올 사용장애에서 벗어나는 가장 확실한 방법입니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">정신의료기관(정신과 전문의)이나 알코올상담센터, 정신보건센터에서 전문서비스를 받도록 합니다.</span><br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">자조집단에 참여를 권유합니다.</span><br/>
								1.알코올 중독자 및 가족분들을 위한 익명 상담 사이트 : <a href='http://cafe.naver.com/woori1339'>http:\/\/cafe.naver.com/woori1339</a>, 1644-6139<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">알코올 의존증 개선을 위한 치료를 꼭 받으셔야 합니다.</span><br/>
								1.비타민 등 영양공급<br/>
								2.금단증상에 대한 제독치료<br/>
								3.단주를 촉진하기 위한 약물치료(충동억제제, 항불안제, 항우울제)<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">신체에 병이 생기면 치료를 받아서 나을 수 있는 것처럼 알코올 중독도 치료받으면 나을 수 있습니다.</span>
								`);
					}    				
    			}
    			else{
    				if(result < 6){
						$('#resultT').addClass('text-primary');
						$('#resultT').html(`<img alt='엄지' src='/images/basic/like.png'/>정상 음주군입니다`);
						$('#resultC').html(`
								비교적 안전하고 건강한 음주습관을 지니고 있으며<br/>
								알콜중독이 의심되지 않습니다<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span><br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우
								5.19세 미만 청소년인 경우
								`);
					}
					else if(result >= 6 && result < 10){
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>위험 음주군입니다`);
						$('#resultC').html(`
								알코올의존 상태에 이미 들어셨습니다.<br/>
								사용 장애 추정군, 신체증상/불안/불면/사회부적응/우울 등이 나타날 수 있어<br/>
								세심한 관심과 전문가의 치료적 개입이 필요합니다.<br/>
								술은 줄이는 단계가 아니라 끊어야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주량과 횟수를 모두 줄여야 합니다.</span><br/>
								1.과음하지 않아야 합니다.1일 5잔(여자4잔) 이상, 1주일 동안 남자 13잔, 여자 6잔 이상은 과음입니다.<br/>
								2.과음한 후 2~3일은 반드시 금주해야 합니다.<br/>
								3.자신만의 절주방법을 정해야 합니다.<br/>
								예) 2차 안가기, 천천히 마시기, 약한 술 마시기, 섞어 마시지 않기 등<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음을 계속할 경우 발생할 수 있는 문제점은?</span><br/>
								1.건강문제 : 간질환, 췌장질환, 위장질환, 성기능저하, 노화, 불면증 ,암 발생 증가<br/>
								2.사고발생 : 교통사고, 음주운전, 작업중 사고, 운동중 사고, 경찰에 불려다니는 일<br/>
								3.대인관계 : 부부, 자녀, 동료, 친구와의 불화, 잦은 실수<br/>
								4.일(직업) : 업무능력 저하, 지각, 결근, 약속불이행<br/>
								5.경제문제 : 물건분실, 치료비용, 지나친 술값 지불<br/>
								6.정신적문제 : 기억력 저하, 뇌의 노화, 알코올성 치매, 우울증, 자살충동<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">과음충동이 들 때는 어떻게 해야 할까?</span><br/>
								1.과음우려가 있을 때는 바로 집으로 간다.<br/>
								2.뒤에 할 일을 남겨 놓거나 다른 대안활동(공연, 운동, 차마시기 등)을 찾는다.<br/>
								3.술 친구를 만나지 않는다.<br/>
								4.2잔 정도만 마시고 음료수를 마신다.<br/>
								5.절주해야하는 이유를 다시 한번 떠올린다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">주기적으로 건강상태를 체크해야 합니다.</span><br/>
								1.신체증상을 주의 깊게 살피고 주기적인 검진을 받아야 합니다.<br/>
								2.숙취가 오랫동안 지속되고 필름끊김 현상이 6개월에 2~3회이상 될 때는 금주해야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주문제를 위해 알코올상담센터나 정신보건센터의 도움을 받도록 합니다.</span></br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이런 때는 금주가 필수입니다!</span><br/>
								1.임신 중이거나 임신을 계획 중인 여성인 경우<br/>
								2.고혈압, 협심증, 간질환, 우울, 불면 등의 증상이 있는 경우<br/>
								3.약을 복용하는 경우<br/>
							     (특히 해열진통제, 결핵치료제, 신경안정제, 항히스타민제, 위궤양치료제 등)<br/>
								4.음주운전, 음주 후 폭행 경력이 있거나 가족 중 알코올중독이 있는 경우<br/>
								5.19세 미만 청소년인 경우<br/>
								`);
					}
					else{
						$('#resultT').addClass('text-danger');
						$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>알코올 사용 장애군입니다`);
						$('#resultC').html(`
								알코올의존 상태에 이미 들어셨습니다.<br/>
								전문의의 진찰과 치료를 시작하는 것이 필요합니다.<br/>
								술은 줄이는 단계가 아니라 끊어야 합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">음주와 관련된 목표를 조정해야합니다.</span><br/>
								1.음주량과 횟수를 조절하는 것이 매우 어려운 단계입니다.<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/>
								3.술을 마시고 실수하는 경우와 중요한 업무를 처리하지 못하는 일이 늘어납니다.<br/>
								4.술을 끊는 것이 알코올 사용장애에서 벗어나는 가장 확실한 방법입니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">정신의료기관(정신과 전문의)이나 알코올상담센터, 정신보건센터에서 전문서비스를 받도록 합니다.</span><br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">자조집단에 참여를 권유합니다.</span><br/>
								1.알코올 중독자 및 가족분들을 위한 익명 상담 사이트 : <a href='http://cafe.naver.com/woori1339'>http:\/\/cafe.naver.com/woori1339</a>, 1644-6139<br/>
								2.술을 마셔야 기분도 좋고, 일도 잘되고 관계도 좋아진다고 생각합니다.<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">알코올 의존증 개선을 위한 치료를 꼭 받으셔야 합니다.</span><br/>
								1.비타민 등 영양공급<br/>
								2.금단증상에 대한 제독치료<br/>
								3.단주를 촉진하기 위한 약물치료(충동억제제, 항불안제, 항우울제)<br/><br/>
								<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">신체에 병이 생기면 치료를 받아서 나을 수 있는 것처럼 알코올 중독도 치료받으면 나을 수 있습니다</span>.
								`);
					}
    			}

    			$('#result').modal('show');
    		}
    	}).fail((e)=>{
    		if(e.responseText=="error"){
    			alert('최근 결과가 없습니다');
    		}
    	});
    }

</script>
</html>