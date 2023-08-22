
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Message.jsp -->
<c:choose>
	<c:when test="${WHERE == 'INS' }">
		<c:set var="successMessage" value="입력 성공 했어요"/>
		<c:set var="failureMessage" value="입력 실패 했어요"/>
		<c:set var="successUrl" value="/JoHyeIn/Board.do"/>
	</c:when>
	<c:when test="${WHERE == 'SOCIAL' }">
		<c:set var="failureMessage" value="소셜로그인 실패 했어요"/>
	</c:when>
	<c:otherwise><%-- ${WHERE == 'PROF' } --%>
		<c:set var="successMessage" value="프로필 수정을 성공했습니다"/>
		<c:set var="failureMessage" value="프로필 수정을 실패했습니다"/>
		<c:set var="defaultMessage" value="기본이미지를 선택했습니다\r\n마이페이지로 이동합니다"/>
		<c:set var="successUrl" value="/project/MyPage.do"/>
	</c:otherwise>
</c:choose>

<script>
	<c:choose>
		<c:when test="${SUCCFAIL == 1 }">
			alert("${successMessage }");
			location.replace("<c:url value="${successUrl }"/>");
		</c:when>
		<c:when test="${SUCCFAIL == 0 }">
			alert("${failureMessage }");
			location.replace("<c:url value="${successUrl }"/>");
		</c:when>
		<c:otherwise>
			alert("${defaultMessage }");
			history.back();
		</c:otherwise>
	</c:choose>
</script>