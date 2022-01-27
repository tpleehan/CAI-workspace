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

	<h2>${board}번 게시물 내용</h2>

	<form method="post">
		<p>
			# 작성자 : <input type="text" name="writer" value="${board.writer}"> <br>
			# 제목: <input type="text" name="writer" value="${board.title}"> <br>
			# 내용 : <textarea rows="5">${board.content}</textarea>
		</p>
	    <input type="submit" value="수정">
	</form>
	<a href="<c:url value="/board/list" />">글 목록</a>
	

</body>
</html>