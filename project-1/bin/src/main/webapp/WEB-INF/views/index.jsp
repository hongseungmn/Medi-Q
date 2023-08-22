<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
    <div class="container" style="margin-top: 49px">
        <div class="jumbotron">
            <h1>Hello Spring!!! <small>${requestScope.today }</small></h1>
            <a href="/project/Login.do">로그인 창</a>       
        </div><!--jumbotron-->
        
    </div><!--container-->
    