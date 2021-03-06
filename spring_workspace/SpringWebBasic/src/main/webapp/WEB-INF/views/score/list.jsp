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

	<h2>학생들의 전체 성적 조회</h2>
	
	<%--forEach태그에서 varStatus는 반복문의 목록수, 목록의 현재 index, count 등 위치값으로 사용한다. --%>
	<c:forEach var="stu" items="${sList}" varStatus="stuNum">
		<p>
			학번: ${stuNum.index+1}, 이름: ${stu.stuName}, 국어: ${stu.kor}, 영어: ${stu.eng},
			수학: ${stu.math}, 총점: ${stu.total}, 평균: ${stu.average}
			<a href="/basic/score/delete?stuNum=${stuNum.index+1}">[삭제]</a>
		</p>
	</c:forEach>
	
	<!-- 
	<p style="color: red">
		${msg}
	</p>
	 -->
	 
	<script>
		const msg = "${msg}";
		if (msg === "delSuccess") {
			alert('삭제가 완료되었습니다.');
		}
	</script>
	
</body>
</html>