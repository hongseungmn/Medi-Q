<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">

<style>
	#drawing_canvas {
	        position: absolute;
	        margin: auto;
	        width: 512px;
	        height: 350px;
	        top: 0;
	        bottom: 0;
	        left: 0;
	        right: 0;
	    }
    .effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    
/*ts 스타일 공간*/
body {
	background-color: #fdfbf6;
}
.my-title {
	position: relative;
	background-image:
		url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	margin-top: 70px;
}

/* Custom CSS for horizontal radio buttons */
    .horizontal-radio {
        display: flex;
        flex-direction: row;
        margin-right: 10px;
    }

    .horizontal-radio .form-check {
        margin-right: 10px; /* Adjust the spacing between radio buttons */
    }
	.tss {
        display: flex;
        flex-direction: row;
        font-size: 16px;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        height:70px;
        padding-bottom:15px;
        border-bottom: 3px solid #F0F0F0;
    }
    .tss1 {
        display: flex;
        flex-direction: row;
        font-size: 14px;
        align-items: center;
        width: 90%;
        vertical-align: middle;
    }
   strong {
    	font-size: 16px;
    	font-weight: 500;
		vertical-align: middle;
		width: 100px;
    }

.pakinul {
    margin-left: 20px;
    padding: 0px;
    font-size: 16px;
    line-height: 28px;
    color: #595959;
    word-break: break-all;
    vertical-align: top;
    border: 0px;
    text-decoration: none;
}
.pakinul span {
	display: inline-block;
    margin-top: 13px;
    position: absolute;
    left: 0;
    top: 0;
    width: 5px;
    height: 2px;
    background-color: #111111;
    opacity: 0.3;
    margin-right: 6px;
}
.pakinul li {
	width: 100%;
    display: block;
    position: relative;
    box-sizing: border-box;
    padding-left: 10px;
    padding-right: 30px;
    margin-top: 10px;
    margin-bottom: 10px;
    text-align: justify;
    font-size: 15px;
}

