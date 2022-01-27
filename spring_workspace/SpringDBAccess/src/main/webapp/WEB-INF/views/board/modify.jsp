<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>${article.boardNo}번 게시물 내용 수정</h2>

	<form method="post">
		<input type="hidden" name="boardNo" value="${article.boardNo}">
		<p>
			# 작성자 : <input type="text" name="writer" value="${article.writer}"> <br>
			# 제목: <input type="text" name="title" value="${article.title}"> <br>
			# 내용 : <textarea rows="5" name="content">${article.content}</textarea> <br>
	    	
	    	<input type="submit" value="수정">
		</p>
	</form>
	<a href="<c:url value="/board/list" />">글 목록</a>
	
</body>
</html>