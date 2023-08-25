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
        margin-right: 0px;
    }

    .horizontal-radio .form-check {
        margin-right: 65px;
    }
	.tss {
        display: flex;
        flex-direction: row;
        font-size: 16px;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        height:48px;
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
		width: 200px;
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
    margin-top: 11px;
    margin-bottom: 11px;
    text-align: justify;
    font-size: 15px;
}
.col {
	padding-right: 0px; 
}
.col-6 {
	padding-right: 0px;
}

</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1100px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px; font-weight: bold; line-height: 50px;">인공지능을 통한<br/> <span style="color:#EF605D;">MEDI-Q</span> 질병예측 시스템</div>
		</div>
		<div class="container effect-custom-font" >
		    <div class="mx-5 my-4 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7);">폐암 발병확률 예측하기</div>
			<div class="model-score mx-2 pt-5" style="width:80%;height:80px;background-color:">※ 현재 머신러닝의 예측능력(F1-Score)은 약 <kbd>91%</kbd> 입니다</div>
		    <div class="row pt-5">
		        <div class="col-6">
		            <form id="personInfoForm" class="validation-form" method="post" novalidate>
		                <div class="tss col">
		                    <strong>연령</strong>
		                    <div class="tss1 d-flex" style="align-items: center; padding-right: 36px;">
		                    	<input type="text" class="form-control ml-3 w-75" style="margin:0px; border:none; text-align: right;" id="age" name="AGE" pattern="[0-9]+" placeholder="나이을 입력해주세요" value="${age }" required><b style="font-size: 16px;">세</b>
		                    </div>
		                    <div class="invalid-feedback">
		                        연령을 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col">
		                    <strong>성별</strong>
		                    <div class="horizontal-radio">
			                    <div class="form-check" style="margin-right: 51px;">
								    <input class="form-check-input" type="radio" name="GENDER" id="gender_Man" value="1" <c:if test="${gender eq 'M' }"> checked="checked"</c:if> required>
								    <label class="form-check-label" for="gender_Man">남성</label>
								</div>
								<div class="form-check" style="padding-right: 14px;">
								    <input class="form-check-input" type="radio" name="GENDER" id="gender_Woman" value="0" <c:if test="${gender eq 'F' }"> checked="checked"</c:if>>
								    <label class="form-check-label" for="gender_Woman">여성</label>
								</div>
							</div>
		                    <div class="invalid-feedback">
		                        성별을 체크해 주세요
		                    </div>
		                </div>
		                <div class="tss col">
		                    <strong>흡연 여부</strong>
					        <div class="horizontal-radio">
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="SMOKING" id="smokingYes" value="1" required>
					                <label class="form-check-label" for="smokingYes">예</label>
					            </div>
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="SMOKING" id="smokingNo" value="0">
					                <label class="form-check-label" for="smokingNo">아니오</label>
					            </div>
					        </div>
					        <div class="invalid-feedback">
		                        흡연 여부를 체크해 주세요
		                    </div>
		                </div>
						<div class="tss col">
						    <strong>음주 여부</strong>
						    <div class="horizontal-radio">
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="ALCOHOL CONSUMING" id="alcoholYes" value="1" required>
						            <label class="form-check-label" for="alcoholYes">예</label>
						        </div>
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="ALCOHOL CONSUMING" id="alcoholNo" value="0">
						            <label class="form-check-label" for="alcoholNo">아니오</label>
						        </div>
						    </div>
					        <div class="invalid-feedback">
		                        음주 여부을 체크해 주세요
		                    </div>
						</div>
						<div class="tss col">
					        <strong>만성 질환 유무</strong>
					        <div class="horizontal-radio">
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="CHRONIC DISEASE" id="chronicDiseaseYes" value="1" required>
					                <label class="form-check-label" for="chronicDiseaseYes">예</label>
					            </div>
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="CHRONIC DISEASE" id="chronicDiseaseNo" value="0">
					                <label class="form-check-label" for="chronicDiseaseNo">아니오</label>
					            </div>
					        </div>
					        <div class="invalid-feedback">
		                        만성 질환 여부을 체크해 주세요
		                    </div>
					    </div>
					    <div class="tss col">
					        <strong>호흡기 알러지 여부</strong>
					        <div class="horizontal-radio">
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="ALLERGY " id="allergyYes" value="1" required>
					                <label class="form-check-label" for="allergyYes">예</label>
					            </div>
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="ALLERGY " id="allergyNo" value="0">
					                <label class="form-check-label" for="allergyNo">아니오</label>
					            </div>
					        </div>
					        <div class="invalid-feedback">
		                        알러지 여부을 체크해 주세요
		                    </div>
					    </div>
						<div class="tss col">
						    <strong>쌕쌕거림(천명)</strong>
						    <div class="horizontal-radio">
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="WHEEZING" id="wheezingYes" value="1" required>
						            <label class="form-check-label" for="wheezingYes">예</label>
						        </div>
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="WHEEZING" id="wheezingNo" value="0">
						            <label class="form-check-label" for="wheezingNo">아니오</label>
						        </div>
						    </div>
					        <div class="invalid-feedback">
		                        천명 여부을 체크해 주세요
		                    </div>
						</div>
						<div class="tss col">
						    <strong>잦은 기침</strong>
						    <div class="horizontal-radio">
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="COUGHING" id="coughingYes" value="1" required>
						            <label class="form-check-label" for="coughingYes">예</label>
						        </div>
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="COUGHING" id="coughingNo" value="0">
						            <label class="form-check-label" for="coughingNo">아니오</label>
						        </div>
						    </div>
					        <div class="invalid-feedback">
		                        잦은 기침 여부을 체크해 주세요
		                    </div>
						</div>
						<div class="tss col">
						    <strong>호흡 중 숨가쁨</strong>
						    <div class="horizontal-radio">
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="SHORTNESS OF BREATH" id="breathDifficultyYes" value="1" required>
						            <label class="form-check-label" for="breathDifficultyYes">예</label>
						        </div>
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="SHORTNESS OF BREATH" id="breathDifficultyNo" value="0">
						            <label class="form-check-label" for="breathDifficultyNo">아니오</label>
						        </div>
						    </div>
					        <div class="invalid-feedback">
		                        숨가쁨 여부을 체크해 주세요
		                    </div>
						</div>
						<div class="tss col">
						    <strong>삼키기 어려움(연하곤란)</strong>
						    <div class="horizontal-radio">
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="SWALLOWING DIFFICULTY" id="swallowingYes" value="1" required>
						            <label class="form-check-label" for="swallowingYes">예</label>
						        </div>
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="SWALLOWING DIFFICULTY" id="swallowingNo" value="0">
						            <label class="form-check-label" for="swallowingNo">아니오</label>
						        </div>
						    </div>
					        <div class="invalid-feedback">
		                        연하곤란 여부을 체크해 주세요
		                    </div>
						</div>
						<div class="tss col">
						    <strong>가슴 통증 여부</strong>
						    <div class="horizontal-radio">
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="CHEST PAIN" id="chestPainYes" value="1" required>
						            <label class="form-check-label" for="chestPainYes">예</label>
						        </div>
						        <div class="form-check">
						            <input class="form-check-input" type="radio" name="CHEST PAIN" id="chestPainNo" value="0">
						            <label class="form-check-label" for="chestPainNo">아니오</label>
						        </div>
						    </div>
					        <div class="invalid-feedback">
		                        가슴 통증 여부을 체크해 주세요
		                    </div>
						</div>
						<div class="tss col">
					        <strong>불안감</strong>
					        <div class="horizontal-radio">
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="ANXIETY" id="anxietyYes" value="1" required>
					                <label class="form-check-label" for="anxietyYes">예</label>
					            </div>
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="ANXIETY" id="anxietyNo" value="0">
					                <label class="form-check-label" for="anxietyNo">아니오</label>
					            </div>
					        </div>
					        <div class="invalid-feedback">
		                        불안감 여부을 체크해 주세요
		                    </div>
					    </div>
					    <div class="tss col">
					        <strong>피로감</strong>
					        <div class="horizontal-radio">
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="FATIGUE " id="fatigueYes" value="1" required>
					                <label class="form-check-label" for="fatigueYes">예</label>
					            </div>
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="FATIGUE " id="fatigueNo" value="0">
					                <label class="form-check-label" for="fatigueNo">아니오</label>
					            </div>
					        </div>
					        <div class="invalid-feedback">
		                        피로감 여부을 체크해 주세요
		                    </div>
					    </div>
						<div class="tss col">
					        <strong>사회적 스트레스</strong>
					        <div class="horizontal-radio">
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="PEER_PRESSURE" id="peerPressureYes" value="1" required>
					                <label class="form-check-label" for="peerPressureYes">예</label>
					            </div>
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="PEER_PRESSURE" id="peerPressureNo" value="0">
					                <label class="form-check-label" for="peerPressureNo">아니오</label>
					            </div>
					        </div>
					        <div class="invalid-feedback">
		                        사회적 스트레스 여부을 체크해 주세요
		                    </div>
					    </div>
						<div class="tss col">
						    <strong>손끝이 노랗게 변함</strong>
					        <div class="horizontal-radio">
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="YELLOW_FINGERS" id="yellowFingersYes" value="1" required>
					                <label class="form-check-label" for="yellowFingersYes">예</label>
					            </div>
					            <div class="form-check">
					                <input class="form-check-input" type="radio" name="YELLOW_FINGERS" id="yellowFingersNo" value="0">
					                <label class="form-check-label" for="yellowFingersNo">아니오</label>
					            </div>
					        </div>
					        <div class="invalid-feedback">
		                        손끝이 노랗게 변함 여부를 체크해주세요
		                    </div>
						</div>
		                <div class="mb-4"></div>
		                <button class="btn btn-primary btn-lg btn-block" type="submit" data-bs-toggle="modal" data-bs-target="#predictionModal">예측해보기</button>
		            </form>
		        </div>
		
		        <div class="col-6" style="padding-left: 20px;">
		            <!--<canvas id="drawing_canvas"></canvas>-->
		            <img src="/images/tsimages/lungcancer.png" id="machineImage" style="width:100%;height:100%;"/>
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
	        <h5 class="modal-title" id="predictionModalLabel"><b style="font-size: 24px;">폐암 예측결과</b></h5>
	      </div>
	      <div class="modal-body">
		      <div class="row" style="flex-grow: 1; display: flex;">
		        <div  class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; text-align:center; align-items: center; justify-content: center; font-size: 40px; font-weight: bold;" id="predictionResultText">
		        	<canvas id="drawing_canvas"></canvas>
		        </div>
		        <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
					<ul class="pakinul">
						<li class="text-center mt-1" style="font-size:14px; font-weight:bold; font-size: 18px; margin-bottom: 10px; margin-top: 0px; padding-right: 20px;"><b>폐암 예측과정</b></li>
						<li style="font-size: 12px; padding-right: 20px;"><span></span><b style="color: #EF605D">MEDI-Q는 다양한 폐암 발병 사례를 학습한 머신러닝 모델을 활용</b>하여 사용자의 건강상태를 분석하고 질환을 예측합니다.</li>
						<li style="font-size: 12px; padding-right: 20px;"><span></span><b style="color: #EF605D">폐암의 주된 요인으로는 연령, 흡연 여부, 음주 여부 등</b>이 있습니다. 특히 흡연 중인 65세 이상 노인의 경우 위험성이 더욱 증가합니다.</li>
						<li style="font-size: 12px; padding-right: 20px;"><span></span><b style="color: #EF605D">다른 요인으로는 스트레스, 불안, 만성질환, 호흡기 알러지 등</b>의 상황이나 증상이 폐암 발병률을 높입니다. 특히 사회적 스트레스로 인한 심리적 부담은 위험성을 더욱 증가시킬 수 있습니다.</li>
						<li style="font-size: 12px; padding-right: 20px;"><span></span><b style="color: #EF605D">폐암의 증상에는 잦은 기침, 숨가쁨, 연하곤란, 가슴 통증, 천명 등</b>이 있습니다. 초기에는 미미한 증상일 수 있지만 점차 악화될 수 있습니다. 초기 대처를 위해 정기적인 건강검진이 중요하며, 증상이 계속되거나 악화되면 즉시 전문의와 상담해야 합니다.</li>
					</ul>	            
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
	                                "GENDER": $("input[name='GENDER']:checked").val(),
	                                "AGE": parseInt($('#age').val()),
	                                "SMOKING": $("input[name='SMOKING']:checked").val(),
	                                "YELLOW_FINGERS": $("input[name='YELLOW_FINGERS']:checked").val(),
	                                "ANXIETY": $("input[name='ANXIETY']:checked").val(),
	                                "PEER_PRESSURE": $("input[name='PEER_PRESSURE']:checked").val(),
	                                "CHRONIC DISEASE": $("input[name='CHRONIC DISEASE']:checked").val(),
	                                "FATIGUE ": $("input[name='FATIGUE ']:checked").val(),
	                                "ALLERGY ": $("input[name='ALLERGY ']:checked").val(),
	                                "WHEEZING": $("input[name='WHEEZING']:checked").val(),
	                                "ALCOHOL CONSUMING": $("input[name='ALCOHOL CONSUMING']:checked").val(),
	                                "COUGHING": $("input[name='COUGHING']:checked").val(),
	                                "SHORTNESS OF BREATH": $("input[name='SHORTNESS OF BREATH']:checked").val(),
	                                "SWALLOWING DIFFICULTY": $("input[name='SWALLOWING DIFFICULTY']:checked").val(),
	                                "CHEST PAIN": $("input[name='CHEST PAIN']:checked").val()
                            };
	                        console.log(data)
	                        $.ajax({
	                            type: 'POST',
	                            url: "http://192.168.0.16/LungCancerModel",
	                            //url: "http://192.168.0.16/lungcancer",
	                            contentType : "application/json",
	                            dataType: 'json',
	                            data: JSON.stringify(data),
	                            success: function (response) {
	                                // 소수점 둘째 자리까지 예측 확률 표시
	                                var predictionResult = (response.prediction_proba * 100).toFixed(1);
	                                var predictionResultText = document.getElementById('predictionResultText');
	                                predictionResultText.textContent = '발병확률: ' + predictionResult + ' %';

	                                var predictionModal = new bootstrap.Modal(document.getElementById('predictionModal'));
	                                predictionModal.show();
	                                $.ajax({
	                                    type: 'post',
	                                    url: "<c:url value='/savePrediction'/>",
	                                    contentType: 'application/json',
	                                    data: JSON.stringify({
	                                        p_disease: 'LungCancer',
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