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
    .tss {
        display: flex;
        flex-direction: row;
        font-size: 16px;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        height:45px;
        padding-bottom:15px;
        border-bottom: 3px solid #F0F0F0;
    }
    .tss1 {
        display: flex;
        flex-direction: row;
        font-size: 14px;
        align-items: center;
        width: 90%;
    }
    .form-check {
    	 margin-right: 50px;
    }
    strong {
    	font-size: 16px;
    	font-weight: 500;
		vertical-align: middle;
		width: 100px;
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
    margin-top: 6px;
    margin-bottom: 6px;
    text-align: justify;
    font-size: 15px;
}

</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1100px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px; font-weight: bold; line-height: 50px;">인공지능을 통한<br/> <span style="color:#EF605D;">MEDI-Q</span> 질병예측 시스템</div>
		</div>

		<div class="container effect-custom-font" >
		    <div class="mx-5 my-4 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7);">심혈관질환 발병확률 예측하기</div>
			<div class="model-score m-4 pt-5" style="width:80%;height:50px;">※ 현재 머신러닝의 예측능력(F1-Score)은 약 <kbd>80%</kbd> 입니다</div>
		    <div class="row pt-5">
		        <div class="col-6" style="max-width: 40%;">
		            <form id="personInfoForm" class="validation-form" novalidate>
		            	<div class="tss col mb-3">
		                    <strong>연령</strong>
		                    <div class="tss1 d-flex" style="align-items: center; margin-left: 80px;">
		                    	<input type="text" class="form-control m-2 w-75" style="border:none; text-align: right;" id="age" name="age" placeholder="연령을 입력해주세요" value="${age }" required> 세
		                    </div>
		                    <div class="invalid-feedback">
		                        연령을 입력해주세요
		                    </div>
		                </div>
		            	<div class="tss col mb-3">
		                    <strong>성별</strong>
		                    <div class="tss1 col " style="margin-left: 90px; padding-right: 0px;">
			                    <div class="form-check">
								  <input class="form-check-input" type="radio" name="gender" id="gender_Man" value="2" <c:if test="${gender eq 'M' }"> checked="checked"</c:if>>
								  <label class="form-check-label" for="gender_Man">
								    남성
								  </label>
								</div>
								<div class="form-check" style="margin-right: 0px;">
								  <input class="form-check-input" type="radio" name="gender" id="gender_Woman" value="1" <c:if test="${gender eq 'F' }"> checked="checked"</c:if>>
								  <label class="form-check-label" for="gender_Woman">
								    여성
								  </label>
								</div>
			                    <div class="invalid-feedback">
			                        성별을 체크해 주세요
			                    </div>
		                	</div>
	                	</div>
		                <div class="tss col mb-3">
		                    <strong>신장</strong>
		                    <div class="tss1 d-flex" style="margin-left: 80px;">
		                    	<input type="text" class="form-control m-2 w-75" style="border:none; text-align: right;" id="height" name="height" placeholder="신장을 입력해주세요" value="${healthInfoDto.height}" required>cm
		                    </div>
		                    <div class="invalid-feedback">
		                        신장을 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col mb-3">
		                    <strong>몸무게</strong>
		                    <div class="tss1 d-flex" style="margin-left: 80px;">
		                    	<input type="text" class="form-control  m-2 w-75" style="border:none; text-align: right;" id="weight" name="weight" placeholder="몸무게를 입력해주세요" value="${healthInfoDto.weight}" required>kg
		                    </div>
		                    <div class="invalid-feedback">
		                        몸무게를 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col mb-3">
		                    <strong style="width: 190px;">혈압(최저/최고)</strong>
		                    <div class="tss1 d-flex" style="align-items: center; padding-left: 4px;">
		                    	<input type="text" class="form-control m-2" style="border:none; width:69px; text-align: right;" id="bloodpress_low" name="bloodpress_low"  placeholder="최저혈압" value="${healthInfoDto.bloodPressure_low}" required> /
			                    <input type="text" class="form-control m-2" style="border:none; width:68px; text-align: right;" id="bloodpress_high" name="bloodpress_high"  placeholder="최고혈압" value="${healthInfoDto.bloodPressure_high}" required> mmHg
		                    </div>
		                    <div class="invalid-feedback">
		                        혈압수치를 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col mb-3">
		                    <strong>콜레스테롤</strong>
		                    <div class="tss1 d-flex" style="align-items: center;">
		                    	<input type="text" class="form-control m-2 w-75" style="border:none; text-align: right;" id="total_cholesterol" name="total_cholesterol" placeholder="총 콜레스테롤 수치 입력" value="${healthInfoDto.total_cholesterol}" required>mg/dL
		                    </div>
		                    <div class="invalid-feedback">
		                        콜레스테롤 수치를 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col mb-3">
		                    <strong>혈당</strong>
		                    <div class="tss1 d-flex" style="align-items: center;">
		                    	<input type="text" class="form-control  m-2 w-75" style="border:none; text-align: right;" id="glucose" name="glucose" placeholder="포도당 수치를 입력해주세요" value="${healthInfoDto.bloodSugar}" required>mg/dL
		                    </div>
		                    <div class="invalid-feedback">
		                        혈당 수치를 입력해주세요
		                    </div>
		                </div>
		                <div class="tss col mb-3">
		                	<strong>흡연 여부</strong>
		                	 <div class="tss1 col " style="margin-left: 100px; padding-right: 0px;">
				                <div class="form-check">
							  		<input class="form-check-input" type="radio" id="smoke_check1" name="smoke_check" value="0" required>
								  	<label class="form-check-label" for="smoke_check1">
									    예
								  	</label>
								</div>
								<div class="form-check" style="margin-right: 0px;">
							    	<input class="form-check-input" type="radio" id="smoke_check2" name="smoke_check" value="1" >
								  	<label class="form-check-label" for="smoke_check2">
									    아니오
								  	</label>
								</div>
							</div>
			                <div class="invalid-feedback">
			                       흡연 여부를 체크해주세요
			                </div>
		                </div>
		                <div class="tss col mb-3" style="border:none;">
		                	<strong>음주 여부</strong>
		                	 <div class="tss1 col " style="margin-left: 100px; padding-right: 0px;">
				                <div class="form-check">
							  		<input class="form-check-input" type="radio" id="alco_check2" name="alco_check" value="0" required>
								  	<label class="form-check-label" for="alco_check2">
									    예
								  	</label>
								</div>
								<div class="form-check" style="margin-right: 0px;">
							    	<input class="form-check-input" type="radio" name="alco_check" id="alco_check1" value="1" >
								  	<label class="form-check-label" for="alco_check1">
									    아니오
								  	</label>
								</div>
							</div>
			                <div class="invalid-feedback">
			                       음주 여부를 체크해주세요
			                </div>
		                </div>
		             
		                <div class="mb-4"></div>
		                <button class="btn btn-primary btn-lg btn-block" type="submit"  data-bs-toggle="modal" data-bs-target="#predictionModal">예측해보기</button>
		            </form>
		        </div>
		
		        <div class="col-6" style="position:relative; overflow: hidden; height: 100%; margin-left: 50px;">
		            <!--<canvas id="drawing_canvas"></canvas>-->
		            <img src="<c:url value="/images/tsimages/cardiovascular.png"/>" style="display: block;margin-top:30px; height:535px; width:505px;" >
