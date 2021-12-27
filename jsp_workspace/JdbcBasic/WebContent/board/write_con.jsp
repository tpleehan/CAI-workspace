<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@page import="kr.co.jsp.board.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
	 * 1. 사용자의 입력값을 가져온다. 그리고 객체로 포장한다.
	 * 2. DAO클래스의 주소값을 받아 DB에 내용을 삽입하는 메서드를 호출한다.
	 *    (board_id -> 시퀀스 객체로 삽입, 날짜는 넣어줄 필요가 없다.)
	 * 3. 글 등록 성공 시 list.jsp로 리다이렉팅,
	 * 4. 글 등록 실패 시 write.jsp로 리다이렉팅 한다.
	 */
	
	request.setCharacterEncoding("utf-8");

 	BoardVO vo = new BoardVO();
 	vo.setWriter(request.getParameter("writer"));
 	vo.setTitle(request.getParameter("title"));
 	vo.setContent(request.getParameter("content"));
	
 	if (BoardDAO.getInstance().insert(vo)) {
 		response.sendRedirect("list.jsp");
 		
 	} else {
 		response.sendRedirect("write.jsp");
 		
 	}
 	
%>