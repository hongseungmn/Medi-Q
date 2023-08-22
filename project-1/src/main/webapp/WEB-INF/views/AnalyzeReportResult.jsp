<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
body{
	background-color: #fdfbf6;
}
  	.effect-custom-font {
     font-family : Noto Sans KR, sans-serif;
   }

progress {
    background-color: #FFFFFF;
    width: 300px;
    height: 30px; /* 원하는 프로그레스 바 높이로 조정하세요 */
	border-top: 1px solid black;
	border-bottom: 1px solid black;
    position: relative;
}

progress::-webkit-progress-bar {
    background-color: #e0eaf0;
}
[name=myProgress1]::-webkit-progress-bar {
    background-color: #e0eaf0;
    border-radius: 0px 20px 20px 0px;
}
#myProgress2::-webkit-progress-bar {
    background-color: #e0eaf0;
    border-radius: 0px 20px 20px 0px;
}
#myProgress::-webkit-progress-value {
	background-color: #007BFF;
	border-left: 1px solid black;
	border-radius: 20px 0px 0px 20px;
}
#myProgress1::-webkit-progress-value {
	background-color: #52BE80;
}
#myProgress2::-webkit-progress-value {
	background-color: #FF5733;
	border-radius: 0px 20px 20px 0px;
}
 /*ts 스타일 공간*/
    .my-title {
    	position:relative;
    	background-image: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
    	background-repeat: no-repeat;
    	background-size: cover;
    	margin-top: 70px;
    }
    .tsanalyze {
    	display: flex;
    	flex-direction:column;
    	justify-content:center;
    	border-radius: 40px 40px 0px 0px;
		box-shadow: rgba(108, 108, 108, 0.15) 0px -1px 10px;
		margin-top: 40px;
    }
    .5dame {
    	text-decoration: none;
    }
    .5dame:hover {
    	color: white;
    }
    .tsthsc::-webkit-scrollbar {
	  width: 8px;
	}
	
	.tsthsc::-webkit-scrollbar-thumb {
	  background-color: #bbb;
	  border-radius: 5px;
	}
	
	.tsthsc::-webkit-scrollbar-thumb:hover {
	  background-color: black;
	}
	.taehyun {
		width: 120px;
		border: 1px solid #e6e6e6;
		border-radius: 10px;
		text-align:center; 
		overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    word-break: break-all;
	}
	.taehyun1{
		overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    word-break: break-all;
	}