<!-- 		            <div style="position:absolute;  background-color: white;  width:130px; z-index:2;  height: 100px; right: 40px; top:600px;"></div>
		            <img src="" id="machineImage" style="display: block; margin: auto; position: relative; bottom:-20%; width:100%;height:700px; border-radius:12px;"/> -->
		        </div>
		    </div>
		    <hr class="mt-5">
		    <div class="effect-custom-font m-5 py-5">
		    	<div class="title mb-5" style="font-size:30px;">
		    		<img src="<c:url value="/images/mainicon.png"/>" style="width:30px;height:30px;">
		    		<img src="<c:url value="/images/maintitle.png"/>" style="height:30px;">
												와 다른 질병을 예측해 보아요!</div>
		    		<div class="p-2" style="cursor:pointer;border-radius:40px;font-size:20px;background-color:#ff9558; font-weight: bold; text-align: center;" onclick="redirectToPrediction()">다른 질병 예측하러 가기</div>
		    </div>
		</div>
	</div>
	
	<div class="modal fade" id="predictionModal" tabindex="-1" aria-labelledby="predictionModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" style="max-width:800px;">
	    <div class="modal-content">
	      <div class="modal-header" style="justify-content: center;">
	        <h5 class="modal-title" id="predictionModalLabel"><b style="font-size: 24px;">심혈관질환 예측결과</b></h5>
	      </div>
	      <div class="modal-body">
		      <div class="row" style="flex-grow: 1; display: flex;">
		        <div  class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; text-align:center; align-items: center; justify-content: center; font-size: 40px; font-weight: bold;" id="predictionResultText">
		        	<canvas id="drawing_canvas"></canvas>
		        </div>
		        <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
						<ul class="pakinul">
	                		<li class="text-center" style="font-weight:bold; font-size: 20px; margin-bottom: 12px; margin-top: 0px;"><b>심혈관질환 예측과정</b></li>
	               	 		<li style="font-size: 12px;"><span></span><b style="color: #EF605D">연령</b>과 <b style="color: #EF605D">성별</b>은 심혈관 질환의 위험도에 큰 영향을 줍니다. 나이가 들수록, 특히 남성은 조기에, 여성은 폐경 후에 위험이 증가합니다.</li>
							<li style="font-size: 12px;"><span></span><b style="color: #EF605D">신장</b>과 <b style="color: #EF605D">몸무게</b>는 체질량 지수(BMI)를 결정하는 요인으로 BMI가 증가함에 따라 혈관 내벽의 플라크 형성과 심혈관 질환 위험도가 높아집니다.</li>
							<li style="font-size: 12px;"><span></span><b style="color: #EF605D">고혈압</b>과 <b style="color: #EF605D">높은 혈당 수치</b>는 혈관 내벽의 손상을 증가시켜 심혈관 질환의 발병을 촉진합니다.</li>
							<li style="font-size: 12px;"><span></span><b style="color: #EF605D">콜레스테롤</b>과 <b style="color: #EF605D">흡연</b>은 혈관 내벽의 플라크 형성 및 혈관 수축을 초래하여 질환 발병을 촉진합니다.</li>
							<li style="font-size: 12px;"><span></span><b style="color: #EF605D">과도한 음주</b>는 혈압 상승, 부정맥 및 지방간 등 여러 건강 문제를 유발하여 심혈관 질환의 위험을 높입니다.</li>   	
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
                	var gender = document.querySelector("input[name=gender]:checked").value;
                    var height = $('#height').val();
                    var weight = $('#weight').val();
                    var bloodpress_high = $('#bloodpress_high').val();
                    var bloodpress_low = $('#bloodpress_low').val();
                    var total_cholesterol = $('#total_cholesterol').val();
                    total_cholesterol = total_cholesterol <= 200 ? 1 : (total_cholesterol <= 240 ? 2 : 3);
                    var glucose = $('#glucose').val();
                    glucose = glucose <= 100 ? 1 : (glucose <= 125 ? 2 : 3);
                    var smoke = document.querySelector("input[name=smoke_check]:checked").value;
                    var alco = document.querySelector("input[name=alco_check]:checked").value;
                    var age = $('#age').val();
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
	                            "gender": gender,
	                            "height": height,
	                            "weight": weight,
	                            "bloodpress_high": bloodpress_high,
	                            "bloodpress_low": bloodpress_low,
	                            "total_cholesterol": total_cholesterol,
	                            "glucose": glucose,
	                            "smoke": smoke,
	                            "alco": alco,
	                            "age": age
	                        }
                    	
                        $.ajax({
                            type: 'POST',
                            url: 'http://192.168.0.16/cardiovascular',
                            contentType : "application/json",
                            dataType: 'json',
                            data: JSON.stringify(data),
                            success: function (response) {
                            	var predictionResult =  (response[0][1]*100).toFixed(1);
                            	var predictionResultText = document.getElementById('predictionResultText');
                                predictionResultText.textContent ='발병확률: '+ predictionResult+' %';
                     
                            	var predictionModal = new bootstrap.Modal(document.getElementById('predictionModal'));
                            	predictionModal.show();
                            	$.ajax({
                                    type: 'post',
                                    url: "<c:url value='/savePrediction'/>",
                                    contentType: 'application/json',
                                    data: JSON.stringify({
                                        p_disease: 'Cardiovascular',
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
    
    /* 
    console.log('%o',response);
    console.log(response[0])
    initDrawingCanvas((response[0][1]*100).toFixed(1));
    requestAnimationFrame(loop);
    $('#machineImage').hide();
                                
    const TWO_PI = Math.PI * 2;
    const HALF_PI = Math.PI * 0.5;

    // canvas settings
    var viewWidth = 512,
        viewHeight = 350,
        drawingCanvas = document.getElementById("drawing_canvas"),
        ctx,
        timeStep = (1/60),
        textValue;

    Point = function(x, y) {
        this.x = x || 0;
        this.y = y || 0;
    };

    Particle = function(p0, p1, p2, p3) {
        this.p0 = p0;
        this.p1 = p1;
        this.p2 = p2;
        this.p3 = p3;

        this.time = 0;
        this.duration = 3 + Math.random() * 2;
        this.color =  '#' + Math.floor((Math.random() * 0xffffff)).toString(16);

        this.w = 8;
        this.h = 6;

        this.complete = false;
    };

    Particle.prototype = {
        update:function() {
            this.time = Math.min(this.duration, this.time + timeStep);

            var f = Ease.outCubic(this.time, 0, 1, this.duration);
            var p = cubeBezier(this.p0, this.p1, this.p2, this.p3, f);

            var dx = p.x - this.x;
            var dy = p.y - this.y;

            this.r =  Math.atan2(dy, dx) + HALF_PI;
            this.sy = Math.sin(Math.PI * f * 10);
            this.x = p.x;
            this.y = p.y;

            this.complete = this.time === this.duration;
        },
        draw:function() {
            ctx.save();
            ctx.translate(this.x, this.y);
            ctx.rotate(this.r);
            ctx.scale(1, this.sy);

            ctx.fillStyle = this.color;
            ctx.fillRect(-this.w * 0.5, -this.h * 0.5, this.w, this.h);

            ctx.restore();
        }
    };

    Loader = function(x, y) {
        this.x = x;
        this.y = y;

        this.r = 24;
        this._progress = 0;

        this.complete = false;
    };

    Loader.prototype = {
        reset:function() {
            this._progress = 0;
            this.complete = false;
        },
        set progress(p) {
            this._progress = p < 0 ? 0 : (p > 1 ? 1 : p);

            this.complete = this._progress === 1;
        },
        get progress() {
            return this._progress;
        },
        draw:function() {
            ctx.fillStyle = '#000';
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.r, -HALF_PI, TWO_PI * this._progress - HALF_PI);
            ctx.lineTo(this.x, this.y);
            ctx.closePath();
            ctx.fill();
        }
    };

    // pun intended
    Exploader = function(x, y) {
        this.x = x;
        this.y = y;

        this.startRadius = 24;

        this.time = 0;
        this.duration = 0.4;
        this.progress = 0;

        this.complete = false;
    };

    Exploader.prototype = {
        reset:function() {
            this.time = 0;
            this.progress = 0;
            this.complete = false;
        },
        update:function() {
            this.time = Math.min(this.duration, this.time + timeStep);
            this.progress = Ease.inBack(this.time, 0, 1, this.duration);

            this.complete = this.time === this.duration;
        },
        draw:function() {
            ctx.fillStyle = '#000';
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.startRadius * (1 - this.progress), 0, TWO_PI);
            ctx.fill();
        }
    };

    var particles = [],
        loader,
        exploader,
        phase = 0;

    function initDrawingCanvas(data) {
        drawingCanvas.width = viewWidth;
        drawingCanvas.height = viewHeight;
        ctx = drawingCanvas.getContext('2d');
        textValue = data;
        createLoader();
        createExploader();
        createParticles();
    }

    function createLoader() {
        loader = new Loader(viewWidth * 0.5, viewHeight * 0.5);
    }

    function createExploader() {
        exploader = new Exploader(viewWidth * 0.5, viewHeight * 0.5);
    }

    function createParticles() {
        for (var i = 0; i < 128; i++) {
            var p0 = new Point(viewWidth * 0.5, viewHeight * 0.5);
            var p1 = new Point(Math.random() * viewWidth, Math.random() * viewHeight);
            var p2 = new Point(Math.random() * viewWidth, Math.random() * viewHeight);
            var p3 = new Point(Math.random() * viewWidth, viewHeight + 64);

            particles.push(new Particle(p0, p1, p2, p3));
        }
    }

    function update() {

        switch (phase) {
            case 0:
                loader.progress += (1/45);
                break;
            case 1:
                exploader.update();
                break;
            case 2:
                particles.forEach(function(p) {
                    p.update();
                });
                break;
        }
    }

    function draw() {
        ctx.clearRect(0, 0, viewWidth, viewHeight);

        switch (phase) {
            case 0:
                loader.draw();
                break;
            case 1:
                exploader.draw();
                break;
            case 2:
                particles.forEach(function(p) {
                    p.draw();
                });
                ctx.font = "bold 40px sans-serif";
                ctx.fillText('발병 확률은 : '+textValue+'%', viewWidth/4, viewHeight/2);
                console.log("asd");
                break;
        }
    }



    function loop() {
        update();
        draw();

        if (phase === 0 && loader.complete) {
            phase = 1;
        }
        else if (phase === 1 && exploader.complete) {
            phase = 2;
        }
        else if (phase === 2 && checkParticlesComplete()) {
            // reset
            //phase = 0;
            //loader.reset();
            //exploader.reset();
            //particles.length = 0;
            //createParticles();
            return;
        }

        requestAnimationFrame(loop);
    }

    function checkParticlesComplete() {
        for (var i = 0; i < particles.length; i++) {
            if (particles[i].complete === false) return false;
        }
        return true;
    }

    // math and stuff
    var Ease = {
        inCubic:function (t, b, c, d) {
            t /= d;
            return c*t*t*t + b;
        },
        outCubic:function(t, b, c, d) {
            t /= d;
            t--;
            return c*(t*t*t + 1) + b;
        },
        inOutCubic:function(t, b, c, d) {
            t /= d/2;
            if (t < 1) return c/2*t*t*t + b;
            t -= 2;
            return c/2*(t*t*t + 2) + b;
        },
        inBack: function (t, b, c, d, s) {
            s = s || 1.70158;
            return c*(t/=d)*t*((s+1)*t - s) + b;
        }
    };

    function cubeBezier(p0, c0, c1, p1, t) {
        var p = new Point();
        var nt = (1 - t);

        p.x = nt * nt * nt * p0.x + 3 * nt * nt * t * c0.x + 3 * nt * t * t * c1.x + t * t * t * p1.x;
        p.y = nt * nt * nt * p0.y + 3 * nt * nt * t * c0.y + 3 * nt * t * t * c1.y + t * t * t * p1.y;

        return p;
    } */
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>