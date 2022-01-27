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

	<h2>${article.boardNo}번 게시물 내용</h2>

	<p>
		# 작성자 : ${article.writer} <br>
		# 제목: ${article.title} <br>
		# 내용 : <textarea rows="5" readonly>${article.content}</textarea>
	</p>
	
	<!-- 안쪽에  "(쌍따옴표)를 사용할 경우 충돌이 발생할 수 있기 때문에 '(홑따옴표)를 사용을 권장 -->
	<a href="<c:url value='/board/list' />">글 목록</a>
	<a href="<c:url value='/board/modify?boardNo=${article.boardNo}' />">글 수정</a>

</body>
</html>