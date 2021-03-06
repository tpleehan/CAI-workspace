<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
	<link rel="stylesheet" href="mvcWeb/css/bootstrap.css">
	<link rel="stylesheet" href="mvcWeb/css/custom.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="mvcWeb/js/bootstrap.js"></script>
    <title>Welcome to mvcWeb</title>
   
</head>
<body>

	<nav class="navbar navbar-default" id="nav">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="/mvcWeb">Lee Team</a>
	    </div>
	
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="/mvcWeb" style="margin-right: 10px;">메인</a></li>
	            <li><a href="/mvcWeb/listPage.board">게시판</a></li>
	        </ul>
	        
	        <ul class="nav navbar-nav navbar-right">
	        <c:choose>
	        	<c:when test="${user == null}">
		            <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
		                <ul class="dropdown-menu">
		                    <li><a href="/mvcWeb/loginPage.user">로그인</a></li>
		                    <li><a href="/mvcWeb/joinPage.user">회원가입</a></li>
		                </ul>
		            </li>
	        	</c:when>
	        	<c:otherwise>
		            <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
		                <ul class="dropdown-menu">
		                    <li><a href="/mvcWeb/logout.user">로그아웃</a></li>
		                    <li><a href="/mvcWeb/myPage.user">마이페이지</a></li>
		                </ul>
		            </li>
	        	</c:otherwise>
	        </c:choose>
	        
	        </ul>
	    </div>
	</nav>

</body>
</html>