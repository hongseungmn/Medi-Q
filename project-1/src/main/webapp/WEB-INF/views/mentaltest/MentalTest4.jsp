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
			      	<a class="nav-link" href='<c:url value="/project/MentalTest3.do"/>'>알코올 의존(AUDIT-K)</a>
			    </li>
			    <li class="nav-item">
			      	<a class="nav-link active" href='#'>우울증(CES-D)</a>
			    </li>
			</ul>
		</div>
        <h2 class="text-primary font-weight-bold mt-5">통합적 한국판 우울증 척도(CES-D)</h2>
        <small><strong class="small font-weight-bold text-black-50">평가도구원문 : The Center for Epidemiologic Studies Depression Scale(CES-D)</strong></small>
	    <div class="d-flex justify-content-between">
	        <p class="mt-2" style="font-size: 1rem">
	            다음 문항은 마음건강의 정도를 파악하기 위한 것입니다.<br/>
	            아래에 적혀 있는 문항을 잘 읽으신 후, 지난 일주일 동안의 자신의 현재 상태를 가장 잘 나타내는 것에 표시해주시기 바랍니다.
	        </p>
	        <button id="resultCheck" class="btn btn-outline-primary py-0" style="height: 40px" onclick="javascript:result();" data-target="#result" data-backdrop="static">최근 결과 확인하기</button>
	    </div>
        <div class="line"></div>
	    <div>
	        <table>
	            <tbody>
	                <tr class="trTitle">
	                    <th class="pt-4"><span class="text-primary">01</span> 평소에는 아무렇지도 않던 일들이 괴롭고 귀찮게 느껴졌다</th>
	                </tr>
	                <tr class="border-bottom tr-content">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q1" id="dep_q01_01" value="0"/>
	                        <label for="dep_q01_01">극히 드물다</label>
	                        <input type="radio" name="dep_q1" id="dep_q01_02" value="1"/>
	                        <label for="dep_q01_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q1" id="dep_q01_03" value="2"/>
	                        <label for="dep_q01_03">종종 있었다</label>
	                        <input type="radio" name="dep_q1" id="dep_q01_04" value="3"/>
	                        <label for="dep_q01_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><span class="text-primary">02</span> 먹고 싶지 않고 식욕이 없었다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q2" id="dep_q02_01" value="0"/>
	                        <label for="dep_q02_01">극히 드물다</label>
	                        <input type="radio" name="dep_q2" id="dep_q02_02" value="1"/>
	                        <label for="dep_q02_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q2" id="dep_q02_03" value="2"/>
	                        <label for="dep_q02_03">종종 있었다</label>
	                        <input type="radio" name="dep_q2" id="dep_q02_04" value="3"/>
	                        <label for="dep_q02_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">03</span> 어느 누가 도와준다 하더라도, 나의 울적한 기분을 떨쳐 버릴 수 없을 것 같았다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q3" id="dep_q03_01" value="0"/>
	                        <label for="dep_q03_01">극히 드물다</label>
	                        <input type="radio" name="dep_q3" id="dep_q03_02" value="1"/>
	                        <label for="dep_q03_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q3" id="dep_q03_03" value="2"/>
	                        <label for="dep_q03_03">종종 있었다</label>
	                        <input type="radio" name="dep_q3" id="dep_q03_04" value="3"/>
	                        <label for="dep_q03_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">04</span> 무슨 일을 하던 정신을 집중하기가 힘들었다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q4" id="dep_q04_01" value="0"/>
	                        <label for="dep_q04_01">극히 드물다</label>
	                        <input type="radio" name="dep_q4" id="dep_q04_02" value="1"/>
	                        <label for="dep_q04_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q4" id="dep_q04_03" value="2"/>
	                        <label for="dep_q04_03">종종 있었다</label>
	                        <input type="radio" name="dep_q4" id="dep_q04_04" value="3"/>
	                        <label for="dep_q04_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">05</span> 다른 사람들만큼 능력이 있다고 느꼈다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q5" id="dep_q05_01" value="3"/>
	                        <label for="dep_q05_01">극히 드물다</label>
	                        <input type="radio" name="dep_q5" id="dep_q05_02" value="2"/>
	                        <label for="dep_q05_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q5" id="dep_q05_03" value="1"/>
	                        <label for="dep_q05_03">종종 있었다</label>
	                        <input type="radio" name="dep_q5" id="dep_q05_04" value="0"/>
	                        <label for="dep_q05_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">06</span> 상당히 우울했다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q6" id="dep_q06_01" value="0"/>
	                        <label for="dep_q06_01">극히 드물다</label>
	                        <input type="radio" name="dep_q6" id="dep_q06_02" value="1"/>
	                        <label for="dep_q06_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q6" id="dep_q06_03" value="2"/>
	                        <label for="dep_q06_03">종종 있었다</label>
	                        <input type="radio" name="dep_q6" id="dep_q06_04" value="3"/>
	                        <label for="dep_q06_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">07</span> 하는 일마다 힘들게 느껴졌다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q7" id="dep_q07_01" value="0"/>
	                        <label for="dep_q07_01">극히 드물다</label>
	                        <input type="radio" name="dep_q7" id="dep_q07_02" value="1"/>
	                        <label for="dep_q07_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q7" id="dep_q07_03" value="2"/>
	                        <label for="dep_q07_03">종종 있었다</label>
	                        <input type="radio" name="dep_q7" id="dep_q07_04" value="3"/>
	                        <label for="dep_q07_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">08</span> 앞 일이 암담하게 느껴졌다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q8" id="dep_q08_01" value="0"/>
	                        <label for="dep_q08_01">극히 드물다</label>
	                        <input type="radio" name="dep_q8" id="dep_q08_02" value="1"/>
	                        <label for="dep_q08_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q8" id="dep_q08_03" value="2"/>
	                        <label for="dep_q08_03">종종 있었다</label>
	                        <input type="radio" name="dep_q8" id="dep_q08_04" value="3"/>
	                        <label for="dep_q08_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">09</span> 내 인생은 실패작이라는 생각이 들었다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q9" id="dep_q09_01" value="0"/>
	                        <label for="dep_q09_01">극히 드물다</label>
	                        <input type="radio" name="dep_q9" id="dep_q09_02" value="1"/>
	                        <label for="dep_q09_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q9" id="dep_q09_03" value="2"/>
	                        <label for="dep_q09_03">종종 있었다</label>
	                        <input type="radio" name="dep_q9" id="dep_q09_04" value="3"/>
	                        <label for="dep_q09_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">10</span> 적어도 보통사람들 만큼의 능력은 있었다고 생각한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q10" id="dep_q10_01" value="3"/>
	                        <label for="dep_q10_01">극히 드물다</label>
	                        <input type="radio" name="dep_q10" id="dep_q10_02" value="2"/>
	                        <label for="dep_q10_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q10" id="dep_q10_03" value="1"/>
	                        <label for="dep_q10_03">종종 있었다</label>
	                        <input type="radio" name="dep_q10" id="dep_q10_04" value="0"/>
	                        <label for="dep_q10_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">11</span> 잠을 설쳤다(잠을 잘 이루지 못했다).</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q11" id="dep_q11_01" value="0"/>
	                        <label for="dep_q11_01">극히 드물다</label>
	                        <input type="radio" name="dep_q11" id="dep_q11_02" value="1"/>
	                        <label for="dep_q11_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q11" id="dep_q11_03" value="2"/>
	                        <label for="dep_q11_03">종종 있었다</label>
	                        <input type="radio" name="dep_q11" id="dep_q11_04" value="3"/>
	                        <label for="dep_q11_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">12</span> 두려움을 느꼈다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q12" id="dep_q12_01" value="0"/>
	                        <label for="dep_q12_01">극히 드물다</label>
	                        <input type="radio" name="dep_q12" id="dep_q12_02" value="1"/>
	                        <label for="dep_q12_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q12" id="dep_q12_03" value="2"/>
	                        <label for="dep_q12_03">종종 있었다</label>
	                        <input type="radio" name="dep_q12" id="dep_q12_04" value="3"/>
	                        <label for="dep_q12_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">13</span> 평소에 비해 말수가 적었다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q13" id="dep_q13_01" value="0"/>
	                        <label for="dep_q13_01">극히 드물다</label>
	                        <input type="radio" name="dep_q13" id="dep_q13_02" value="1"/>
	                        <label for="dep_q13_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q13" id="dep_q13_03" value="2"/>
	                        <label for="dep_q13_03">종종 있었다</label>
	                        <input type="radio" name="dep_q13" id="dep_q13_04" value="3"/>
	                        <label for="dep_q13_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">14</span> 세상에 홀로 있는 듯한 외로움을 느꼈다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q14" id="dep_q14_01" value="0"/>
	                        <label for="dep_q14_01">극히 드물다</label>
	                        <input type="radio" name="dep_q14" id="dep_q14_02" value="1"/>
	                        <label for="dep_q14_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q14" id="dep_q14_03" value="2"/>
	                        <label for="dep_q14_03">종종 있었다</label>
	                        <input type="radio" name="dep_q14" id="dep_q14_04" value="3"/>
	                        <label for="dep_q14_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">15</span> 큰 불만 없이 생활했다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q15" id="dep_q15_01" value="3"/>
	                        <label for="dep_q15_01">극히 드물다</label>
	                        <input type="radio" name="dep_q15" id="dep_q15_02" value="2"/>
	                        <label for="dep_q15_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q15" id="dep_q15_03" value="1"/>
	                        <label for="dep_q15_03">종종 있었다</label>
	                        <input type="radio" name="dep_q15" id="dep_q15_04" value="0"/>
	                        <label for="dep_q15_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">16</span> 사람들이 나에게 차갑게 대하는 것 같았다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q16" id="dep_q16_01" value="0"/>
	                        <label for="dep_q16_01">극히 드물다</label>
	                        <input type="radio" name="dep_q16" id="dep_q16_02" value="1"/>
	                        <label for="dep_q16_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q16" id="dep_q16_03" value="2"/>
	                        <label for="dep_q16_03">종종 있었다</label>
	                        <input type="radio" name="dep_q16" id="dep_q16_04" value="3"/>
	                        <label for="dep_q16_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">17</span> 갑자기 울음이 나왔다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q17" id="dep_q17_01" value="0"/>
	                        <label for="dep_q17_01">극히 드물다</label>
	                        <input type="radio" name="dep_q17" id="dep_q17_02" value="1"/>
	                        <label for="dep_q17_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q17" id="dep_q17_03" value="2"/>
	                        <label for="dep_q17_03">종종 있었다</label>
	                        <input type="radio" name="dep_q17" id="dep_q17_04" value="3"/>
	                        <label for="dep_q17_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">18</span> 마음이 슬펐다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q18" id="dep_q18_01" value="0"/>
	                        <label for="dep_q18_01">극히 드물다</label>
	                        <input type="radio" name="dep_q18" id="dep_q18_02" value="1"/>
	                        <label for="dep_q18_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q18" id="dep_q18_03" value="2"/>
	                        <label for="dep_q18_03">종종 있었다</label>
	                        <input type="radio" name="dep_q18" id="dep_q18_04" value="3"/>
	                        <label for="dep_q18_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><span class="text-primary">19</span> 사람들이 나를 싫어하는 것 같았다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q19" id="dep_q19_01" value="0"/>
	                        <label for="dep_q19_01">극히 드물다</label>
	                        <input type="radio" name="dep_q19" id="dep_q19_02" value="1"/>
	                        <label for="dep_q19_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q19" id="dep_q19_03" value="2"/>
	                        <label for="dep_q19_03">종종 있었다</label>
	                        <input type="radio" name="dep_q19" id="dep_q19_04" value="3"/>
	                        <label for="dep_q19_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><span class="text-primary">20</span> 도무지 무엇을 시작할 기운이 나지 않았다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="dep_q20" id="dep_q20_01" value="0"/>
	                        <label for="dep_q20_01">극히 드물다</label>
	                        <input type="radio" name="dep_q20" id="dep_q20_02" value="1"/>
	                        <label for="dep_q20_02">가끔 있었다</label>
	                        <input type="radio" name="dep_q20" id="dep_q20_03" value="2"/>
	                        <label for="dep_q20_03">종종 있었다</label>
	                        <input type="radio" name="dep_q20" id="dep_q20_04" value="3"/>
	                        <label for="dep_q20_04">대부분 그랬다</label>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	
	        <div class="d-inline-flex">
	            <button id="resultM" class="btn btn-lg btn-primary my-4" data-toggle="modal" data-target="#result" data-backdrop="static" >우울증 검사결과 보기</button>
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
                    <h4 class="modal-title my-3">우울증 검사결과 보기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="text" class="d-flex flex-wrap">
                        <h5 id="resultT" class="font-weight-bold mb-3">위험군</h5>
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

    //우울증 척도 결과 뿌리기
	$('#resultM').click(function(){
		if($(':radio:checked').length != 20){
			$(this).attr('data-toggle','');
			for (i=1;i<=$(':radio').parent().length;i++){
				//console.log('i:',i)
				//console.log('checked:',$('[name=str_q1]:checked'))
			    if (!$('[name=dep_q'+i+']:checked').length){
			    	var this_ = $('[name=dep_q'+i+']')
				   	alert(i+"번 질문에 답을 선택하세요.");
				   	this_.focus();
				   	return;
			    }
			}
		}
		else{
			$(this).attr('data-toggle','modal');
			var sum=0;
			$('#resultT').removeClass('text-danger text-primary');
			$(':radio:checked').each(function(){
				sum += parseInt($(this).val());
				//console.log('sum:',sum,$(this).val())
			});	
				
			$.ajax({
				data:{
					name:'test4',
					sum:sum
				},
				url:'<c:url value="/project/MentalResult.do"/>',
	    		method:'post',
	    		dataType:'json'
			}).done((result)=>{
				console.log('success:',result)
				
				if(sum > 24){//매우 심한 우울감
					$('#resultT').addClass('text-danger');
					$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>매우 심한 우울감`);
					$('#resultC').html(`광범위한 우울 증상을 매우 자주 심한 수준에서 경험하는 것으로 나타납니다.<br/>
							우울증은 의지로 극복할 순 없습니다.<br/>
							일상생활의 다양한 영역에서 어려움이 초래될경우 추가적인 평가나 정신건강 전문가의 도움을 받아보시기를 권해 드립니다.<br/>
							적극적으로 정신건강 전문가의 도움을 받기를 추천합니다.`);
				}
				else if(sum > 20 && sum <= 24){//심한 우울감
					$('#resultT').addClass('text-danger');
					$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>심한 우울감.`);
					$('#resultC').html(`직업적, 사회적 적응에 일부 영향을 미칠 경우이거나 2주 이상 지속된다면 가까운 전문기관을 방문하기를 권해드립니다.<br/><br>
							아래는 가벼운 경증의 우울 증상의 경우 효과적이라고 검증된 방법입니다.<br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">아로마테라피</span><br/>
							식물에서 추출된 농축된 오일의 특정 화학성분이심신의 이완 효과와 우울감, 불안함, 불쾌감의 감소 효과를 나타냅니다.
							그러나 아로마테라피는 어디까지나 우울증 치료의 보조적인 방법으로써 표준적 치료를 대체해서는 안 됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">독서요법</span><br/>
							독서요법은 우울감, 지나친 죄책감, 비관적 사고 등의 부정적인 정서를 스스로 조절하기 위한 다양한 전략과 이러한 전략을 실생활에 적용하는 방법이 적혀있는 책(매뉴얼)을 읽는 자가 관리법입니다.
							독서 요법의 궁극적 목적은 독자로 하여금 우울증에 도움이 되지 않는 생각이나 행동들을 자각하고 변화시킬 수 있도록 하고, 나아가 자기관리 기술이나 대처기술을 증진할 수 있도록 가이드를 제공해주고 격려해주는 것입니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">컴퓨터를 활용한 중재법</span><br/>
							온라인 프로그램(웹사이트, 모바일 애플리케이션 등)을 이용해 정신 건강을 증진하는 자가 관리법입니다.
							일반적으로 독서 요법과 유사하게 인지 치료나 행동 치료적 접근, 심신 의학적 접근(명상, 이완훈련 등)을 기반으로 
							스스로 자신의 감정과 기분, 생각을 체크하고 문제가 되는 생각이나 행동을 수정하거나 조절할 수 있는 대처기술을 증진하는 프로그램으로 구성됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">광선요법</span><br/>
							겨울철과 같이 일조량이 줄어드는 시기에 생체의 24시간 주기 리듬이 지연되어 우울증이 쉽게 발생할 수 있습니다. 
							광선요법은 이러한 가설을 기반으로 사용되고 있는 방법으로 이른 아침에 30분에서 한 시간 정도 밝은 빛을 노출함으로써 우울증 개선에 도움이 될 수 있습니다. 
							특히 겨울철에 반복되는 계절성 우울증뿐만 아니라 비계절성 우울증에도 효과가 있다는 연구 결과가 있어 항우울제 등의 표준적인 약물치료에 보조적인 요법으로도 권고되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이완 요법</span><br/>
							이완 요법은 스스로 이완시킬 수 있는 방법을 익혀 육체적인 혹은 정신적인 긴장을 감소시키는 방법입니다. 
							대표적으로는 복식호흡, 요가, 점진적 근육 이완법, 마사지, 명상 등이 포함되며, 
							특히 복식호흡과 점진적 근육 이완은 훈련을 통해 익힌 후에는 언제 어디서나 이완이 필요한 순간에 적용할 수 있는 장점이 있습니다. 
							이완 요법은 우울증, 공황장애 등의 불안장애, 불면증 등 다양한 정신질환의 치료에도 효과적으로 이용되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">운동</span><br/>
							운동은 우울증의 위험도를 낮추고, 우울증 환자에서 증상을 경감시켜 줄 수 있습니다. 
							최근 캐나다의 가이드라인에서는 매주 3회 이상 중등도의 강도로 최소 9주 동안 운동을 지속하는 것이 우울감 감소에 효과적이라고 말합니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">기타</span><br/>
							기타 방법으로는 스트레스 피하기, 식이, 절주, 적정 체중 유지 방법이 있습니다
							`);
				}
				else if(sum > 15 && sum <= 20){//약간의/보통의 우울감
					$('#resultT').addClass('text-danger');
					$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>약간의/보통의 우울감.`);
					$('#resultC').html(`가벼운 경증의 우울감이 느껴질 때 다음의 방법들이 도움이 될 수 있습니다.<br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">아로마테라피</span><br/>
							식물에서 추출된 농축된 오일의 특정 화학성분이심신의 이완 효과와 우울감, 불안함, 불쾌감의 감소 효과를 나타냅니다.
							그러나 아로마테라피는 어디까지나 우울증 치료의 보조적인 방법으로써 표준적 치료를 대체해서는 안 됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">독서요법</span><br/>
							독서요법은 우울감, 지나친 죄책감, 비관적 사고 등의 부정적인 정서를 스스로 조절하기 위한 다양한 전략과 이러한 전략을 실생활에 적용하는 방법이 적혀있는 책(매뉴얼)을 읽는 자가 관리법입니다.
							독서 요법의 궁극적 목적은 독자로 하여금 우울증에 도움이 되지 않는 생각이나 행동들을 자각하고 변화시킬 수 있도록 하고, 나아가 자기관리 기술이나 대처기술을 증진할 수 있도록 가이드를 제공해주고 격려해주는 것입니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">컴퓨터를 활용한 중재법</span><br/>
							온라인 프로그램(웹사이트, 모바일 애플리케이션 등)을 이용해 정신 건강을 증진하는 자가 관리법입니다.
							일반적으로 독서 요법과 유사하게 인지 치료나 행동 치료적 접근, 심신 의학적 접근(명상, 이완훈련 등)을 기반으로 
							스스로 자신의 감정과 기분, 생각을 체크하고 문제가 되는 생각이나 행동을 수정하거나 조절할 수 있는 대처기술을 증진하는 프로그램으로 구성됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">광선요법</span><br/>
							겨울철과 같이 일조량이 줄어드는 시기에 생체의 24시간 주기 리듬이 지연되어 우울증이 쉽게 발생할 수 있습니다. 
							광선요법은 이러한 가설을 기반으로 사용되고 있는 방법으로 이른 아침에 30분에서 한 시간 정도 밝은 빛을 노출함으로써 우울증 개선에 도움이 될 수 있습니다. 
							특히 겨울철에 반복되는 계절성 우울증뿐만 아니라 비계절성 우울증에도 효과가 있다는 연구 결과가 있어 항우울제 등의 표준적인 약물치료에 보조적인 요법으로도 권고되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이완 요법</span><br/>
							이완 요법은 스스로 이완시킬 수 있는 방법을 익혀 육체적인 혹은 정신적인 긴장을 감소시키는 방법입니다. 
							대표적으로는 복식호흡, 요가, 점진적 근육 이완법, 마사지, 명상 등이 포함되며, 
							특히 복식호흡과 점진적 근육 이완은 훈련을 통해 익힌 후에는 언제 어디서나 이완이 필요한 순간에 적용할 수 있는 장점이 있습니다. 
							이완 요법은 우울증, 공황장애 등의 불안장애, 불면증 등 다양한 정신질환의 치료에도 효과적으로 이용되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">운동</span><br/>
							운동은 우울증의 위험도를 낮추고, 우울증 환자에서 증상을 경감시켜 줄 수 있습니다. 
							최근 캐나다의 가이드라인에서는 매주 3회 이상 중등도의 강도로 최소 9주 동안 운동을 지속하는 것이 우울감 감소에 효과적이라고 말합니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">기타</span><br/>
							기타 방법으로는 스트레스 피하기, 식이, 절주, 적정 체중 유지 방법이 있습니다
							`);
				}
				else{//정상적인 우울감
					$('#resultT').addClass('text-primary');
					$('#resultT').html(`<img alt='엄지' src='/images/basic/like.png'/>정상적인 우울감.`);
					$('#resultC').html(`현재 지장을 초래할만한 우울현상을 경험하지 않고 있으며, 심리적으로 건강하게 생활하고 있습니다.<br/>
						    평소의 마음건강 관리방법을 꾸준히 유지하시기 바랍니다.`);
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
    		data:{name:"result",test:"test4"},
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
				
				if(result > 24){//매우 심한 우울감
					$('#resultT').addClass('text-danger');
					$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>매우 심한 우울감`);
					$('#resultC').html(`광범위한 우울 증상을 매우 자주 심한 수준에서 경험하는 것으로 나타납니다.<br/>
							우울증은 의지로 극복할 순 없습니다.<br/>
							일상생활의 다양한 영역에서 어려움이 초래될경우 추가적인 평가나 정신건강 전문가의 도움을 받아보시기를 권해 드립니다.<br/>
							적극적으로 정신건강 전문가의 도움을 받기를 추천합니다.`);
				}
				else if(result > 20 && result <= 24){//심한 우울감
					$('#resultT').addClass('text-danger');
					$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>심한 우울감.`);
					$('#resultC').html(`직업적, 사회적 적응에 일부 영향을 미칠 경우이거나 2주 이상 지속된다면 가까운 전문기관을 방문하기를 권해드립니다.<br/><br>
							아래는 가벼운 경증의 우울 증상의 경우 효과적이라고 검증된 방법입니다.<br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">아로마테라피</span><br/>
							식물에서 추출된 농축된 오일의 특정 화학성분이심신의 이완 효과와 우울감, 불안함, 불쾌감의 감소 효과를 나타냅니다.
							그러나 아로마테라피는 어디까지나 우울증 치료의 보조적인 방법으로써 표준적 치료를 대체해서는 안 됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">독서요법</span><br/>
							독서요법은 우울감, 지나친 죄책감, 비관적 사고 등의 부정적인 정서를 스스로 조절하기 위한 다양한 전략과 이러한 전략을 실생활에 적용하는 방법이 적혀있는 책(매뉴얼)을 읽는 자가 관리법입니다.
							독서 요법의 궁극적 목적은 독자로 하여금 우울증에 도움이 되지 않는 생각이나 행동들을 자각하고 변화시킬 수 있도록 하고, 나아가 자기관리 기술이나 대처기술을 증진할 수 있도록 가이드를 제공해주고 격려해주는 것입니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">컴퓨터를 활용한 중재법</span><br/>
							온라인 프로그램(웹사이트, 모바일 애플리케이션 등)을 이용해 정신 건강을 증진하는 자가 관리법입니다.
							일반적으로 독서 요법과 유사하게 인지 치료나 행동 치료적 접근, 심신 의학적 접근(명상, 이완훈련 등)을 기반으로 
							스스로 자신의 감정과 기분, 생각을 체크하고 문제가 되는 생각이나 행동을 수정하거나 조절할 수 있는 대처기술을 증진하는 프로그램으로 구성됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">광선요법</span><br/>
							겨울철과 같이 일조량이 줄어드는 시기에 생체의 24시간 주기 리듬이 지연되어 우울증이 쉽게 발생할 수 있습니다. 
							광선요법은 이러한 가설을 기반으로 사용되고 있는 방법으로 이른 아침에 30분에서 한 시간 정도 밝은 빛을 노출함으로써 우울증 개선에 도움이 될 수 있습니다. 
							특히 겨울철에 반복되는 계절성 우울증뿐만 아니라 비계절성 우울증에도 효과가 있다는 연구 결과가 있어 항우울제 등의 표준적인 약물치료에 보조적인 요법으로도 권고되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이완 요법</span><br/>
							이완 요법은 스스로 이완시킬 수 있는 방법을 익혀 육체적인 혹은 정신적인 긴장을 감소시키는 방법입니다. 
							대표적으로는 복식호흡, 요가, 점진적 근육 이완법, 마사지, 명상 등이 포함되며, 
							특히 복식호흡과 점진적 근육 이완은 훈련을 통해 익힌 후에는 언제 어디서나 이완이 필요한 순간에 적용할 수 있는 장점이 있습니다. 
							이완 요법은 우울증, 공황장애 등의 불안장애, 불면증 등 다양한 정신질환의 치료에도 효과적으로 이용되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">운동</span><br/>
							운동은 우울증의 위험도를 낮추고, 우울증 환자에서 증상을 경감시켜 줄 수 있습니다. 
							최근 캐나다의 가이드라인에서는 매주 3회 이상 중등도의 강도로 최소 9주 동안 운동을 지속하는 것이 우울감 감소에 효과적이라고 말합니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">기타</span><br/>
							기타 방법으로는 스트레스 피하기, 식이, 절주, 적정 체중 유지 방법이 있습니다
							`);
				}
				else if(result > 15 && result <= 20){//약간의/보통의 우울감
					$('#resultT').addClass('text-danger');
					$('#resultT').html(`<img alt='느낌표' src='/images/basic/warning2.png'/>약간의/보통의 우울감.`);
					$('#resultC').html(`가벼운 경증의 우울감이 느껴질 때 다음의 방법들이 도움이 될 수 있습니다.<br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">아로마테라피</span><br/>
							식물에서 추출된 농축된 오일의 특정 화학성분이심신의 이완 효과와 우울감, 불안함, 불쾌감의 감소 효과를 나타냅니다.
							그러나 아로마테라피는 어디까지나 우울증 치료의 보조적인 방법으로써 표준적 치료를 대체해서는 안 됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">독서요법</span><br/>
							독서요법은 우울감, 지나친 죄책감, 비관적 사고 등의 부정적인 정서를 스스로 조절하기 위한 다양한 전략과 이러한 전략을 실생활에 적용하는 방법이 적혀있는 책(매뉴얼)을 읽는 자가 관리법입니다.
							독서 요법의 궁극적 목적은 독자로 하여금 우울증에 도움이 되지 않는 생각이나 행동들을 자각하고 변화시킬 수 있도록 하고, 나아가 자기관리 기술이나 대처기술을 증진할 수 있도록 가이드를 제공해주고 격려해주는 것입니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">컴퓨터를 활용한 중재법</span><br/>
							온라인 프로그램(웹사이트, 모바일 애플리케이션 등)을 이용해 정신 건강을 증진하는 자가 관리법입니다.
							일반적으로 독서 요법과 유사하게 인지 치료나 행동 치료적 접근, 심신 의학적 접근(명상, 이완훈련 등)을 기반으로 
							스스로 자신의 감정과 기분, 생각을 체크하고 문제가 되는 생각이나 행동을 수정하거나 조절할 수 있는 대처기술을 증진하는 프로그램으로 구성됩니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">광선요법</span><br/>
							겨울철과 같이 일조량이 줄어드는 시기에 생체의 24시간 주기 리듬이 지연되어 우울증이 쉽게 발생할 수 있습니다. 
							광선요법은 이러한 가설을 기반으로 사용되고 있는 방법으로 이른 아침에 30분에서 한 시간 정도 밝은 빛을 노출함으로써 우울증 개선에 도움이 될 수 있습니다. 
							특히 겨울철에 반복되는 계절성 우울증뿐만 아니라 비계절성 우울증에도 효과가 있다는 연구 결과가 있어 항우울제 등의 표준적인 약물치료에 보조적인 요법으로도 권고되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이완 요법</span><br/>
							이완 요법은 스스로 이완시킬 수 있는 방법을 익혀 육체적인 혹은 정신적인 긴장을 감소시키는 방법입니다. 
							대표적으로는 복식호흡, 요가, 점진적 근육 이완법, 마사지, 명상 등이 포함되며, 
							특히 복식호흡과 점진적 근육 이완은 훈련을 통해 익힌 후에는 언제 어디서나 이완이 필요한 순간에 적용할 수 있는 장점이 있습니다. 
							이완 요법은 우울증, 공황장애 등의 불안장애, 불면증 등 다양한 정신질환의 치료에도 효과적으로 이용되고 있습니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">운동</span><br/>
							운동은 우울증의 위험도를 낮추고, 우울증 환자에서 증상을 경감시켜 줄 수 있습니다. 
							최근 캐나다의 가이드라인에서는 매주 3회 이상 중등도의 강도로 최소 9주 동안 운동을 지속하는 것이 우울감 감소에 효과적이라고 말합니다.<br/><br/>
							<img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">기타</span><br/>
							기타 방법으로는 스트레스 피하기, 식이, 절주, 적정 체중 유지 방법이 있습니다
							`);
				}
				else{//정상적인 우울감
					$('#resultT').addClass('text-primary');
					$('#resultT').html(`<img alt='엄지' src='/images/basic/like.png'/>정상적인 우울감.`);
					$('#resultC').html(`현재 지장을 초래할만한 우울현상을 경험하지 않고 있으며, 심리적으로 건강하게 생활하고 있습니다.<br/>
						    평소의 마음건강 관리방법을 꾸준히 유지하시기 바랍니다.`);
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