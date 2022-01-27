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

	<h2>게시글 목록</h2>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>비고</th>
		</tr>
		
		<%--
			<c:url value="uri 경로" />
			- value 속성 안에 컨텍스트 루트 경로를 제외한 절대 경로를 작성
			- 컨텍스트 루트를 제외하고 연결이 가능하다. (컨텍스트 루트 변경 가능성을 대비)
		 --%>
		
		<c:forEach var="article" items="${articles}" varStatus="bId">
		<tr>
			<td>${bId.index + 1}</td>
			<td>
				<a href="<c:url value="/board/content?boardNo=${bId.index + 1}" />">${article.title}</a>
			</td>
			<td>${article.writer}</td>
			<td>
				<a href="<c:url value="/board/delete?boardNo=${bId.index + 1}" />">[삭제]</a>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<a href="/basic/board/write">게시물 작성</a>

	<script>
		const msg = "${msg}";
		if (msg === "delSuccess") {
			alert('삭제가 완료되었습니다.');
		}
	</script>

</body>
</html>