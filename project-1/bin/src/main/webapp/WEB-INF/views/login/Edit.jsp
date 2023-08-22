<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Write.jsp -->
<!-- 로그인 후에만 들어오도록 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
	a{
		color:rgb(80, 79, 79);
	}
	a:hover{
		text-decoration:none;
		color:rgb(59, 59, 59);
	}
</style>
    <div class="container" style="margin-top: 100px">
    	<div class="d-flex justify-content-between mb-4 border-bottom">
			<h3 class="heading mb-4">Write Page</h3>
		    <a class="btn btn-info align-self-center" href="javascript:submit()">등록</a>
		</div>
		<div class="container" style="width: 80%">
		    <form class="mb-5 needs-validation" action="<c:url value="/JoHyeIn/Edit.do?no=${record.no }" />" method="post" enctype="multipart/form-data" novalidate>
			    <div class="head row mb-3">
			    	<input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id="title" value="${record.title }" required/>
			    </div>
			    <div class="body">
			    	<div class="tuple d-flex mb-3">
			    		<div class="column">
			    			<a href="javascript:fnImgFile()">
				    			<div class="row">
					    			<i class="fa-regular fa-image" style="font-size: 2rem"></i>
					    		</div>
					    		<div class="row">
					    			<small>사진</small>
					    		</div>
				    		</a>
				    	</div>
				    	<div class="column mr-auto mx-4">
				    		<a href="javascript:fnExtraFile()">
					    		<div class="row">
					    			<i class="fa-regular fa-folder-open mx-3" style="font-size: 2rem"></i>
					    		</div>
					    		<div class="row mx-0">
					    			<small>파일</small>
					    		</div>
				    		</a>
				    	</div>
				    	<div class="column d-block">
				            <input type="file" multiple name="imgFile" accept=".jpg,.img,.png,.bmp,.gif" style="display: none"/>
				            <input type="file" multiple name="extraFile" accept=".txt,.zip" style="display: none"/>
				        </div>
				        <div class="col">
				        	<c:set var="fileNames" value=""/>
				        	<c:forEach var="attach" items="${attaches }" varStatus="loop">
			        			<c:set var="fileNames" value="${fileNames }${loop.last ? attach.aName+='.'+=attach.aExtension : attach.aName+='.'+=attach.aExtension+=',' }"/>
			        		</c:forEach>
			        		<input type="hidden" name="originalFileName" value="${fileNames }" />
			        		<input type="text" class="form-control align-self-center h-80 mt-2" name="file" value="${fileNames }" readonly />
			        	</div>
			        	<input type="button" class="deleteBtn btn btn-outline-info align-self-center" value="삭제"/>
			    	</div>
			    	<!-- div 로 바꿔서 onchange로 실시간 img, p 태그 생성하기 -->
			        <div class="content mx-n3">
			        	<textarea class="form-control" name="content" id="content" placeholder="내용을 입력하세요" rows="15" required>${record.content }</textarea>
			        </div>
			    </div>
			    <button type="submit" id="hidden" style="display: none" class="btn btn-primary">등록</button>
			</form>
		</div>
    </div><!--container-->
</body>
<script>
	var attaches = document.querySelector('input[name=extraFile]');
	var imges = document.querySelector('input[name=imgFile]');
	var textFile = document.querySelector('input[name=file]');
	
	$('.deleteBtn').click(function(){
		textFile.value='';
	});
	
	function fnImgFile() {
		$('input[name=imgFile]').trigger('click');
		$('input[name=imgFile]').change(function(){
			//textarea를 div로 변경 후 img, p태그 생성하기
			var fileList = imges.files;//유사배열
			if(textFile.value.length){textFile.value += ',';}
			for(var i=0;i<fileList.length;i++){
				var filename = i===fileList.length-1 ? fileList[i].name : fileList[i].name+", ";
				//var filesize= fileList[i].size;
				//var filetype = fileList[i].type;
				textFile.value += filename;
			}
		});
	}
	
	function fnExtraFile() {		
		$('input[name=extraFile]').trigger('click');
		$('input[name=extraFile]').change(function(){
			//textarea를 div로 변경 후 img, p태그 생성하기
			var fileList = attaches.files;//유사배열
			if(textFile.value.length){textFile.value += ',';}
			for(var i=0;i<fileList.length;i++){
				var filename = i===fileList.length-1 ? fileList[i].name : fileList[i].name+", ";
				//var filesize= fileList[i].size;
				//var filetype = fileList[i].type;
				textFile.value += filename;
			}
		});
	}
	
	//글 등록 유효성 체크
	function submit() {
		console.log($('#title').val().length);
		if(!$('#title').val().length){
			alert('제목을 입력해주세요');
			$('#title').focus();
			return false;
		}
		else if(!$('#content').val().length){
			alert('내용을 입력해주세요');
			$('#title').focus();
			return false;
		}
		$('#hidden').trigger('click');
	}
</script>
</html>