<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>Scritlet for문</h4>
<%
	int total = 0;

	for (int i = 1; i <= 100; i++) {
		total += i;
	}
	
	out.print("<h4>1부터 100까지의 누적합: " + total + "</h4>");
%>

	<%-- 
		<c:set> 태그는 변수의 생성과 동시에
		이미 동일한 이름의 변수가 존재한다면 
		기존의 변수를 지목해서 값을 변경할 때도 사용한다.
	 --%>
	<h4>EL JSTL for문</h4>
	<c:set var="total" value="0" />
	<!-- step은 생략이 가능하다. 기본값은 1이다. -->
	<c:forEach var="i" begin="1" end="100" step="1"> 
		<!-- ${total += i} 이렇게 사용 못한다. -->
		<c:set var="total" value="${total + i}"/>
	</c:forEach>
	<h4>1부터 100까지의 누적합: ${total}</h4>
	
	<hr>
	
	<h4>Scritlet 구구단 4단</h4>
<%
	for (int hang = 1; hang <= 9; hang++) {
%>
		4 x <%=hang %> = <%=4 * hang %> <br>		
<%
	}
%>
	<h4>EL JSTL 구구단 4단</h4>
	<!-- step을 생략했을 때 자동으로 1로 처리 -->
	<c:forEach var="hang" begin="1" end="9">
		4 x ${hang} = ${4 * hang} <br>
	</c:forEach>
	
	<hr>

	<%-- 구구단을 2~9단까지 출력하는데, 짝수단만 출력한다. (jstl) --%>
	<h4>EL JSTL 구구단 짝수단</h4>
	<c:forEach var="dan" begin="2" end="9">
		<c:if test="${dan % 2 == 0}">
			<h4>구구단 ${dan}단</h4>
			<c:forEach var="hang" begin="1" end="9">
				${dan} x ${hang} = ${dan * hang} <br>
			</c:forEach>
			${'------------------'}
		</c:if>
	</c:forEach>
	
	<hr>
	
	<h2>배열이나 컬렉션 내부의 값을 출력</h2>
	
	<c:set var="arr" value="<%=new int[] {1, 3, 5, 7, 9} %>" />
	
	<c:forEach var="n" items="${arr}">
		${n} &nbsp;
	</c:forEach> 
	<%--
		Java 문법으로 사용 시 
		for(int n : arr) {
			out.print(n + " ");
		}
	 --%>
	
</body>
</html>