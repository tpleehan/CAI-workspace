<%@page import="kr.co.jsp.score.model.ScoreDAO"%>
<%@page import="kr.co.jsp.score.model.ScoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	/*
	 * SQL문에서 LIKE 절을 사용할 때 %를 ?에 직접 붙이면 정상 동작이 안된다.
	 * ?를 채울 때 pstmt 객체의 setString()을 이용해서 채울 경우
	 * setString()은 ''를 자동으로 추가해 주기 때문에 %가 ''안으로 들어가지 못하는 상황이 발생한다.
	 * SQL에는 ?만 쓰고, ?를 채울 때 검색어에 미리 %를 앞, 뒤로 연결해서 채운다.
	 * (setString() 메서드 호출할 때 붙여도 된다.) 
	 */
	//String keyword = "%" + request.getParameter("keyword") + "%";
	String keyword = request.getParameter("keyword");
	
	ScoreDAO dao = ScoreDAO.getInstance();
	
	//List<ScoreVO> searchList = ScoreDAO.getInstance().seach(keyword);
	List<ScoreVO> scoreList = dao.seach(keyword);
	
	/*
     * DAO클래스에 search라는 이름의 메서드를 선언해서 검색 결과를 리턴
	 * 리턴된 결과를 테이블 형식으로 body 내부에 출력한다.
	 * 테이블 형식은 score_list.jsp에 있는 테이블을 참조한다.
	 *
	 * 검색 결과가 없다면 브라우저 화면에 테이블 대신 '검색 결과가 없습니다.' 라고 
	 * 출력하고 목록으로 돌아갈 수 있는 링크를 추가한다.
     */

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>검색 결과</h1>
	
	<form action="search.jsp">
		검색: <input type="text" name="keyword" placeholder="검색할 이름을 입력">
		<input type="submit" value="확인">
	</form>
	
	<% if (!scoreList.isEmpty()) { %>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
			<th>비고</th>
		</tr>
		<% for (ScoreVO vo : scoreList) { %>
			<tr>
				<td><%=vo.getId() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getKor() %></td>
				<td><%=vo.getEng() %></td>
				<td><%=vo.getMath() %></td>
				<td><%=vo.getTotal() %></td>
				<td><%=vo.getAverage() %></td>
				<td>
					<a href="delete.jsp?id=<%=vo.getId() %>">[삭제]</a>
				</td>
			</tr>
		<% } %>
	</table>
	<% } else { %>
		<h3> 검색 결과가 존재하지 않습니다.</h3>

	<% } %>
	
	<br>
	<a href="score_list.jsp">점수 목록 보기</a>
	
</body>
</html>