<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
     response.setHeader("Cache-control", "no-store"); // HTTP 1.1 방식 캐시메모리를 사용하지 않는다.
	 response.setHeader("Pragma", "no-cache"); // HTTP 1.0 방식 캐시메모리를 사용하지 않는다.
	 response.setDateHeader("Expires", 0);
 
     /*
      * 1. 로그인 하지 않은 사용자가 주소창에 이 페이지의 URL을 적고
      *    들어오는 경우 로그인 창으로 돌려보내는 코드를 작성
      *
      * 2. 로그인 한 회원의 아이디와 별명을 통해 "nick(id)님 환영합니다!" 를 출력
      *
      * 3. 로그인 화면으로, 로그아웃하기 (logout.jsp),
      *    회원 탈퇴하기(delete.jsp) 로 이동할 수 있는 링크를 제공
      *    회원탈퇴는 deleteUser(???)라는 이름으로 UserRepository에 메서드 선언.
      *    리스트에서 해당 아이디에 부합하는 User객체를 찾은 후 리스트 문법으로 해당 객체의
      *    주소값을 지워주고 세션 데이터도 삭제
      *
      * 4. 로그인 폼 제공하는 페이지에도, 로그인 중인 사용자와 아직 로그인을 하지 않은
      *    사용자가 서로 다른 페이지를 볼 수 있도록 로직을 작성
      *    (로그인-> 이미 로그인 중이라는 페이지, 로그인x -> 폼)
      */
      
      User user = (User) session.getAttribute("login");
     
     %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<% if (user != null) { %>
		
		<h2><%=user.getNickName() %>(<%=user.getAccount() %>)님 환영합니다.</h2>
		<a href="login_form.jsp">로그인 화면으로 돌아가기</a> <br>
		<a href="logout.jsp">로그아웃</a> <br>
		<a href="delete.jsp">회원 탈퇴하기</a>
	 
	<% } else { %>
		<script>
			alert("로그인이 필요합니다.");
			location.href="login_form.jsp";
		</script>
	<% } %>

</body>
</html>