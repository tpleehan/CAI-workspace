<%@page import="kr.co.jsp.user.model.UserVO"%>
<%@page import="kr.co.jsp.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	request.setCharacterEncoding("utf-8");

	String id = ((UserVO) session.getAttribute("user")).getId();
	String pw = request.getParameter("check_pw");

	UserDAO dao = UserDAO.getInstance();
	
	if (dao.userCheck(id, pw) == 0) {
%>	
		<script>
			alert("비밀번호가 일치하지 않습니다.")
			location.href="user_mypage.jsp";
		</script>
<%
	} else {
		dao.deleteUser(id);
		session.invalidate();
%>
		<script>
			alert("회원 탈퇴가 정삭적으로 처리 되었습니다.")
			location.href="/MyWeb"
		</script>
<%
	}
%>
	
	
	
