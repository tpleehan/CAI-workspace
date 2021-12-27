<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// post로 전달 받을 때 다른 언어가 있을 경우 깨지는 경우가 있어서 습관처럼 선언한다.
   	request.setCharacterEncoding("utf-8"); 
   
   	String id = request.getParameter("id");
   	String pw = request.getParameter("pw");
   	
  		if (id.equals("abc1234") && pw.equals("aaa1111")) {
   		Cookie loginCoo = new Cookie("login_cookie", id);
		// 쿠키를 무한으로 주고 싶을 땐 -1을 주면 된다. ex) setMaxAge(-1)
   		loginCoo.setMaxAge(5);
   		response.addCookie(loginCoo);
   		
   		if (request.getParameter("id_remeber") != null) {
	   		Cookie idMemory = new Cookie("remember_id", id);
	   		idMemory.setMaxAge(30);
    		response.addCookie(idMemory);
   			
   		}
   		
   		response.sendRedirect("cookie_welcome.jsp");
   		
   	} else {
   		response.sendRedirect("cookie_login.jsp");
   		
   	}
%>
