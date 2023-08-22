<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/tsfolder/css/drawStyle.css"/>" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>
body {
	background-color: #fdfbf6;
}

.effect-custom-font {
	font-family: Noto Sans KR, sans-serif;
}

.hr-class {
	border: solid 3px #ccc;
}

/*ts 스타일 공간*/
.my-title {
	position: relative;
	background-image:
		url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_brand.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	margin-top: 20px;
	margin-bottom: 50px;
}

.jumbotron {
	display: flex;
	flex-direction: row;
	background-color: white;
	border-radius: 15px;
	width: 100%;
	height: 120px;
	padding: 24px 20px;
}

.tsai:hover {
	color: white;
	border: 2px solid #FD9F28;
	border-radius: 10px;
	padding: 10px;
}

.tsai {
	box-shadow: 2px 2px 5px black;
	border-radius: 10px;
	padding: 10px;
}

.tsaibg {
	box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	position: absolute;
	top: 385px;
	right: 230px;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    max-width: 80%;
}

.close1 {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close1:hover,
.close1:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
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
.pakinul1 {
	color: #6866ab;
    font-weight: bold;
}
</style>

	<div class="container my-3" style="min-height: 880px; max-width: 1200px; background-color: white; border-radius: 15px;">
		<div class="my-title d-flex effect-custom-font justify-content-between" style="align-items:center; width:100%;height:200px;">
			<div class="" style="font-size:32px; margin-left: 180px; font-weight: bold; line-height: 50px;">인공지능을 통한<br/> <span style="color:#EF605D;">MEDI-Q</span> 질병예측 시스템</div>
		</div>
		<div class="mx-5 my-4 display-4 effect-custom-font" style="text-align:center; color:rgba(3, 124, 194,0.7); font-weight: bold;">파킨슨병 발병확률 예측하기</div>
		<div class="model-score  mx-2 pt-5 mb-4" style="width:80%;height:80px; font-weight: bold;background-color:">※현재 머신러닝의 예측 정확도는 약 <kbd style="font-weight: normal;">85%</kbd> 입니다</div>
		<div class="d-flex" style="flex-direction: row; position: relative;">
			<div style="font-size: 18px;font-weight: bold; width: 100px; height: 100px; position: absolute; top:10px; left:10px;">
				<img src="https://cdn-icons-png.flaticon.com/512/204/204574.png" style="width: 100px; height: 100px;" ><br/>
				<span style="font-size: 15px;"><br/>&nbsp;&nbsp;&nbsp;&nbsp;나선 예시</span>
			</div>
			<canvas id="jsCanvas" class="canvas" style="border:3px solid black; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.68);"></canvas>
			<div style="border:2px solid gray; margin-left:50px; width:450px; border-radius: 10px;">
				<div class="controls" style="height: 100%; width: 100%; margin-top: 20px;">
					<div class="d-flex m-2" style="height: 575px; width:95%; flex-direction: column; border: solid 4px #f0ebf6;">
						<h4 style="border-bottom: solid 1px rgba(0, 0, 0, 0.3); margin-top:10px; padding-bottom:10px; display: flex; align-items: center; height: 80px;">
							<img src="https://www.kumc.or.kr/seasonPress/KUMM_vol17/img_sub/KS11_box_t1.png" style="margin-left:25px; width: 50px; height: 50px;" >
							<span style="margin-left:20px; color:#222222; font-size: 25px; font-weight: bold; line-height: 45px;">파킨슨병 AI 자가진단</span>
						</h4>
						<ul class="pakinul">
							<li><span></span>종종걸음으로 걷고 보폭이 짧아졌다.</li>
							<li><span></span>근육이 뻣뻣해지고, 조이거나 당긴다.</li>
							<li><span></span>섬세한 동작을 하는 것이 어려워졌다.</li>
							<li><span></span>걸을 때 자꾸 한쪽 다리가 땅에 끌린다.</li>
							<li><span></span>편안한 자세나 누워있을 때 손발이 떨린다.</li>
							<li><span></span>얼굴의 표정이 점점 없어지고 얼굴이 굳는다.</li>
							<li><span></span>팔, 다리가 무거워지고 행동하는 것이 느려졌다.</li>
							<li><span></span>침대나 의자에서 일어나거나 혼자서 돌아눕는<br/> 것이 힘들다.</li>
							<li class="pakinul1">*2가지 이상 → 파킨슨병 가능성이 있음.</li>
							<li class="pakinul1">*5가지 이상 → 파킨슨병일 확률이 높음.</li>
						</ul>
						<div class="controls__btns" style="margin-top: 27px; text-align: center; justify-content: center; display: flex;">
					        <button id="jsSave" style="width:110px; height: 30px; font-size: 14px; margin-right: 50px;">결과보기</button>
					        <button onclick="location.reload()" style="width:110px; height: 30px; font-size: 14px;">다시하기</button>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="modal" class="modal">
	    <div class="modal-content" style="width:900px; height:500px; display: flex; flex-direction: column;">
	        <div style="display: flex; justify-content: flex-end; margin-right: 30px;"><span class="close1">&times;</span></div>
	        <div class="row" style="flex-grow: 1; display: flex;">
	            <div class="col-6" id="modal-content" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center;">
	                <div id="image-container"></div>
	            </div>
	            <div class="col-6" style="width: 400px; height: 400px; flex-grow: 1; display: flex; align-items: center; justify-content: center; padding-left: 0px;">
	                <ul class="pakinul">
	                	<li class="text-center" style="font-weight:bold; font-size: 25px; margin-bottom: 40px; margin-top: 0px;"><b>파킨슨병 진단과정</b></li>
	                    <li><span></span>MEDI-Q는 파킨슨병 진행시 발생하는 <b style="color: #EF605D">중추신경계 손상에 의한 떨림 증상을 기반으로</b> 머신러닝 알고리즘이 수집된 데이터를 분석하여 건강상태를 확인합니다.</li>
	                    <li><span></span>사용자의 손떨림을 모니터링하고, 그림판에 <b style="color: #EF605D">그린 나선을 분석하여 현재 파킨슨병 진행상황을 예측합니다.</b></li>
	                    <li><span></span>나선 그리기 진단시스템을 이용해 환자와 의료 전문가는 증상 변화를 빠르게 파악하고 치료 계획을 조정할 수 있습니다.</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>

<script>
//모달창 생성
document.getElementById("jsSave").addEventListener("click", function() {
    // 모달 창 열기
    document.getElementById("modal").style.display = "block";

    // 결과 값을 가져와서 modal-content에 추가하고 이미지 생성 함수 호출
    var result = "여기에 결과 값 추가"; // 여기에 실제 결과 값을 가져오는 로직을 추가해야 합니다.
    document.getElementById("modal-content").innerHTML = result;

    // 이미지 생성 함수 호출
    handleSaveClick();
});

document.querySelector(".close1").addEventListener("click", function() {
    // 모달 창을 닫기
    document.getElementById("modal").style.display = "none";
});

/*성민쓰코드
    function handleSaveClick() {
        const files = canvas.toDataURL("image/png");
        const imageData = files.split(",")[1]; // "data:image/png;base64," 이후의 이미지 데이터
        const filedata = { base64String : imageData };
        const formData = new FormData(); // AJAX로 파일 업로드시 사용
        formData.append("files", imageData);

// FormData의 값을 콘솔에 출력
        for (const entry of formData.entries()) {
            console.log(entry[0], entry[1]);
        }

        $.ajax({
            url: "http://192.168.0.16/parkinson",
            data: filedata,
            method: "post"
        }).done(function(response) {
        	// 받아온 이미지 base64 데이터
        	console.log(response.score);
            var imageBase64 = response.image_base64;

            // 이미지 생성 및 화면에 출력
            var imageTag = '<img src="data:image/png;base64,' + imageBase64 + '" alt="Image">';
            $('#image-container').html(imageTag);
        });
    }
    밑에는 수정된 코드 */
    function handleSaveClick() {
        const files = canvas.toDataURL("image/png");
        const imageData = files.split(",")[1]; // "data:image/png;base64," 이후의 이미지 데이터
        const filedata = { base64String: imageData };
        const formData = new FormData(); // AJAX로 파일 업로드시 사용
        formData.append("files", imageData);

        // FormData의 값을 콘솔에 출력
        for (const entry of formData.entries()) {
            console.log(entry[0], entry[1]);
        }

        $.ajax({
            url: "http://192.168.0.16/parkinson",
            data: filedata,
            method: "post"
        }).done(function(response) {
            // 받아온 이미지 base64 데이터
            console.log(response.score);
            var imageBase64 = response.image_base64;

            // 이미지 생성 및 모달 내부에 화면에 출력
            var imageTag = '<img src="data:image/png;base64,' + imageBase64 + '" style="width:400px; height:400px; padding:0 15px; border:1px solid black;" alt="Image">';
            $('#modal-content').html(imageTag);
        });
    }
    
    const canvas = document.getElementById("jsCanvas");
    const ctx = canvas.getContext("2d");
    const colors = document.getElementsByClassName("jsColor");
    const range = document.getElementById("jsRange");
    const mode = document.getElementById("jsMode");
    const saveBtn = document.getElementById("jsSave");

    const INITIAL_COLOR = "#000000";
    const CANVAS_SIZE = 700;

    ctx.strokeStyle = "#2c2c2c";

    canvas.width = CANVAS_SIZE;
    canvas.height = CANVAS_SIZE;

    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);

    ctx.strokeStyle = INITIAL_COLOR;
    ctx.fillStyle = INITIAL_COLOR;
    ctx.lineWidth = 10; /* 라인 굵기 */

    let painting = false;
    let filling = false;

    function stopPainting() {
        painting = false;
    }

    function startPainting() {
        painting = true;
    }

    function onMouseMove(event) {
        const x = event.offsetX;
        const y = event.offsetY;
        if (!painting) {
            ctx.beginPath();
            ctx.moveTo(x, y);
        } else{
            ctx.lineTo(x, y);
            ctx.stroke();
        }
    }

    function handleColorClick(event) {
        const color = event.target.style.backgroundColor;
        ctx.strokeStyle = color;
        ctx.fillStyle = color;
    }

    function handleRangeChange(event) {
        const size = event.target.value;
        ctx.lineWidth = size;
    }

    function handleModeClick() {
        if (filling === true) {
            filling = false;
            mode.innerText = "Fill";
        } else {
            filling = true;
            mode.innerText = "Paint";
        }
    }

    function handleCanvasClick() {
        if (filling) {
            ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        }
    }

    // 우클릭 방지
    /*
    function handleCM(event) {
       event.preventDefault();
     }
     */



    if (canvas) {
        canvas.addEventListener("mousemove", onMouseMove);
        canvas.addEventListener("mousedown", startPainting);
        canvas.addEventListener("mouseup", stopPainting);
        canvas.addEventListener("mouseleave", stopPainting);
        canvas.addEventListener("click", handleCanvasClick);
        // canvas.addEventListener("contextmenu", handleCM);

    }

    Array.from(colors).forEach(color =>
        color.addEventListener("click", handleColorClick));


    if (range) {
        range.addEventListener("input", handleRangeChange);
    }

    if (mode) {
        mode.addEventListener("click", handleModeClick);
    }

    if (saveBtn){
        saveBtn.addEventListener("click", handleSaveClick);
    }
</script>
	</body>
</html>