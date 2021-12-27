<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@page import="kr.co.jsp.board.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
	 * - 수정에 필요한 파라미터값을 불러와서 그것을 토대로 BoardVO 객체를 생성(제목, 내용)
	 *
	 * - BoardDAO의 update()를 이용하여 수정한 객체를 DB에 적용하고
	 *   결과가 성공하면 해당 글 상세보기 페이지로 이동시킨다.
	 *   결과가 실패하면 list.jsp로 리다이렉팅 한다.
	 */
	 
	request.setCharacterEncoding("utf-8");

 	BoardVO vo = new BoardVO();
 	vo.setBoardId(Integer.parseInt(request.getParameter("bId")));
 	vo.setTitle(request.getParameter("title"));
 	vo.setContent(request.getParameter("content"));
 	
 	if (BoardDAO.getInstance().update(vo)) {
 		response.sendRedirect("content.jsp?bId=" + vo.getBoardId());
 		
 	} else {
 		response.sendRedirect("list.jsp");
 		
 	}

%>