</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1100px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px; font-weight: bold; line-height: 50px;">인공지능을 통한<br/> <span style="color:#EF605D;">MEDI-Q</span> 질병예측 시스템</div>
		</div>
		<div class="container effect-custom-font" >
		    <div class="mx-5 my-4 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7);">뇌졸중 발병확률 예측하기</div>
			<div class="model-score  mx-2 pt-5" style="width:80%;height:80px;background-color:">※ 현재 머신러닝의 예측능력(F1-Score)은 약 <kbd>85%</kbd> 입니다</div>
		    <div class="row pt-5">
		        <div class="col-6">
		            <form id="personInfoForm" class="validation-form" method="post" novalidate>
		                <div class="tss col mb-3">
		                    <strong>연령</strong>
		                    <div class="tss1 d-flex" style="align-items: center;margin-right: 170px;justify-content: flex-end;" >
		                    	<input type="text" class="form-control ml-3 w-25" style="margin:0px; border:none; text-align: right;" id="age" name="age" pattern="[0-9]+" placeholder="나이을 입력해주세요" value="${age }" required><b style="font-size: 16px;"> 세</b>
		                    </div>
		                    <div class="invalid-feedback">
		                        연령을 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col mb-3">
		                    <strong>성별</strong>
		                    <div class="horizontal-radio" style="margin-right: 100px;">
			                    <div class="form-check" style="margin-right: 60px;">
								    <input class="form-check-input" type="radio" name="gender" id="gender_Man" value="Male" <c:if test="${gender eq 'M' }"> checked="checked"</c:if> required>
								    <label class="form-check-label" for="gender_Man">
								    남성
								    </label>
								</div>
								<div class="form-check">
								    <input class="form-check-input" type="radio" name="gender" id="gender_Woman" value="Female" <c:if test="${gender eq 'F' }"> checked="checked"</c:if>>
								    <label class="form-check-label" for="gender_Woman">
								    여성
								    </label>
								</div>
							</div>
		                    <div class="invalid-feedback">
		                        성별을 체크해 주세요
		                    </div>
		                </div>
		                <div class="tss col mb-3">
		                    <strong>혈당 수치</strong>
		                    <div class="tss1 d-flex" style="  align-items: center;padding-right: 155px;justify-content: flex-end;">
		                    	<input type="text" class="form-control ml-3 w-25" style="margin:0px; border:none; text-align: right;" id="glucose" name="glucose" placeholder="혈당 수치를 입력해주세요" value="${healthInfoDto.bloodSugar}" required> mg/dL
		                    </div>
		                    <div class="invalid-feedback">
		                        혈당 수치를 입력해주세요
		                    </div>
		                </div>
						<div class="tss col mb-3">
						    <strong>결혼 여부</strong>
						    <div class="horizontal-radio" style="margin-right: 100px;">
							    <div class="form-check" style="margin-right: 60px;">
							        <input class="form-check-input" type="radio" name="everMarried" id="everMarriedYes" value="Yes" required>
							        <label class="form-check-label" for="everMarriedYes">예</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="everMarried" id="everMarriedNo" value="No">
							        <label class="form-check-label" for="everMarriedNo">아니오</label>
							    </div>
							</div>
							<div class="invalid-feedback">
		                        결혼 여부를 입력해주세요
		                    </div>
						</div>
						<div class="tss col mb-3">
						    <strong>직업 유형</strong>
						    <div class="horizontal-radio">
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypePrivate" value="Private" required>
							        <label class="form-check-label" for="workTypePrivate">사기업</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeSelfEmployed" value="Self-employed">
							        <label class="form-check-label" for="workTypeSelfEmployed">자영업</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeGovt" value="Govt_job">
							        <label class="form-check-label" for="workTypeGovt">공기업</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeChildren" value="children">
							        <label class="form-check-label" for="workTypeChildren">아동</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="workType" id="workTypeNeverWorked" value="Never_worked">
							        <label class="form-check-label" for="workTypeNeverWorked">무직</label>
							    </div>
						    </div>
						    <div class="invalid-feedback">
		                        직업 유형을 입력해주세요
		                    </div>
						</div>
						<div class="tss col mb-3">
						    <strong>거주 유형</strong>
						    <div class="horizontal-radio" style="margin-right: 60px;">
							    <div class="form-check" style="margin-right: 60px;">
							        <input class="form-check-input" type="radio" name="residenceType" id="residenceTypeRural" value="Urban" required>
							        <label class="form-check-label" for="residenceTypeRural">도심 지역</label>
							    </div>
							    <div class="form-check">
							        <input class="form-check-input" type="radio" name="residenceType" id="residenceTypeUrban" value="Rural">
							        <label class="form-check-label" for="residenceTypeUrban">농촌 지역</label>
							    </div>
						    </div>
						    <div class="invalid-feedback">
		                        거주 유형을 입력해주세요
		                    </div>
						</div>
		                <div class="mb-4"></div>
		                <button class="btn btn-primary btn-lg btn-block" type="submit" data-bs-toggle="modal" data-bs-target="#predictionModal">예측해보기</button>
		            </form>
		        </div>
		
		        <div class="col-6">
		            <!--<canvas id="drawing_canvas"></canvas>-->
		            <img src="/images/tsimages/stroke.png" id="machineImage" style="width:100%;height:100%;border-radius:20px;padding: 0px 25px 0px 25px;"/>
		        </div>
		    </div>
		    <div class="effect-custom-font m-5 py-5">
		    	<div class="title mb-5" style="font-size:30px;">
		    		<img src="<c:url value="/images/mainicon.png"/>" style="width:30px;height:30px;">
		    		<img src="<c:url value="/images/maintitle.png"/>" style="height:30px;">
												와 다른 질병을 예측해 보아요!</div>
		    		<div class="p-2" style="cursor: pointer;border-radius:40px;font-size:20px;background-color:#ff9558; font-weight: bold; text-align: center;" onclick='redirectToPrediction()'>다른 질병 예측하러 가기</div>
			    </div>
			</div>
		</div>
	
	
	<div class="modal fade" id="predictionModal" tabindex="-1" aria-labelledby="predictionModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" style="max-width:800px;">
	    <div class="modal-content">
	      <div class="modal-header" style="justify-content: center;">
	        <h5 class="modal-title" id="predictionModalLabel"><b style="font-size: 24px;">뇌졸중 예측결과</b></h5>
	      </div>
	      <div class="modal-body">
		      <div class="row" style="flex-grow: 1; display: flex;">
		        <div  class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; text-align:center; align-items: center; justify-content: center; font-size: 40px; font-weight: bold;" id="predictionResultText">
		        	<canvas id="drawing_canvas"></canvas>
		        </div>
		        <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
					<ul class="pakinul">
                		<li class="text-center" style="font-weight:bold; font-size: 18px; margin-bottom: 10px; margin-top: 0px;"><b>뇌졸중 예측과정</b></li>
              			<!-- <li style="font-size: 12px;"><span></span><b style="color: #EF605D">MEDI-Q는 다양한 뇌졸중 사례를 학습한 머신러닝 모델을 활용</b>하여 사용자의 건강상태를 분석하고 질환을 예측합니다.</li> -->
                        <li style="font-size: 12px;"><span></span><b style="color: #EF605D">연령</b>은 뇌졸중의 주요 위험 요인 중 하나입니다. 특히 55세 이후 발병률이 10년마다 두 배씩 증가하는 경향이 있습니다.</li>
						<li style="font-size: 12px;"><span></span><b style="color: #EF605D">성별</b>에 따라 뇌졸중의 위험도 다를 수 있습니다. 남성은 발생률이 약간 높지만 여성이 오래 살기 때문에 뇌졸중에 걸린 사례가 더 많았습니다. 또한 폐경 후의 여성에서는 뇌졸중 위험이 증가합니다.</li>
						<li style="font-size: 12px;"><span></span><b style="color: #EF605D">혈당 수치</b>는 뇌졸중의 주요 위험 요인 중 하나입니다. 높은 혈당 수치는 뇌졸중 위험을 증가시키며, 특히 126 이상의 당뇨병 환자는 뇌졸중 위험이 2~4배 높아집니다.</li>
						<li style="font-size: 12px;"><span></span><b style="color: #EF605D">결혼 여부, 직업 유형, 거주 유형</b> 등의 사회적, 경제적 요인도 뇌졸중의 위험에 영향을 미칠 수 있습니다. 직업에 따른 스트레스와 거주지역에 따른 의료시설 유무가 영향을 미칩니다.</li></ul>		            
                </div>
		     </div>
		 </div>
		  <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script>
	function redirectToPrediction() {
	    // 여기에 이동할 URL을 설정합니다.
	    var url = "<c:url value='/MachineLearn.do'/>"; // 해당 부분에 실제 URL을 입력합니다.
	    window.location.href = url;
	}
	    $(document).ready(function() {
	    	$('#personInfoForm').submit(function (event) {
	            event.preventDefault();
	            event.stopImmediatePropagation();
	            
	            var forms = document.getElementsByClassName('validation-form');
	            Array.prototype.filter.call(forms, (form) => {
	                if (form.checkValidity() === false) {
	                    Swal.fire({
	                        icon: 'error',
	                        title: 'Oops...',
	                        text: '다시한번 확인해 주세요!',
	                    });
	                } else {
	                    var age = $('#age').val();
	                    var gender = $("input[name='gender']:checked").val();
	                    var glucose = $('#glucose').val();
	                    var everMarried = $("input[name='everMarried']:checked").val();
	                    var workType = $("input[name='workType']:checked").val();
	                    var residenceType = $("input[name='residenceType']:checked").val();
	                    const Toast = Swal.mixin({
	                        toast: true,
	                        position: 'center-center',
	                        showConfirmButton: false,
	                        timer: 1500,
	                        timerProgressBar: true,
	                        didOpen: (toast) => {
	                            toast.addEventListener('mouseenter', Swal.stopTimer)
	                            toast.addEventListener('mouseleave', Swal.resumeTimer)
	                        }
	                    });
	                    Toast.fire({
	                        icon: 'success',
	                        title: '모델이 예측 중입니다'
	                    });
	                    setTimeout(function () {
	                        var data = {
	                            "age": age,
	                            "avg_glucose_level": glucose,
	                            "gender" : gender,
	                            "ever_married": everMarried,
	                            "work_type": workType,
	                            "Residence_type": residenceType
	                        }
	                        console.log(data)
	                        $.ajax({
	                            type: 'POST',
	                            //url: "http://localhost:5000/StrokeModel",
	                            url: "http://192.168.0.16/stroke",
	                            contentType : "application/json",
	                            dataType: 'json',
	                            data: JSON.stringify(data),
	                            success: function (response) {
	                            	var predictionResult =  (response.prediction[0]*100).toFixed(1);
	                            	var predictionResultText = document.getElementById('predictionResultText');
	                                predictionResultText.textContent ='발병확률: '+ predictionResult+' %';
	                     
	                            	var predictionModal = new bootstrap.Modal(document.getElementById('predictionModal'));
	                            	predictionModal.show();
	                            	$.ajax({
	                                    type: 'post',
	                                    url: "<c:url value='/savePrediction'/>",
	                                    contentType: 'application/json',
	                                    data: JSON.stringify({
	                                        p_disease: 'Stroke',
	                                        p_result: predictionResult
	                                    }),
	                                    success: function () {
	                                        console.log("데이터 저장 완료");
	                                    }
	                                });
	                            }
	                        });
	                    }, 1500);
                }
                form.classList.add('was-validated');
            });
        });
    });

	</script>
	</body>
</html>