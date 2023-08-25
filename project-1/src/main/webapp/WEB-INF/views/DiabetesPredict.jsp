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


ul {
    list-style: none;
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
    margin-top: 17px;
    margin-bottom: 17px;
    text-align: justify;
    font-size: 15px;
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
</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1100px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px; font-weight: bold; line-height: 50px;">인공지능을 통한<br/> <span style="color:#EF605D;">MEDI-Q</span> 질병예측 시스템</div>
		</div>
		<div class="container effect-custom-font" >
		    <div class="mx-5 my-4 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7);">당뇨병 발병확률 예측하기</div>
			<div class="model-score mx-2 pt-5" style="width:80%;height:80px;background-color:">※ 현재 머신러닝의 예측능력(F1-Score)은 약 <kbd>70%</kbd> 입니다</div>
		    <div class="row pt-4">
		        <div class="col-6"  style="max-width: 40%; margin-top: 70px;">
		            <form id="personInfoForm" class="validation-form" novalidate>
			            <div class="tss col mb-3">
		                    <strong>연령</strong>
		                    <div class="tss1 d-flex" style="  align-items: center;">
		                    	<input type="text" class="form-control  w-75" style="margin:0px; border:none; text-align: right;" id="age" name="age" pattern="[0-9]+" placeholder="나이을 입력해주세요" value="${age}" required> 세
		                    </div>
		                    <div class="invalid-feedback">
		                        연령을 입력해주세요
		                    </div>
		                </div>

		                <div class="tss col mb-3">
		                    <strong>BMI</strong>
		                     <div class="tss1 d-flex" style="  align-items: center;">
		                    	<input type="text" class="form-control  w-75"  style="margin:0px; border:none; text-align: right;" id="bmi" name="bmi" placeholder="체질량 지수를 입력해주세요" value="${healthInfoDto.bmi}" required> (kg/m²)
		                    </div>
		                    <div class="invalid-feedback">
		                        체질량 지수를 입력해주세요
		                    </div>
		                </div>
		                
		                <div class="tss col mb-3">
		                    <strong>혈당</strong>
		                    <div class="tss1 d-flex" style="  align-items: center;">
		                    	<input type="text" class="form-control  w-75"  style="margin:0px; border:none; text-align: right;" id="glucose" name="glucose" placeholder="포도당 수치를 입력해주세요" value="${healthInfoDto.bloodSugar}" required>&nbsp;mg/dL
		                    </div>
		                    <div class="invalid-feedback">
		                        혈당 수치를 입력해주세요
		                    </div>
		                </div>
		                
		                <div class="tss col mb-3">
		                    <strong>평균 혈압</strong>
		                    <div class="tss1 d-flex" style="  align-items: center;">
		                   		<input type="text" class="form-control  w-75"  style="margin:0px; border:none; text-align: right;" id="bloodpress" name="bloodpress"  placeholder="혈압수치를 입력해주세요" value="${(healthInfoDto.bloodPressure_high + healthInfoDto.bloodPressure_low) / 2}" required>&nbsp;mmHg
		                   	</div>
		                    <div class="invalid-feedback">
		                        혈압 수치를 입력해주세요
		                    </div>
		                </div>


		                <div class="mb-4"></div>
		                <button class="btn btn-primary btn-lg btn-block" type="submit" data-bs-toggle="modal" data-bs-target="#predictionModal">예측해보기</button>
		            </form>
		        </div>
		
		        <div class="col-6">
		            <!--<canvas id="drawing_canvas"></canvas>-->
		            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA0MDJfMjg5%2FMDAxNTU0MTg1NTI2MTky.ASfdGm6TepEVspVKdNDUw7Z6iPruPmIrHlQPh_08ucIg.nYwA9By7e4fq-LBqMjo9sdfZcOul-m2oKdxu1A34uPgg.JPEG.redobody%2F%25B4%25E7%25B4%25A2%25BA%25B4.jpg&type=sc960_832" id="machineImage" style="width:90%;height:80%;margin-left: 60px;"/>
		        </div>
		    </div>
		    <div class="effect-custom-font mx-5 mb-5 mt-1 pb-5 pt-2">
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
		        <h5 class="modal-title" id="predictionModalLabel"><b style="font-size: 24px;">당뇨병 예측결과</b></h5>
		      </div>
		      <div class="modal-body">
			      <div class="row" style="flex-grow: 1; display: flex;">
			        <div  class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; text-align:center; align-items: center; justify-content: center; font-size: 40px; font-weight: bold;" id="predictionResultText">
			        	<canvas id="drawing_canvas"></canvas>
			        </div>
			        <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
						<ul class="pakinul">
						    <li class="text-center" style="font-weight:bold; font-size: 20px; margin-bottom: 20px; margin-top: 0px;"><b>당뇨병 예측과정</b></li>
							<li style="font-size: 13px;"><span></span><b style="color: #EF605D">고령자는 인슐린 저항성의 증가와 물리적 활동의 감소</b>로 인해 2형 당뇨병 발병 위험이 증가합니다.</li>
							<li style="font-size: 13px;"><span></span><b style="color: #EF605D">높은 BMI는 인슐린 반응성 감소</b>를 유도합니다. 특히, 복부 지방은 인슐린 저항성의 주된 원인으로 여겨집니다.</li>
							<li style="font-size: 13px;"><span></span><b style="color: #EF605D">높게 지속되는 혈당 수치는 당뇨병의 초기 신호</b>일 수 있으며, 이는 인슐린 기능의 장애를 나타냅니다. 동시에 심혈관 질환의 위험도 증가시킵니다.</li>
							<li style="font-size: 13px;"><span></span><b style="color: #EF605D">고혈압은 혈관의 손상을 초래</b>하여, 당뇨병 환자에게는 합병증 발생 위험성을 크게 높입니다. 따라서 혈압 관리는 필수적입니다.</li>
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
	                    var age = $('#age').val();
	                    var bmi = $('#bmi').val();
	                    var glucose = $('#glucose').val();
	                    var bloodpress = $('#bloodpress').val();
	                    var predictionResult = 0;
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
		                            "bmi": bmi,
		                            "glucose": glucose,
		                            "bloodpress": bloodpress
		                        }
                        $.ajax({
                            type: 'POST',
                            url: 'http://192.168.0.16/diabetes',
                            contentType : "application/json",
                            dataType: 'json',
                            data: JSON.stringify(data),
                            success: function (response) {
                            	predictionResult =  (response[0][1]*100).toFixed(1);
                            	var predictionResultText = document.getElementById('predictionResultText');
                                predictionResultText.textContent ='발병확률: '+ predictionResult+' %';                     
                            	var predictionModal = new bootstrap.Modal(document.getElementById('predictionModal'));
                            	predictionModal.show();
                            	$.ajax({
                                    type: 'post',
                                    url: "<c:url value='/savePrediction'/>",
                                    contentType: 'application/json',
                                    data: JSON.stringify({
                                        p_disease: 'Diabetes',
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
	    //console.log('%o',response);
        //console.log(response[0])
        //initDrawingCanvas((response[0][1]*100).toFixed(1)); //리스폰스 예측값 
        //requestAnimationFrame(loop);
        //$('#machineImage').hide();
	</script>
	</body>
</html>