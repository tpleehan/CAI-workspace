<%@page import="kr.co.jsp.user.model.UserVO"%>
<%@page import="kr.co.jsp.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	
	UserDAO dao = UserDAO.getInstance();
	
	if(dao.confirmId(id)) { // 아이디 중복 발생 
%>		
		<script>
			alert("아이디가 중복되었습니다.")
			history.back();
		</script>
<%
	} else { // 아이디가 중복되지 않을 경우 
		// 회원 가입 처리
		UserVO vo = new UserVO (
					id,
					request.getParameter("pw"),
					request.getParameter("name"),
					request.getParameter("email"),
					request.getParameter("address")
				);
		
		dao.insertUser(vo);
%>		
		<script>
			alert("회원가입이 완료 되었습니다.")
			location.href="user_login.jsp"
		</script>
<%
	}
%>

