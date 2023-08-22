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
		      	<a class="nav-link active" href='#'>흡연 유형 평가</a>
		    </li>
		    <li class="nav-item">
		      	<a class="nav-link" href='<c:url value="/project/MentalTest3.do"/>'>알코올 의존(AUDIT-K)</a>
		    </li>
		    <li class="nav-item">
		      	<a class="nav-link" href='<c:url value="/project/MentalTest4.do"/>'>우울증(CES-D)</a>
		    </li>
		</ul>
	</div>
	
        <h2 class="text-primary font-weight-bold mt-5">흡연 유형 평가</h2>
        <small><strong class="small font-weight-bold text-black-50">평가도구 원문: Why smoking test</strong></small>
        <div class="d-flex justify-content-between">
	        <p class="mt-2" style="font-size: 1rem">
	            모두 동일한 담배를 피우고 있기는 하지만 담배를 피워서 얻고자 하는 효과는 흡연자마다 다릅니다.<br/>
	            지금 당신이 담배를 피우고 있는 이유는 무엇일까요?<br/> 
	            나도 모르고 있는 나의 흡연유형을 다음의 평가를 통해서 알려드립니다
	        </p>
	        <button id="resultCheck" class="btn btn-outline-primary py-0" style="height: 40px" onclick="javascript:result();" data-target="#result" data-backdrop="static" >최근 결과 확인하기</button>
	    </div>
        <div class="line"></div>
	    <div>
	        <table>
	            <tbody>
	                <tr class="trTitle">
	                    <th class="pt-4"><span class="text-primary">01</span> 기분이 쳐지는 것을 막기 위해 흡연한다.</th>
	                </tr>
	                <tr class="border-bottom tr-content">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q1" id="smo_a01_01" value="5"/>
	                        <label for="smo_a01_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q1" id="smo_a01_02" value="4"/>
	                        <label for="smo_a01_02">그렇다</label>
	                        <input type="radio" name="smo_q1" id="smo_a01_03" value="3"/>
	                        <label for="smo_a01_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q1" id="smo_a01_04" value="2"/>
	                        <label for="smo_a01_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q1" id="smo_a01_05" value="1"/>
	                        <label for="smo_a01_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <th><span class="text-primary">02</span> 담배를 피우면 자극이 되고 일을 잘하게 된다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q2" id="smo_a02_01" value="5"/>
	                        <label for="smo_a02_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q2" id="smo_a02_02" value="4"/>
	                        <label for="smo_a02_02">그렇다</label>
	                        <input type="radio" name="smo_q2" id="smo_a02_03" value="3"/>
	                        <label for="smo_a02_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q2" id="smo_a02_04" value="2"/>
	                        <label for="smo_a02_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q2" id="smo_a02_05" value="1"/>
	                        <label for="smo_a02_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">03</span> 기분을 상승시키려고 담배를 피운다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q3" id="smo_a03_01" value="5"/>
	                        <label for="smo_a03_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q3" id="smo_a03_02" value="4"/>
	                        <label for="smo_a03_02">그렇다</label>
	                        <input type="radio" name="smo_q3" id="smo_a03_03" value="3"/>
	                        <label for="smo_a03_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q3" id="smo_a03_04" value="2"/>
	                        <label for="smo_a03_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q3" id="smo_a03_05" value="1"/>
	                        <label for="smo_a03_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">04</span> 담배나 라이터를 들고 있는 것을 좋아한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q4" id="smo_b01_01" value="5"/>
	                        <label for="smo_b01_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q4" id="smo_b01_02" value="4"/>
	                        <label for="smo_b01_02">그렇다</label>
	                        <input type="radio" name="smo_q4" id="smo_b01_03" value="3"/>
	                        <label for="smo_b01_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q4" id="smo_b01_04" value="2"/>
	                        <label for="smo_b01_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q4" id="smo_b01_05" value="1"/>
	                        <label for="smo_b01_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">05</span> 담배 피우는 과정(불붙이고 연기를 들이마시고 내뿜는 것 등)이 즐겁다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q5" id="smo_b02_01" value="5"/>
	                        <label for="smo_b02_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q5" id="smo_b02_02" value="4"/>
	                        <label for="smo_b02_02">그렇다</label>
	                        <input type="radio" name="smo_q5" id="smo_b02_03" value="3"/>
	                        <label for="smo_b02_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q5" id="smo_b02_04" value="2"/>
	                        <label for="smo_b02_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q5" id="smo_b02_05" value="1"/>
	                        <label for="smo_b02_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">06</span> 내뿜는 담배연기를 쳐다보는 재미가 좋다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q6" id="smo_b03_01" value="5"/>
	                        <label for="smo_b03_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q6" id="smo_b03_02" value="4"/>
	                        <label for="smo_b03_02">그렇다</label>
	                        <input type="radio" name="smo_q6" id="smo_b03_03" value="3"/>
	                        <label for="smo_b03_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q6" id="smo_b03_04" value="2"/>
	                        <label for="smo_b03_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q6" id="smo_b03_05" value="1"/>
	                        <label for="smo_b03_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">07</span> 담배를 피우면 즐겁고 편안해진다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q7" id="smo_c01_01" value="5"/>
	                        <label for="smo_c01_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q7" id="smo_c01_02" value="4"/>
	                        <label for="smo_c01_02">그렇다</label>
	                        <input type="radio" name="smo_q7" id="smo_c01_03" value="3"/>
	                        <label for="smo_c01_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q7" id="smo_c01_04" value="2"/>
	                        <label for="smo_c01_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q7" id="smo_c01_05" value="1"/>
	                        <label for="smo_c01_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">08</span> 담배 피우는 자체가 즐겁다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q8" id="smo_c02_01" value="5"/>
	                        <label for="smo_c02_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q8" id="smo_c02_02" value="4"/>
	                        <label for="smo_c02_02">그렇다</label>
	                        <input type="radio" name="smo_q8" id="smo_c02_03" value="3"/>
	                        <label for="smo_c02_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q8" id="smo_c02_04" value="2"/>
	                        <label for="smo_c02_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q8" id="smo_c02_05" value="1"/>
	                        <label for="smo_c02_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">09</span> 위로와 기분 이완을 위해 흡연한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q9" id="smo_c03_01" value="5"/>
	                        <label for="smo_c03_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q9" id="smo_c03_02" value="4"/>
	                        <label for="smo_c03_02">그렇다</label>
	                        <input type="radio" name="smo_q9" id="smo_c03_03" value="3"/>
	                        <label for="smo_c03_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q9" id="smo_c03_04" value="2"/>
	                        <label for="smo_c03_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q9" id="smo_c03_05" value="1"/>
	                        <label for="smo_c03_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">10</span> 무슨 일에 화가날 때 담배를 피우게 된다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q10" id="smo_d01_01" value="5"/>
	                        <label for="smo_d01_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q10" id="smo_d01_02" value="4"/>
	                        <label for="smo_d01_02">그렇다</label>
	                        <input type="radio" name="smo_q10" id="smo_d01_03" value="3"/>
	                        <label for="smo_d01_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q10" id="smo_d01_04" value="2"/>
	                        <label for="smo_d01_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q10" id="smo_d01_05" value="1"/>
	                        <label for="smo_d01_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">11</span> 마음이 불안하고 긴장될 때 담배를 피우게 된다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q11" id="smo_d02_01" value="5"/>
	                        <label for="smo_d02_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q11" id="smo_d02_02" value="4"/>
	                        <label for="smo_d02_02">그렇다</label>
	                        <input type="radio" name="smo_q11" id="smo_d02_03" value="3"/>
	                        <label for="smo_d02_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q11" id="smo_d02_04" value="2"/>
	                        <label for="smo_d02_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q11" id="smo_d02_05" value="1"/>
	                        <label for="smo_d02_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">12</span> 기분이 울적하거나 걱정이 있을 때 담배를 피우게 된다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q12" id="smo_d03_01" value="5"/>
	                        <label for="smo_d03_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q12" id="smo_d03_02" value="4"/>
	                        <label for="smo_d03_02">그렇다</label>
	                        <input type="radio" name="smo_q12" id="smo_d03_03" value="3"/>
	                        <label for="smo_d03_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q12" id="smo_d03_04" value="2"/>
	                        <label for="smo_d03_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q12" id="smo_d03_05" value="1"/>
	                        <label for="smo_d03_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">13</span> 담배가 떨어지면 불안해서 못 견딘다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q13" id="smo_e01_01" value="5"/>
	                        <label for="smo_e01_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q13" id="smo_e01_02" value="4"/>
	                        <label for="smo_e01_02">그렇다</label>
	                        <input type="radio" name="smo_q13" id="smo_e01_03" value="3"/>
	                        <label for="smo_e01_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q13" id="smo_e01_04" value="2"/>
	                        <label for="smo_e01_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q13" id="smo_e01_05" value="1"/>
	                        <label for="smo_e01_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">14</span> 담배를 안 피우고 있을 때 그 사실을 정확하게 인식한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q14" id="smo_e02_01" value="5"/>
	                        <label for="smo_e02_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q14" id="smo_e02_02" value="4"/>
	                        <label for="smo_e02_02">그렇다</label>
	                        <input type="radio" name="smo_q14" id="smo_e02_03" value="3"/>
	                        <label for="smo_e02_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q14" id="smo_e02_04" value="2"/>
	                        <label for="smo_e02_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q14" id="smo_e02_05" value="1"/>
	                        <label for="smo_e02_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">15</span> 얼마동안 담배를 안 피우면 담배생각이 나서 견딜 수가 없다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q15" id="smo_e03_01" value="5"/>
	                        <label for="smo_e03_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q15" id="smo_e03_02" value="4"/>
	                        <label for="smo_e03_02">그렇다</label>
	                        <input type="radio" name="smo_q15" id="smo_e03_03" value="3"/>
	                        <label for="smo_e03_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q15" id="smo_e03_04" value="2"/>
	                        <label for="smo_e03_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q15" id="smo_e03_05" value="1"/>
	                        <label for="smo_e03_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">16</span> 나도 모르는 사이에 저절로 담배를 피우게 된다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q16" id="smo_f01_01" value="5"/>
	                        <label for="smo_f01_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q16" id="smo_f01_02" value="4"/>
	                        <label for="smo_f01_02">그렇다</label>
	                        <input type="radio" name="smo_q16" id="smo_f01_03" value="3"/>
	                        <label for="smo_f01_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q16" id="smo_f01_04" value="2"/>
	                        <label for="smo_f01_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q16" id="smo_f01_05" value="1"/>
	                        <label for="smo_f01_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">17</span> 재떨이 위에 피우던 담배를 놓고도 또 담배에 불을 붙인다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q17" id="smo_f02_01" value="5"/>
	                        <label for="smo_f02_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q17" id="smo_f02_02" value="4"/>
	                        <label for="smo_f02_02">그렇다</label>
	                        <input type="radio" name="smo_q17" id="smo_f02_03" value="3"/>
	                        <label for="smo_f02_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q17" id="smo_f02_04" value="2"/>
	                        <label for="smo_f02_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q17" id="smo_f02_05" value="1"/>
	                        <label for="smo_f02_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	
	                <tr>
	                    <th><span class="text-primary">18</span> 언제 담배에 불을 붙였는지 모르는 상태에서 담배를 물고 있는 것을 발견하기도 한다.</th>
	                </tr>
	                <tr class="border-bottom">
	                    <td class="py-4">
	                        <input type="radio" name="smo_q18" id="smo_f03_01" value="5"/>
	                        <label for="smo_f03_01">자주 그렇다</label>
	                        <input type="radio" name="smo_q18" id="smo_f03_02" value="4"/>
	                        <label for="smo_f03_02">그렇다</label>
	                        <input type="radio" name="smo_q18" id="smo_f03_03" value="3"/>
	                        <label for="smo_f03_03">가끔 그렇다</label>
	                        <input type="radio" name="smo_q18" id="smo_f03_04" value="2"/>
	                        <label for="smo_f03_04">그렇지 않다</label>
	                        <input type="radio" name="smo_q18" id="smo_f03_05" value="1"/>
	                        <label for="smo_f03_05">전혀 그렇지 않다</label>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	
	        <div class="d-inline-flex">
	            <button id="resultM" class="btn btn-lg btn-primary my-4" data-toggle="modal" data-target="#result" data-backdrop="static" >흡연 유형 검사결과 보기</button>
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
                    <h4 class="modal-title my-3">흡연 유형 검사결과 보기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="text" class="d-flex flex-wrap">
                    <!--  
                        <h5 id="resultT" class="text-danger font-weight-bold mb-3">흡연유형 해석결과</h5>
                        <p id="resultC">부가설명</p>
                        -->
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
    console.log('//',${empty payload.sub})
    //흡연유형 결과 뿌리기
	$('#resultM').click(function(){
		$('#text').children().remove();
		if($(':radio:checked').length != 18){
			$(this).attr('data-toggle','');
			for (i=1;i<=$(':radio').parent().length;i++){
				//console.log('i:',i)
				//console.log('checked:',$('[name=str_q1]:checked'))
			    if (!$('[name=smo_q'+i+']:checked').length){
			    	var this_ = $('[name=smo_q'+i+']')
				   	alert(i+"번 질문에 답을 선택하세요.");
				   	this_.focus();
				   	return;
			    }
			}
		}
		else{
			$(this).attr('data-toggle','modal');
			var text='';
			var suma=0, sumb=0, sumc=0, sumd=0, sume=0; sumf=0;
			$('[id*=smo_a]:checked').each(function(){
				suma += parseInt($(this).val());
			});
			$('[id*=smo_b]:checked').each(function(){
				sumb += parseInt($(this).val());
			});
			$('[id*=smo_c]:checked').each(function(){
				sumc += parseInt($(this).val());
			});
			$('[id*=smo_d]:checked').each(function(){
				sumd += parseInt($(this).val());
			});
			$('[id*=smo_e]:checked').each(function(){
				sume += parseInt($(this).val());
			});
			$('[id*=smo_f]:checked').each(function(){
				sumf += parseInt($(this).val());
			});
			//console.log('suma:%s,sumb:%s,sumc:%s,sumd:%s,sume:%s,sumf:%s',suma,sumb,sumc,sumd,sume,sumf);
			var sum = suma+' '+sumb+' '+sumc+' '+sumd+' '+sume+' '+sumf;
			$.ajax({
				data:{
					name:'test2',
					sum:sum
				},
				url:'<c:url value="/project/MentalResult.do"/>',
	    		method:'post',
	    		dataType:'json'
			}).done((result)=>{
				console.log('success:',result)
			
				if(suma >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 자극형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">대체 자극을 찾아라!</span><br/>
						자극형 흡연자는 흡연행위를 생활의 활력을 북돋는 것처럼 느끼고, 
						이것이 습관화된 상태이므로, 다른 방법을 생활의 활력소로 이용한다면 금연에 도움이 될 수 있다. 
						우선, 담배를 잊을 정도로 매우 바쁘게 지내고, 집에 있는 동안에도 산책이나 집안청소, 요리, 운동 등 활동적으로 생활한다. 
						몸과 정신이 느슨해질 때에는 가벼운 세수를 하여 기분을 상쾌하게 만들도록 한다. 
						갑작스럽게 담배가 피우고 싶을 때에는 찬물, 무가당껌, 무가당사탕 등을 먹고, 식사 후에는 곧바로 이를 닦도록 한다. 
						또한 수면시간을 충분히 확보하여 정신을 맑은 상태로 유지하는 것이 좋다.</p>`;
				}
				if(sumb >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 손장난형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">손을 바쁘게 만들어라!</span><br/>
						손장난형 흡연자는 담배 피우는 행위 자체를 즐기며 담배를 손장난을 위한 도구로 활용한다. 
						따라서 담배 이외의 다른 대용품이 금연을 유지하는데 꼭 필요하다. 
						휴대가 간편한 악력기, 지압봉, 작은공 등을 사용하여 담배 이외의 것으로 주의를 환기시킨다. 
						연필, 볼펜, 지우개, 고무줄 등 간단한 사무용품을 이용하거나 꽃이나 화초를 키우는 것도 좋다. 
						손과 도구를 이용해 만들 수 있는 장난감 등을 조립하거나 책장, 서랍청소도 추천한다.</p>`;
				}
				if(sumc >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 즐거움과 편안함형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">다른 즐거움의 대안을 찾아라!</span><br/>
						즐거움과 편안함형 흡연자는 흡연을 통해 신체적, 정신적 즐거움을 얻는다고 생각한다. 
						따라서 우선적으로 금연을 했을 때 얻을수 있는 즐거움에 대해서 목록을 작성해보는 것이 좋다. 
						또한 즐길 수 있는 가벼운 운동이나 독서를 시작하거나, 음악 감상과 온수목욕 등으로 편안한 마음상태를 만들도록 한다. 
						금연을 지지하는 가족, 친구, 애인과 함께 유익한 시간을 계획해서 보내는 것도 좋은 방법이다.</p>`;
				}
				if(sumd >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 스트레스 해소형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이완할 수 있는 대안을 찾아라!</span><br/>
						스트레스 해소형 흡연자는 말 그대로 일상의 스트레스를 담배에 의지하여 해결하고 있다. 
						이런 경우에는 흡연이 일시적인 긴장이완에 도움이 될 수도 있지만 
						오히려 만성스트레스를 일으킨다는 사실을 깨닫고 담배 이외의 스트레스 해소법을 마련해야 한다. 
						가장 효과적인 방법으로는 규칙적인 운동을 꼽을 수 있다. 
						또한 일상에서 즐길수 있는 자신만의 취미를 갖는 것도 좋다. 
						갑작스러운 스트레스에는 심호흡을 하거나, 명상, 음악감상 등을 통해 긴장을 이완시키고, 
						악력기, 지압봉, 작은 공 등을 휴대하고 다니면서 주의를 환기시키는 것도 좋은 방법이다.</p>`;
				}
				if(sume >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 육체, 심리적 중독형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">흡연갈망에 대한 대처방법을 찾아라!</span><br/>
						육체, 심리적 중독형 흡연자는 과도한 흡연으로 니코틴에 대한 의존도가 심한 경우에 해당한다. 
						이런 경우는 금연 시 금단증세가 심하게 나타날 수 있기 때문에 
						금연상담가의 도움을 얻어 니코틴 보조제(패치, 껌, 사탕)를 사용하는 것이 도움이 될 수 있다. 
						특히, 알코올과 카페인은 니코틴과 뇌에서 작용하는 부위와 기적이 동일하므로 
						술과 커피를 금연과 동시에 적극적으로 조절해야만 한다. 
						평소에 담배 이외에 사용 할 수 있는 무가당껌, 무가당사탕, 은단 등을 휴대하고 다닌다.</p>`;
				}
				if(sumf >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 습관형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">자동적 흡연을 유발하는 환경을 바꿔라</span><br/>
						습관형 흡연자는 자신도 모르게 담배를 피우는 경우가 많다. 
						따라서 흡연일기를 작성하여 어떠한 상황에서 흡연충동이 일어나는지를 확인하고 
						그러한 장소나 상황 등을 피하도록 해야 한다. 
						또한 일상적인 생활패턴에 변화를 주거나 적당한 운동이나 취미활동을 찾아보는 것도 도움이 된다. 
						습관적으로 담배를 피웠던 상황에서 찬물이나 무가당껌, 무가당사탕, 은단, 악력기, 지압봉 등을 사용하는 것이 좋다.</p>`;
				}
				if(text.length==0){
					text = `<h5 id="resultT" class="text-primary font-weight-bold mb-3"><img alt='엄지' src='/images/basic/like.png'/>흡연유형에 속하는 부분이 없습니다.</h5>`;
				}
				if(!$('#text').find('h5').length){
					$('#text').append(text);
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
    		data:{name:"result",test:"test2"},
    		url:'<c:url value="/project/MentalResult.do"/>',
    		method:'post'
    		//dataType:'json'
    	}).done((result)=>{
    		console.log('success:',result)
			var text='';
    		if(result==='error'){
    			alert('최근 결과가 없습니다');
    		}
    		else{
				if(parseInt(result.split(' ')[0]) >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 자극형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">대체 자극을 찾아라!</span><br/>
						자극형 흡연자는 흡연행위를 생활의 활력을 북돋는 것처럼 느끼고, 
						이것이 습관화된 상태이므로, 다른 방법을 생활의 활력소로 이용한다면 금연에 도움이 될 수 있다. 
						우선, 담배를 잊을 정도로 매우 바쁘게 지내고, 집에 있는 동안에도 산책이나 집안청소, 요리, 운동 등 활동적으로 생활한다. 
						몸과 정신이 느슨해질 때에는 가벼운 세수를 하여 기분을 상쾌하게 만들도록 한다. 
						갑작스럽게 담배가 피우고 싶을 때에는 찬물, 무가당껌, 무가당사탕 등을 먹고, 식사 후에는 곧바로 이를 닦도록 한다. 
						또한 수면시간을 충분히 확보하여 정신을 맑은 상태로 유지하는 것이 좋다.</p>`;
				}
				if(parseInt(result.split(' ')[1]) >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 손장난형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">손을 바쁘게 만들어라!</span><br/>
						손장난형 흡연자는 담배 피우는 행위 자체를 즐기며 담배를 손장난을 위한 도구로 활용한다. 
						따라서 담배 이외의 다른 대용품이 금연을 유지하는데 꼭 필요하다. 
						휴대가 간편한 악력기, 지압봉, 작은공 등을 사용하여 담배 이외의 것으로 주의를 환기시킨다. 
						연필, 볼펜, 지우개, 고무줄 등 간단한 사무용품을 이용하거나 꽃이나 화초를 키우는 것도 좋다. 
						손과 도구를 이용해 만들 수 있는 장난감 등을 조립하거나 책장, 서랍청소도 추천한다.</p>`;
				}
				if(parseInt(result.split(' ')[2]) >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 즐거움과 편안함형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">다른 즐거움의 대안을 찾아라!</span><br/>
						즐거움과 편안함형 흡연자는 흡연을 통해 신체적, 정신적 즐거움을 얻는다고 생각한다. 
						따라서 우선적으로 금연을 했을 때 얻을수 있는 즐거움에 대해서 목록을 작성해보는 것이 좋다. 
						또한 즐길 수 있는 가벼운 운동이나 독서를 시작하거나, 음악 감상과 온수목욕 등으로 편안한 마음상태를 만들도록 한다. 
						금연을 지지하는 가족, 친구, 애인과 함께 유익한 시간을 계획해서 보내는 것도 좋은 방법이다.</p>`;
				}
				if(parseInt(result.split(' ')[3]) >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 스트레스 해소형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">이완할 수 있는 대안을 찾아라!</span><br/>
						스트레스 해소형 흡연자는 말 그대로 일상의 스트레스를 담배에 의지하여 해결하고 있다. 
						이런 경우에는 흡연이 일시적인 긴장이완에 도움이 될 수도 있지만 
						오히려 만성스트레스를 일으킨다는 사실을 깨닫고 담배 이외의 스트레스 해소법을 마련해야 한다. 
						가장 효과적인 방법으로는 규칙적인 운동을 꼽을 수 있다. 
						또한 일상에서 즐길수 있는 자신만의 취미를 갖는 것도 좋다. 
						갑작스러운 스트레스에는 심호흡을 하거나, 명상, 음악감상 등을 통해 긴장을 이완시키고, 
						악력기, 지압봉, 작은 공 등을 휴대하고 다니면서 주의를 환기시키는 것도 좋은 방법이다.</p>`;
				}
				if(parseInt(result.split(' ')[4]) >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 육체, 심리적 중독형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">흡연갈망에 대한 대처방법을 찾아라!</span><br/>
						육체, 심리적 중독형 흡연자는 과도한 흡연으로 니코틴에 대한 의존도가 심한 경우에 해당한다. 
						이런 경우는 금연 시 금단증세가 심하게 나타날 수 있기 때문에 
						금연상담가의 도움을 얻어 니코틴 보조제(패치, 껌, 사탕)를 사용하는 것이 도움이 될 수 있다. 
						특히, 알코올과 카페인은 니코틴과 뇌에서 작용하는 부위와 기적이 동일하므로 
						술과 커피를 금연과 동시에 적극적으로 조절해야만 한다. 
						평소에 담배 이외에 사용 할 수 있는 무가당껌, 무가당사탕, 은단 등을 휴대하고 다닌다.</p>`;
				}
				if(parseInt(result.split(' ')[5]) >= 11){
					text += `<h5 id="resultT" class="text-danger font-weight-bold mb-3"><img alt='느낌표' src='/images/basic/warning2.png'/>흡연유형 해석결과 당신은 습관형 입니다</h5>
						<p id="resultC"><img alt='해결' src='/images/basic/solution.png'/><span class="font-weight-bold">자동적 흡연을 유발하는 환경을 바꿔라</span><br/>
						습관형 흡연자는 자신도 모르게 담배를 피우는 경우가 많다. 
						따라서 흡연일기를 작성하여 어떠한 상황에서 흡연충동이 일어나는지를 확인하고 
						그러한 장소나 상황 등을 피하도록 해야 한다. 
						또한 일상적인 생활패턴에 변화를 주거나 적당한 운동이나 취미활동을 찾아보는 것도 도움이 된다. 
						습관적으로 담배를 피웠던 상황에서 찬물이나 무가당껌, 무가당사탕, 은단, 악력기, 지압봉 등을 사용하는 것이 좋다.</p>`;
				}
				if(text.length==0){
					text = `<h5 id="resultT" class="text-primary font-weight-bold mb-3"><img alt='엄지' src='/images/basic/like.png'/>흡연유형에 속하는 부분이 없습니다.</h5>`;
				}
				if(!$('#text').find('h5').length){
					$('#text').append(text);
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