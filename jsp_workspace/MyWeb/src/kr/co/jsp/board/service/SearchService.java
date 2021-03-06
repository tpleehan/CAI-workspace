package kr.co.jsp.board.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.board.model.BoardDAO;
import kr.co.jsp.board.model.BoardVO;

public class SearchService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String keyword = request.getParameter("search");
		String category = request.getParameter("category");
		
		List<BoardVO> list = BoardDAO.getInstance().searchBoard(keyword, category); 
		/*
		if (list.size() == 0) {
			// 검색 결과가 없으면 searchFail로 보낸다.
			request.setAttribute("searchFail", true);
		} else {
			// 검색 결과를 board.list에 활용하기 위해 boardList로 재활용할 수 있다.
			request.setAttribute("boardList", list);
		}
		 */
		
		if (list.size() == 0) {
			// 자바 클래스에서 HTML이나 JS 문법을 사용하는 방법: PrintWriter 객체 사용
			response.setContentType("text/html; charset=UTF-8");
			
			try {
				PrintWriter out = response.getWriter();
				
				// 원하는 HTML / JS 코드를 문자열 형태로 작성한다.
				String htmlCode = "<script> \r\n" + 
									"alert('검색 결과에 따른 게시물이 없습니다.'); \r\n" +
									"location.href='/MyWeb/list.board'; \r\n" +
								  "</script>";
				out.print(htmlCode);
				
				out.flush(); // 버퍼에 저장되어 있는 내용을 클라이언트로 전송하고 버퍼를 비운다.
				
				return;
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		request.setAttribute("boardList", list);
		
	}

}
