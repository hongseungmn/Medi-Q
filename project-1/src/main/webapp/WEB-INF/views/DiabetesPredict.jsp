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
			<div class="model-score  mx-2 pt-5" style="width:80%;height:80px;background-color:">※현재 머신러닝의 예측 정확도는 약 <kbd>70%</kbd> 입니다</div>
		    <div class="row pt-5">
		        <div class="col-6"  style="max-width: 40%;">
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
		                        포도당 수치를 입력해주세요
		                    </div>
		                </div>
		                
		                <div class="tss col mb-3">
		                    <strong>혈압(평균)</strong>
		                    <div class="tss1 d-flex" style="  align-items: center;">
		                   		<input type="text" class="form-control  w-75"  style="margin:0px; border:none; text-align: right;" id="bloodpress" name="bloodpress"  placeholder="혈압수치를 입력해주세요" value="${(healthInfoDto.bloodPressure_high + healthInfoDto.bloodPressure_low) / 2}" required>&nbsp;mmHg
		                   	</div>
		                    <div class="invalid-feedback">
		                        혈압수치를 입력해주세요
		                    </div>
		                </div>


		                <div class="mb-4"></div>
		                <button class="btn btn-primary btn-lg btn-block" type="submit" data-bs-toggle="modal" data-bs-target="#predictionModal">예측해보기</button>
		            </form>
		        </div>
		
		        <div class="col-6">
		            <!--<canvas id="drawing_canvas"></canvas>-->
		            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA2MDNfOCAg%2FMDAxNTU5NTQ2NzIzMDAy.8xr9Ty7Yf3tA1UaG0T2zbKLOZ1LBhyQr1Id-bhGwPFsg.UM2MNHxWwuRUkI3X8FU7XRQQnxCxLPw9WS8VC-hGDRUg.PNG.care757-7997%2F%25B4%25E7%25B4%25A2%25BA%25B4%25C0%25DA%25B0%25A1%25C1%25F8%25B4%25DC.png&type=sc960_832" id="machineImage" style="width:100%;height:100%;border-radius:10px;"/>
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
		      <div class="modal-header">
		        <h5 class="modal-title" id="predictionModalLabel" style="">당뇨병 예측 결과</h5>
		      </div>
		      <div class="modal-body">
			      <div class="row" style="flex-grow: 1; display: flex;">
			        <div  class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; text-align:center; align-items: center; justify-content: center; font-size: 40px; font-weight: bold;" id="predictionResultText">
			        	<canvas id="drawing_canvas"></canvas>
			        </div>
			        <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
						<ul class="pakinul">
	                		<li class="text-center" style="font-weight:bold; font-size: 20px; margin-bottom: 20px; margin-top: 0px;"><b>당뇨병 진단과정</b></li>
	                    	<li><span></span>나이가 들며 인슐린 저항성이 증가하며 이는 2형 당뇨병의 주요원인이며  또한 <b style="color: #EF605D">나이가 들면 신체활동도 감소하게 되어 이는 당뇨병에 위험을 증가</b>시킬 수 있습니다.</li>
	                    	<li><span></span>BMI가 높으면 2형 당뇨병에 위험이 높아지며 특히 <b style="color: #EF605D">복부비반은 인슐린 정항성 증가와 관련이 있으며 저항성 지방세포 호르몬의 발생을 증가</b>시킵니다.</li>
	                    	<li><span></span>높은 혈당과 혈압은 당뇨병과 관련이 있으며 이 두질환은 곧 <b style="color: #EF605D">심혈관 질환의 주요 위험 요인으로</b> 이어집니다.</li>
	                	</ul>		            
	                </div>
			     </div>
			 </div>
			  <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
	                    $('.model-score').hide();
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
                            	var predictionResult =  (response[0][1]*100).toFixed(1);
                            	var predictionResultText = document.getElementById('predictionResultText');
                                predictionResultText.textContent ='발병확률: '+ predictionResult+' %';                     
                            	var predictionModal = new bootstrap.Modal(document.getElementById('predictionModal'));
                            	predictionModal.show();
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