</style>
<body>
	<div class="container my-3" style="min-height: 880px; max-width: 920px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-left" style="flex-direction:column; align-items:center; width:100%; height:200px;">
			<c:set var="today" value="<%=new java.util.Date()%>" />
			<c:set var="nowDate" value="${today}"/>
			<fmt:formatDate var="formattedDate" value="${nowDate}" pattern="yyyy.MM.dd" />
			<!--<div class="float-right mt-3" style="font-size:32px; margin-right: 250px;"><span style="font-size:36px; color:#ffdcdc;">${memberDto.name} </span>님의 분석 결과</div> -->
			<div class="float-right " style="color:#9c9c9c; font-size:16px; margin:50px 350px 0px 0px;">${formattedDate} 기준</div>
			<div class="effect-custom-font mb-2" style="margin-right: 350px; font-size: 24px;" >총 점수는 <span style="font-size:50px;">${resultListDto.resultScore} </span> 점</div>
			<button class="btn effect-custom-font my-2" onClick="location.href='<c:url value="/AnalyzeNewReport.do"/>'" style="border-radius:15px;background-color:#ff5924;color:white;width:30%; margin-right: 350px;">다시 분석하기</button>
		</div>
		
		<div class="tsanalyze">
			<div class="m-3">
				<div class="effect-custom-font m-1" style="font-size:20px;color:#545454;text-align:center;"><span style="font-size:24px; color:#272727;">${memberDto.name} </span>님의 <br/>영양제 분석 리포트</div>
				<div class="effect-custom-font my-3" style="font-size:20px;text-align:center;">
				<span style="color:#868686;font-size:15px;">성별</span>
				<c:if test="${memberDto.gender eq 'M'}" var="gender">
					남성
				</c:if>
				<c:if test="${not gender}">
					여성
				</c:if>
				<span style="color:#868686;font-size:15px; margin-left: 30px;">나이</span>
				<fmt:parseDate value="${memberDto.birth}" var="birth" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${birth}" var="birth1" pattern="yyyy"/>
				<fmt:parseNumber value="${birth.time / (1000*60*60*24*365)}" integerOnly="true" var="birthYear"></fmt:parseNumber>
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<c:set var="nowDate"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
				${nowDate - birth1}
				</div>
				
				<div class="jumbotron effect-custom-font" style="background-color:#f5f5f5; border-radius:25px; padding: 2rem 1rem;">
					<div class="row">
						<div class="" style="text-align: center;">
							<c:if test="${resultListDto.resultScore < 30}">
								<span style="font-size:28px;text-weight:bold;">이대로는 안돼요! 분발해봐요! 💥</span>
							</c:if>
							<c:if test="${resultListDto.resultScore >=30 and resultListDto.resultScore < 60}">
								<span style="font-size:28px;text-weight:bold;">MEDI-Q 와 조금 더 노력해봐요! 🔥</span>
							</c:if>
							<c:if test="${resultListDto.resultScore >=60 and resultListDto.resultScore <= 100}">
								<span style="font-size:28px;text-weight:bold;">와우! 정말 잘하고 있어요 🎉</span>
							</c:if>
							<div class="d-flex mt-3" style="flex-direction: row; width: 800px; justify-content: space-around;">
								<div class="" style="margin-top:20px; font-size:15px;">
									<ul style="line-height: 40px; text-align: left; ">
										<li style="color:#6e6e6e;">
											${memberDto.name}님은 <span style="font-size:17px;color:#000000;">${fn:length(resultListDto.listdto)}개의 목적</span>
											을 위해 영양제를 섭취 중이시네요!
										</li>
										<li style="color:#6e6e6e;">
											현재 <span style="font-size:17px;color:#000000;">
											${resultListDto.ingredientCount}개의 영양제</span>
											를 통해 섭취하고 있는 영양소는
										</li>
										<li style="color:#6e6e6e;">
											<span style="font-size:17px;color:#000000;">기능성 원료 ${resultListDto.ingredientCount} 개, </span> 
											<span style="font-size:17px;color:#000000;">5대 영양소 총 ${fn:length(resultListDto.nutrient_list_report)} 개</span>
											이고
										</li>
										<li style="color:#6e6e6e;">
											합산한 점수는 총 <span style="font-size:23px;color:#000000;">${resultListDto.resultScore}</span> 점 입니다
										</li>
									</ul>
								</div>							
								<div class="ml-5" style="width:270px;height:270px;">
								    <canvas id="chart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mt-4 mb-2 effect-custom-font">
					<div class="effect-custom-font ml-3 my-5" style="font-size:30px; color:#272727; text-align:center; ">섭취 목적별 기능성 원료 분석</div>
				</div>
				<c:forEach items="${resultListDto.listdto}" var="dto" varStatus="loop">
				<div class="jumbotron" style="padding:30px 20px; margin:15px 0px; border-radius:25px; background-color:#f5f5f5;">
					<div class="row">
						<div class="col-3">
							<div class="effect-custom-font" style="margin-top:100px; font-size:30px;">
								<div><img src="<c:url value="/images/health_img/${dto.takePurpose}"/>.png" style="margin-left:40px; width:100px;height:100px;"/></div>
								<div style="margin: 20px 0px; text-align: center;"> ${dto.takePurpose}</div>
							</div>
						</div>

						<div class="col-9">
							<div class="effect-custom-font mb-3" style="font-size:15px;color:#6e6e6e;">
									'${dto.takePurpose}' 에 도움이 되는 기능성 원료 <span style="font-size:20px;color:#000000">${fn:length(dto.foodList)} 가지 중 ${fn:length(dto.foodList) - fn:length(dto.ingredient_list_no_report)} 개</span> 를 섭취하고 있습니다
							</div>
							<c:if test="${fn:length(dto.foodForHelpPurpose) eq 0}" var="noHelp">
								<div class="effect-custom-font"><span style="font-size:17px;color:red;">현재 아무런 기능성 원료도 섭취하지 않아요!<br/></span>  <span style="color:red;font-size:15px;">아래의 추천 기능성 원료를 참고해 주세요</span></div>
								<img src="https://img.freepik.com/free-icon/no-drugs_318-533694.jpg?size=626&ext=jpg&ga=GA1.1.236242110.1689157823&semt=ais" style="width:150px;height:150px;margin:20px 0px 0px 100px; border-radius: 30%; "/>
							</c:if>
							<c:if test="${not noHelp}">
							<div class="effect-custom-font" style="font-size:20px;">복용 중이신 영양제 중 <span style="color:#EF605D; font-weight: bold;">'${dto.takePurpose}'</span> 에 도움이 되는 기능성 원료입니다</div>
								<ul class="list-unstyled mt-5">
								<c:forEach items="${dto.foodForHelpPurpose}" var="helpfood">
									<li class="effect-custom-font" style="font-size:20px;">- ${helpfood.key}</li>
										<ul class="list-unstyled" style="line-height:30px;">
										<c:forEach items="${helpfood.value}" var="nutrient">
											<li class="effect-custom-font" style="font-weight:bold; font-size:15px; color:#22b27f;"><a class="5dame" style="font-weight: bold;color:#22b27f; text-decoration: none;" href="/NutrientDetail.do?name=${nutrient}">✅ ${nutrient}</a></li>
										</c:forEach>
										</ul>
								</c:forEach>
								</ul>
							</c:if>
							<div class="effect-custom-font mt-5" style="font-size:20px;">'${dto.takePurpose}'에 좋은 추천 기능성 원료</div>
							<c:forEach items="${dto.ingredient_list_no_report}" var="ingredient" varStatus="index">
								
								<span class="effect-custom-font p-2 my-4 mx-2" style="line-height:50px; border-radius:15px;font-size:15px; color:#22b27f; background-color: #d7f2e9;"><a class="5dame" style="font-weight: bold;color:#22b27f; text-decoration: none;" href="/NutrientDetail.do?name=${ingredient}">${ingredient}</a></span>
								<c:if test="${index.count % 4 == 0}">
									<br>
								</c:if>
							</c:forEach>
						</div>
						
						<hr class="mt-5 mb-3" style="width: 90%; border: 0;  border-bottom: 2px solid gray; ">
						
						<span style="margin:30px 0px 10px 0px; width:100%; text-align:center; font-size:24px; font-weight: bold;">💊 섭취 중인 영양제 중 <strong style="color:#EF605D;">'${dto.takePurpose}'</strong>에 도움이 되는 영양제입니다</span>
						<div class="d-flex mt-3" style="margin-left:80px; flex-direction: row;">
							
							<c:forEach items="${takelistfood}" var="dtos">
								<c:if test="${dtos.key eq dto.takePurpose}" >
									<c:forEach items="${dtos.value }" var="value">
									<a style="text-decoration: none;" id="${value.no}" href="/detail.do?no=${value.no}" title="${value.productName} 자세히 보기">
										<div class="taehyun d-flex mx-2" style="flex-direction: column; font-size:14px; font-weight: 400;">
											<img style="margin:10px 10px; width:100px;height: 100px;" src="${value.imgURL }">
											<span class="taehyun1" style=" color:black;">${value.productName }</span>
										</div>
									</a>
									</c:forEach>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				</c:forEach>
				<div class="effect-custom-font ml-3 my-5" style="font-size:30px;color:#272727;text-align:center;">5대 영양소</div>
				<div class="effect-custom-font">
					<div class="row jumbotron m-1"  style="border-radius:25px; background-color:#f5f5f5;">
						<div class="col-6" style="border-radius:15px;">
							<span class=" px-3" style="font-size: 18px"><span style="color:#B0E2FF;">현재 섭취하고 있는</span> 5대 영양소입니다</span>
							<div class="mt-3 px-3 tsthsc" style="overflow: auto;height:300px; border-radius:5px; border:2px solid gray;">
								<ul class="list-unstyled mt-3">
									<c:forEach items="${resultListDto.nutrient_list_report}" var="nutrient">
									<li style="font-size:15px;"><a class="5dame" style="font-weight: bold; color:#343a40; text-decoration: none;" href="/NutrientDetail.do?name=${nutrient}">✅ ${nutrient}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="col-6" style="border-radius:15px;">
							<span class=" px-3" style="font-size: 18px"><span style="color:#FFB0B0">현재 섭취하고 있지 않는</span> 5대 영양소입니다</span>
							<div class="mt-3 px-3 tsthsc" style="overflow: auto;height:300px; border-radius:5px; border:2px solid gray;">
								<ul class="list-unstyled mt-3">
								<c:forEach items="${resultListDto.nutrient_list_no_report}" var="no_nutrient">
									<li style="font-size:15px;"><a class="5dame" style="font-weight: bold; color:#343a40; text-decoration: none;" href="/NutrientDetail.do?name=${no_nutrient}">❌ ${no_nutrient}</a></li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<c:if test="${not empty resultListDto.nutrient_list_report}">
							<div class="mb-3 mt-4" style="margin-top:40px; border-top: 2px dashed gray;">
								<span class="text-center mt-3" style="display:block; font-size:16px; color:#3A3A3A;"> <span style="font-size:20px; text-weight:bold;">권장 섭취량</span> : 건강한 생활을 위해 섭취하도록 정하여 장려하는 양. </span>
								<span class="text-center" style="display:block; font-size:16px; color:#3A3A3A;"> <span style="font-size:20px; text-weight:bold;">상한 섭취량</span> : 인체 건강에 유해한 영향이 나타나지 않는 최대 영양소 섭취 수준. </span>
								<div class="row tsthsc" style="background-color:#f9f8f8; margin-top: 20px; border: 1px solid #CCCCCC; border-radius: 15px; height: 640px; overflow-y: auto;">
									<div class="effect-custom-font mx-1 my-3" style="font-size:15px;">
										<c:forEach items="${resultListDto.getNutIntakeDTOs()}" var="item" varStatus="i">
											<c:if test="${item.UL != 0 }">
											    <div style="box-shadow:1px 1px 2px gray; padding-left:10px; position: relative; background-color:#F5F5F0;  border-radius: 10px; overflow: hidden; width:800px;">
											    	<div style="text-align:center; margin-bottom: 10px">${item.nut}의 적정 섭취량</div>
											        <div style="text-align:center; font-size: 13px; margin-bottom: 12px; width: 100%" class="mt-2">
					                                		<span style="margin-right:9%;">권장 섭취량: ${item.DRIUnit}</span>                       	
					                                		<span style="margin-left:9%;">상한 섭취량: ${item.ULUnit}</span><br>                    	
						                                <div style="height:10px; margin:5px 0px;">
						                                	<span class="arrow-down" style="margin-right: 245px; margin-bottom: 20px;">▼</span>
						                                	<span class="arrow-down" style="margin-right: 10px; margin-bottom: 20px;">▼</span>
						                                </div>
						                            </div>
											        <div class="progress-container" style="white-space: nowrap;">
											            <progress id="myProgress" style="border-radius: 20px 0px 0px 20px;border-right:2px dotted black;width:33%" value="${item.nutNumber}" max="${item.DRI}"></progress><progress id="myProgress1" style="border-right:2px dotted black;width:33%" <c:if test="${item.nutNumber < item.DRI }">value="${item.nutNumber-item.DRI}"</c:if><c:if test="${item.nutNumber > item.DRI }">value="${item.nutNumber}"</c:if> max="${item.UL}"></progress><progress id="myProgress2" style="border-radius: 0px 20px 20px 0px;border-right: 1px solid black;width:33%" value="${item.nutNumber-item.UL}" max="${item.UL*3}"></progress>
											        </div>
											        <div class="my-3" style="text-align: center;margin-top:3px;"><span <c:if test="${item.nutNumber <item.DRI}">style='color:#007BFF;'</c:if><c:if test="${(item.nutNumber >= item.DRI) && (item.nutNumber <= item.UL)}">style='color:#52BE80;'</c:if><c:if test="${item.nutNumber >item.UL}">style='color:#FF5733;'</c:if>>
											        <c:if test="${item.nutNumber <item.DRI}"><span class="mx-1 px-2" style="background-color:#007BFF; color:blue;border-radius: 10px">부족</span></c:if><c:if test="${(item.nutNumber >= item.DRI) && (item.nutNumber <= item.UL)}"><span class="mx-1 px-2" style="background-color:#52BE80;color: green; border-radius: 10px">적정</span></c:if><c:if test="${item.nutNumber > item.UL }"><span class="mx-1 px-2" style="background-color:#FF5733;color: red;border-radius: 10px">과다</span></c:if> ${item.nutNumber}</span> 만큼 섭취하고 있습니다</div>
											    </div>
											    <br/>
										    </c:if>
										    
										    <c:if test="${item.UL == 0 }">
											    <div style="box-shadow:1px 1px 2px gray; padding-left:10px; position: relative; background-color:#F5F5F0;  border-radius: 10px; overflow: hidden; width:800px;">
											        <div style="text-align: center;margin-bottom: 10px">${item.nut}의 적정 섭취량</div>
											        <div style="text-align:center; font-size: 13px; margin-bottom: 12px; width: 100%" class="mt-2">
					                                		<span style="margin-right:25%;">권장 섭취량: ${item.DRIUnit}</span>                       	
					                                		<span style="margin-left:9%;"></span><br>                   	
						                                <div style="height:10px; margin:5px 0px;">
						                                	<span class="arrow-down" style="margin-right: 259px; margin-bottom: 20px;">▼</span>
						                                	<span class="arrow-down" style="margin-right: 10px; margin-bottom: 20px;"></span>
						                                </div>
						                            </div>
											        <div class="progress-container" style="white-space: nowrap;">
											            <progress id="myProgress" style="border-radius: 20px 0px 0px 20px;border-right:2px dotted black;width:33%" value="${item.nutNumber}" max="${item.DRI}"></progress><progress id="myProgress1" name="myProgress1" style="width:66%; border-right:1px solid black;border-radius: 0px 20px 20px 0px;" value="${item.nutNumber-item.DRI}" max="${item.DRI * 10}"></progress>
											        </div>
											        <div style="text-align: center;margin-top:3px;"><span <c:if test="${item.nutNumber <item.DRI}">style='color:#007BFF;'</c:if><c:if test="${item.nutNumber >=item.DRI}">style='color:#52BE80;'</c:if>>
											        <c:if test="${item.nutNumber <item.DRI}"><span class="mx-1 px-2" style="background-color: #007BFF;color:blue;border-radius: 10px">부족</span></c:if><c:if test="${item.nutNumber >= item.DRI}"><span class="mx-1 px-2" style="background-color:#52BE80;color: green; border-radius: 10px">적정</span></c:if> <fmt:formatNumber value="${item.nutNumber}" pattern="0.00" /></span> </div>
											    </div>
											    <br/>
										    </c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			<span class="text-center" style="display:block; color:gray;font-size:18px;text-weight:600; margin: 20px 30px 0px;">· MEDI-Q에서 제공하는 분석 리포트는 의사의 처방을 대신하지 않습니다. </span><br/>
			<span class="text-center" style="display:block; color:gray;font-size:18px;text-weight:600; margin: 5px 30px 20px;">· 본 분석 리포트는 MEDI-Q의 데이터 분석을 기반으로 구성하였습니다. </span>



			<!-- 
			<div class="mt-5 effect-custom-font">
				<div class="effect-custom-font ml-3 my-2" style="font-size:30px;color:#272727;text-align:left;">5대 영양소 분석</div>
			</div>
			<div class="jumbotron" style="border-radius:25px; position: relative; background-color:#f5f5f5;">
				<span style="font-size:25px;text-weight:bold;"> 권장 섭취량 : 건강한 생활을 위해 섭취하도록 정하여 장려하는 양. </span><br/>
				<span style="font-size:25px;text-weight:bold; margin-bottom: 10px;"> 상한 섭취량 : 인체 건강에 유해한 영향이 나타나지 않는 최대 영양소 섭취 수준. </span><br/><br/>
				<div class="row">
					<div class="effect-custom-font" style="font-size:15px;">
						<c:forEach items="${resultListDto.getNutIntakeDTOs()}" var="item" varStatus="i">
							<c:if test="${item.UL != 0 }">
							    <div style="box-shadow:2px 2px 5px gray; padding: 10px; border-radius: 10px; width:825px;">
							        <div style="text-align: center;margin-bottom: 10px">${item.nut}의 적정 섭취량</div>
							        <div style="text-align: center;margin-bottom: 10px">${item.DRIUnit} ~ ${item.ULUnit}</div>
							        <div class="progress-container" style="white-space: nowrap;">
							            <progress id="myProgress" style="border-right:2px dotted black;width:33%" value="${item.nutNumber}" max="${item.DRI}"></progress><progress id="myProgress1" style="border-right:2px dotted black;width:33%" <c:if test="${item.nutNumber < item.DRI }">value="${item.nutNumber-item.DRI}"</c:if> <c:if test="${item.nutNumber > item.DRI }">value="${item.nutNumber}"</c:if> max="${item.UL}"></progress><progress id="myProgress2" style="border-right: 1px solid black;width:33%" value="${item.nutNumber-item.UL}" max="${item.UL*3}"></progress>
							        </div>
							        <div style="text-align: center;"><span <c:if test="${item.nutNumber <item.DRI}">style='color:#FF5733;'</c:if><c:if test="${(item.nutNumber >= item.DRI) && (item.nutNumber <= item.UL)}">style='color:#007BFF;'</c:if><c:if test="${item.nutNumber >item.UL}">style='color:#52BE80;'</c:if>>${item.nutNumber}</span> 만큼 섭취하고 있습니다</div>
							    </div>
							    <br/>
						    </c:if>
						    <c:if test="${item.UL == 0 }">
							    <div style="box-shadow:2px 2px 5px gray;padding: 10px; border-radius: 10px;">
							        <div style="text-align: center;margin-bottom: 10px">${item.nut}의 적정 섭취량</div>
							        <div style="text-align: center;margin-bottom: 10px">${item.DRIUnit}</div>
							        <div class="progress-container" style="white-space: nowrap;">
							            <progress id="myProgress" style="border-right:2px dotted black;width:33%" value="${item.nutNumber}" max="${item.DRI}"></progress><progress id="myProgress1" style="width:66%; border-right:1px solid black" value="${item.nutNumber}" max="${item.DRI * 10}"></progress>
							        </div>
							        <div style="text-align: center;"><span <c:if test="${item.nutNumber <item.DRI}">style='color:tomato;'</c:if><c:if test="${item.nutNumber >=item.DRI}">style='color:skyblue;'</c:if>>${item.nutNumber}</span> </div>
							    </div>
							    <br/>
						    </c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			 -->
			</div>
		</div>
	</div>
	<script>
	console.log('${resultListDto.nutrient_list_report}');
	var listVitamin = '${resultListDto.nutrient_list_report}';
	var reg_ex = /[\[\]\\\/ ]/gim;
	listVitamin = listVitamin.replace(reg_ex,'').split(',');
	var graph_data = [1,1,1,1,1,1,1,1,1,1];
	var check_list = ['비타민A','비타민B','비타민C','비타민D','비타민E','칼슘','마그네슘','아연','망간','단백질']
	check_list.forEach(function(checkitem,index){
	    listVitamin.forEach(function(listitem){
	        if(listitem.includes(checkitem)) {
	           graph_data[index] = 6;
	        }
	    })
	})
	const data = {
			  labels: [
			    '비타민 A',
			    '비타민 B',
			    '비타민 C',
			    '비타민 D',
			    '비타민 E',
			    '칼슘',
			    '마그네슘',
			    '아연',
			    '망간',
			    '단백질'
			  ],
			  datasets: [{
			    label: '영양소',
			    data: graph_data,
			    fill: true,
			    backgroundColor: 'rgba(255, 99, 132, 0.2)',
			    borderColor: 'rgb(255, 99, 132)',
			    pointBackgroundColor: 'rgb(255, 99, 132)',
			    pointBorderColor: '#fff',
			    pointHoverBackgroundColor: '#fff',
			    pointHoverBorderColor: 'rgb(255, 99, 132)'
			  },
			  {
			    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			    fill: false,
			  },
			  {
			    data: [6, 6, 6, 6, 6, 6, 6, 6, 6, 6],
			    fill: false,
			  }]
			};


			const ctx = document.getElementById('chart').getContext('2d');
			new Chart(ctx, {
			  type: 'radar',
			  data: data,
			  options: {
			    elements: {
			      line: {
			        borderWidth: 2
			      }
			    },
			    scales : {
			      r: {
			            angleLines: {
			                display: true
			            }
			      }
			    },
			    legend: {
			        display: false  // 레이블 숨김
		      	}
			  },
			});
			
			
	</script>
	</body>
</html>