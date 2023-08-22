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
	<c:otherwise test="${WHERE == 'PROF' }">
		<c:set var="successMessage" value="프로필 수정 성공 했어요"/>
		<c:set var="failureMessage" value="프로필 수정 실패 했어요"/>
		<c:set var="successUrl" value="/JoHyeIn/MyPage.do"/>
	</c:otherwise>
</c:choose>

<script>
	<c:choose>
		<c:when test="${SUCCFAIL == 1 }">
			alert("${successMessage }");
			location.replace("<c:url value="${successUrl }"/>");
		</c:when>
		<c:otherwise test="${SUCCFAIL == 0 }">
			alert("${failureMessage }");
			history.back();
		</c:otherwise>
	</c:choose>
</script>