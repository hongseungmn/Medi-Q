<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
body{
	background-color: #fdfbf6;
}

   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .delete_report:hover {
   		box-shadow: 2px 2px 5px gray;
    	border-radius: 10px;
		background-color: white;
		padding: 5px;
		
    }
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
		margin-top: 50px;
    }
    .ZyIFk1 {
    	font-weight: bold;
    	font-size: 15px;
    	color:#7b7b7b;
    }
    .ZyIFk2 {
    	font-weight: bold;
    	font-size: 16px;
    	color:#7b7b7b;
    }
    .sanse {
    	border: none; 
    	background: rgba(0,0,0,0); 
    	font-size: 16px; 
    	font-weight: bold;
    	color:gray;
    	margin-left: 5px;
    }
    .sanse:hover {
    	box-shadow: 2px 2px 5px gray;
    	border-radius: 10px;
		background-color: white;
		color:black;    	
    }

</style>

	<div class="container my-3" style="min-height: 880px; max-width: 920px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 80px;"><span style="font-size:40px; color:#FDCDBC;">${UserName} </span> 님의 <br>영양제 분석 리포트</div>
			<!-- 
			<div class="mt-3">
				<c:if test="${info.prof_Img_Fl eq 'Y' }" var="isProfImg">
					<c:set var="uploadFolder" value="${fn:split(profImg.pi_Path,'\\\\')[fn:length(fn:split(profImg.pi_Path, '\\\\'))-1] }"/>
					<img class="rounded-circle" alt="사용자 이미지" src="<c:url value="/images/${uploadFolder }/${profImg.pi_Filename }.${profImg.pi_Ext }" />" style="width: 200px; height: 200px">
				</c:if>
				<c:if test="${not isProfImg }">
					<img class="rounded-circle" alt="기본 프로필" src="<c:url value="/images/basic/friend.png" />" style="width: 200px; height: 200px">
				</c:if>
			</div>
			-->
		</div>
		
		<div class="mx-2" style="width: 80%;">
			<div class="btn btn-warning effect-custom-font" style="border-radius:15px;width:100%; margin-left: 80px; height: 50px; color:white; font-weight: bold; font-size: 20px;" onclick="location.href='/AnalyzeNewReport.do'">새로 분석하기</div>
		</div>
		
		<div class="tsanalyze">
			<!-- 
			<div class="report_recent effect-custom-font m-5" style="font-size:25px;">
				<div>최근 분석 리포트</div>
				<div class="jumbotron" style="box-shadow: 5px 5px 5px grey;border-radius:25px;">
					<div style="margin: 10px 0px 0px 20px;">
	                <div class="enbDhJ1"><span class="p-1"style="font-size:15px;color:white;background-color:#EF605D;border-radius:15px;">${analyzeReport.analyzeDate}</span><span style=" float: right;"></span></div>
	                	<p style="">${analyzeReport.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
	            	</div>
		            <div class="ZyIFk1 d-block mt-3" style="margin-left: 20px;">
		                <div><span style="color:#545454; font-weight: bold;">섭취 목적</span> :<br/> ${analyzeReport.takePurposes}</div>
		                <div><span style="color:#545454; font-weight: bold;">섭취중인 영양제</span> :<br/> ${analyzeReport.takeFoods}</div>
		            </div>	
				</div>
			</div>
			 -->
			 <div class="gCSEJp" style="margin: 10px 0px; padding: 0px; ">
		        <h1 class="mb-3 text-center" > 최근 분석 리포트</h1>
		     	<c:if test="${not empty analyzeReport}">
			        <div class="ibNwmg d-flex" style="justify-content:flex-start;  margin:30px 0px 40px 15px; width: 95%;">
			            <form data-gtm-id="report-home-recent-blank" class="ktaGqG" style="text-decoration: none; cursor:none; background-color: 
					      ${analyzeReport.score >= 0 && analyzeReport.score < 25 ? 'rgba(255, 0, 0, 0.7)' :
					        analyzeReport.score >= 25 && analyzeReport.score < 50 ? 'rgba(255, 165, 0, 0.7)' :
					        analyzeReport.score >= 50 && analyzeReport.score < 75 ? 'rgba(0, 128, 0, 0.7)' :
					        analyzeReport.score >= 75 && analyzeReport.score <= 100 ? 'rgba(0, 0, 255, 0.7)' : ''};" >
			                <article class="hBxOSS" style="display: block; cursor:auto;">
			                    <div class="iJGurJ">
			                        <div style="margin: 10px 0px 0px 20px;">
			                            <div class="enbDhJ1 mx-1">
				                            <span class="p-1 mr-2"style="font-size:15px; color:white; background-color:
					                            ${analyzeReport.score >= 0 && analyzeReport.score < 25 ? 'rgba(255, 0, 0, 0.7)' :
							        			analyzeReport.score >= 25 && analyzeReport.score < 50 ? 'rgba(255, 165, 0, 0.7)' :
							    			    analyzeReport.score >= 50 && analyzeReport.score < 75 ? 'rgba(0, 128, 0, 0.7)' :
							    			    analyzeReport.score >= 75 && analyzeReport.score <= 100 ? 'rgba(0, 0, 255, 0.7)' : ''}; font-weight:bold; border-radius:15px;">
							    			    ${analyzeReport.analyzeDate}
						    			    </span>
						    			    분석 결과
					    			    </div>
			                            <p class="jeiOCr1" style="">${analyzeReport.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
			                        </div>
			                        <div class="d-block mt-3" style="margin-left: 20px;">
									  <div class="ZyIFk1">
									    <span style="color: #272727;">섭취 목적</span> :<br/>
									    <c:set var="char31Mi" value="${fn:replace(analyzeReport.takePurposes, ']', '')}" />
										<c:set var="char32Mi" value="${fn:replace(char31Mi, '[', '')}" />
										<c:forEach items="${fn:split(char32Mi, ',')}" var="char3" varStatus="loop">
										    <c:set var="trimchar3" value="${fn:trim(char3)}" />
											<a style="color: black;text-decoration: none;" href="/functionfood/healthissue.do?healthissue=${trimchar3}">
											<c:out value="${char3}" />
										    <c:if test="${!loop.last}">
										        <!-- 마지막 항목이 아니면 쉼표 출력 -->
										      ,
										    </c:if>
										    <c:if test="${(loop.index + 1) % 6 == 0}">
										      <br/>
										    </c:if>
										    </a>
										</c:forEach>
									  </div>
									  <div class="ZyIFk2">
									    <span style="color: #272727;">섭취중인 영양제</span> :<br/>
									    <c:set var="char41Mi" value="${fn:replace(analyzeReport.takeFoods, ']', '')}" />
										<c:set var="char42Mi" value="${fn:replace(char41Mi, '[', '')}" />
										<c:forEach items="${fn:split(char42Mi, ',')}" var="char4" varStatus="loop">
											<c:set var="trimchar4" value="${fn:trim(char4)}" />
											<c:set var="replcechar4" value="${fn:replace(trimchar4,'&','%26')}"/>
											<a style="color: black;text-decoration: none;" href="/functionfood/food.do?takefood=${replcechar4}">
										    <c:out value="${char4}" />
										    <c:if test="${!loop.last}">
										      <!-- 마지막 항목이 아니면 쉼표 출력 -->
										      ,
										    </c:if>
										    <c:if test="${(loop.index + 1) % 2 == 0}">
										      <br/>
										    </c:if>
										    </a>
									    </c:forEach>
									  </div>
			                     	</div>
			                     </div>
		                	</article>
		             	</form>
		             </div>                 
		         </c:if>
		         <c:if test="${empty analyzeReport}">
                   	<div>
                        <p class="jeiOCr" style="margin-top: 40px; font-size: 22px; color:gray;">최근 분석한 리포트가 없습니다!<br/>영양제를 분석하고 리포트를 추가해보세요.</p>
     				</div>
		         </c:if>
		     </div>
		     	
			<div class="mx-2 my-4" style="border-bottom: 2px solid #e3e3e3"></div>
			
			<div class="gCSEJp" style="margin: 10px 0px; padding: 0px; ">
		        <h1 class="mb-3 text-center" > 저장된 분석 리포트</h1>
				<c:forEach items="${analzeReportAll}" var="analyzeReportOne">
			        <div class="ibNwmg d-flex" style="justify-content:flex-start; margin:30px 0px 40px 15px; width: 95%;">
			            <form class="ktaGqG" action='<c:url value="/analyzeMyReportReLoad.do"/>' method="POST" style="text-decoration: none; background-color: 
					      ${analyzeReportOne.score >= 0 && analyzeReportOne.score < 25 ? 'rgba(255, 0, 0, 0.7)' :
					        analyzeReportOne.score >= 25 && analyzeReportOne.score < 50 ? 'rgba(255, 165, 0, 0.7)' :
					        analyzeReportOne.score >= 50 && analyzeReportOne.score < 75 ? 'rgba(0, 128, 0, 0.7)' :
					        analyzeReportOne.score >= 75 && analyzeReportOne.score <= 100 ? 'rgba(0, 0, 255, 0.7)' : ''};" >
			                <article class="hBxOSS" style="display: block; cursor: auto;">
			                    <div class="iJGurJ">
			                        <div style="margin: 10px 0px 0px 20px;">
			                        	
			                            <div class="enbDhJ1 mx-1">
				                            <span class="p-1 mr-2"style=" font-size:15px; color:white; background-color:
					                            ${analyzeReportOne.score >= 0 && analyzeReportOne.score < 25 ? 'rgba(255, 0, 0, 0.7)' :
							        			analyzeReportOne.score >= 25 && analyzeReportOne.score < 50 ? 'rgba(255, 165, 0, 0.7)' :
							    			    analyzeReportOne.score >= 50 && analyzeReportOne.score < 75 ? 'rgba(0, 128, 0, 0.7)' :
							    			    analyzeReportOne.score >= 75 && analyzeReportOne.score <= 100 ? 'rgba(0, 0, 255, 0.7)' : ''}; font-weight:bold; border-radius:15px;">
						    			    	${analyzeReportOne.analyzeDate}
						    			    </span>
						    			    분석 결과
						    			    
						    			    <c:set var="takePurpose" value="${fn:replace(analyzeReportOne.takePurposes, '[', '')}" />
							                <c:set var="takePurpose" value="${fn:replace(takePurpose, ']', '')}" />
							                <input type="hidden" value="${takePurpose}" name="takePurpose"/>
							                <c:set var="takeFood" value="${fn:replace(analyzeReportOne.takeFoods, '[', '')}" />
							                <c:set var="takeFood" value="${fn:replace(takeFood, ']', '')}" />
							                <input type="hidden" value="${takeFood}" name="takeFood"/>
							                <button type="submit" class="sanse">상세보기</button>
						    			    <span style="margin-left: 300px; cursor: pointer;"class="delete_report" data-value="${analyzeReportOne.analyzeno}">🗑</span>  
			               					<input type="hidden" value="${analyzeReportOne.analyzeno}"/>
					    			    </div>
			                            <p class="jeiOCr1">${analyzeReportOne.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
			                        </div>
			                        <div class="d-block mt-3" style="margin-left: 20px;">
										  <div class="ZyIFk1 mt-1">
										    <span style="color: #272727; font-size: 18px;">섭취 목적</span> :<br/>
											<c:set var="char11Mi" value="${fn:replace(analyzeReportOne.takePurposes, ']', '')}" />
											<c:set var="char21Mi" value="${fn:replace(char11Mi, '[', '')}" />
										    <c:forEach items="${fn:split(char21Mi, ',')}" var="char1" varStatus="loop">
										    <c:set var="trimchar1" value="${fn:trim(char1)}" />
										      <a style="color: black;text-decoration: none;" href="/functionfood/healthissue.do?healthissue=${trimchar1}">
											      <c:out value="${char1}" />
											      <c:if test="${!loop.last}">
											        <!-- 마지막 항목이 아니면 쉼표 출력 -->
											        ,
											      </c:if>
											      <c:if test="${(loop.index + 1) % 6 == 0}">
											        <br/>
											      </c:if>
										      </a>
										    </c:forEach>
										  </div>
										  <div class="ZyIFk2 mt-4">
										    <span style="color: #272727; font-size: 18px;">섭취중인 영양제</span> :<br/>
										    <c:set var="char12Mi" value="${fn:replace(analyzeReportOne.takeFoods, ']', '')}" />
											<c:set var="char22Mi" value="${fn:replace(char12Mi, '[', '')}" />
										    <c:forEach items="${fn:split(char22Mi, ',')}" var="char2" varStatus="loop">
												<c:set var="trimchar2" value="${fn:trim(char2)}" />
												<c:set var="replcechar2" value="${fn:replace(trimchar2,'&','%26')}"/>
												<a style="color: black;text-decoration: none;" href="/functionfood/food.do?takefood=${replcechar2}">
											    <c:out value="${char2}" />
											    <c:if test="${!loop.last}">
											      <!-- 마지막 항목이 아니면 쉼표 출력 -->
											      ,
											    </c:if>
											    <c:if test="${(loop.index + 1) % 2 == 0}">
											      <br/>
											    </c:if>
											    </a>
										    </c:forEach>
										  </div>		         
			                        </div>
			                     </div>
		                	</article>
		             	</form>
		             </div>                 
		         </c:forEach>
		     </div>
		 </div>
	 </div>
		     <!-- 
			<div class="report_recent effect-custom-font m-2" style="font-size:25px;">
		        <h1 class="tsreporth1 mb-3 text-center" >저장된 분석 리포트</h1>
				<c:forEach items="${analzeReportAll}" var="analyzeReportOne">
				<div class="jumbotron p-3" style="box-shadow: 5px 5px 5px grey;border-radius:25px;font-size:15px;height:200px;">
	                <div class="enbDhJ1"><span class="p-1"style="font-size:15px;color:white;background-color:#EF605D;border-radius:15px;">${analyzeReportOne.analyzeDate}</span>
	                	<span style=" float: right;"class="delete_report" data-value="${analyzeReportOne.analyzeno}">🗑</span>
	               		<input type="hidden" value="${analyzeReportOne.analyzeno}"/>
	               	</div>
	               	<form action='<c:url value="/analyzeMyReportReLoad.do"/>' method="POST">
	                	<p style="">${analyzeReportOne.score}<span class="ml-3" style="color:black; font-size: 20px;">점</span></p>
			            <div class="ZyIFk1 d-block mt-3" style="margin-left: 20px;">
			                <div><span style="color:#545454; font-weight: bold;">섭취 목적</span> :<br/> ${analyzeReportOne.takePurposes}</div>
			                <div><span style="color:#545454; font-weight: bold;">섭취중인 영양제</span> :<br/> ${analyzeReportOne.takeFoods}</div>
			                <c:set var="takePurpose" value="${fn:replace(analyzeReportOne.takePurposes, '[', '')}" />
			                <c:set var="takePurpose" value="${fn:replace(takePurpose, ']', '')}" />
			                <input type="hidden" value="${takePurpose}" name="takePurpose"/>
			                <c:set var="takeFood" value="${fn:replace(analyzeReportOne.takeFoods, '[', '')}" />
			                <c:set var="takeFood" value="${fn:replace(takeFood, ']', '')}" />
			                <input type="hidden" value="${takeFood}" name="takeFood"/>
			                <button type="submit" class="btn btn-warning">확인하기</button>
			            </div>
		            </form>	
				</div>
				</c:forEach>
			</div>
		</div>
	</div> 
	-->
	
<script>
// jQuery를 사용하여 이벤트 핸들러 추가
const deleteButtons = document.querySelectorAll(".delete_report");

deleteButtons.forEach(button => {
  button.addEventListener('click', function(e) {
    var itemNo = e.target.dataset.value;
    Swal.fire({
    	  title: '저장된 리포트를 삭제하시겠습니까?',
    	  text: "저장된 리포트가 삭제되었습니다",
    	  icon: 'warning',
    	  
    	  showCancelButton: true,
    	  confirmButtonColor: '#3085d6',
    	  cancelButtonColor: '#d33',
    	  confirmButtonText: '삭제'
    	}).then((result) => {
    	  if (result.isConfirmed) {
    	    Swal.fire(
    	    		'Deleted!',
    	      '삭제되었습니다!',
    	      'success',
    	    )
    	    setTimeout(function() {$.ajax({
    			   url: "<c:url value='/deleteAnalyzeReport.do'/>?analyzeno="+itemNo,
    		   }).done(function() {
    			   location.reload();
    		   }).fail(function(error) {
    			   console.log(error);
    		   });
    	    },1500);
    	  }
    	})
    
  });
});
</script>
	</body>
</html>