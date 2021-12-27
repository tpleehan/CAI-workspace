<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p>
		# data1 : <%=session.getAttribute("data1") %> <br>
		# data2 : <%=application.getAttribute("data2") %>
	</p>
	
	<%--
		EL에서 데이터를 참조할 때 영역을 명시하지 않는다면
		page -> request -> session -> application
		순서대로 검색하고 찾아내서 표현한다.
	 --%>
	<p>
		# data1 : ${data1 } <br>
		# data2 : ${data2 } <br>
	</p>
	
	<p>
		# data1 : ${sessionScope.data1 } <br>
		# data2 : ${applicationScope.data2 }
	</p>
</body>
</html>