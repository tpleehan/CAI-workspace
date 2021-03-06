package kr.co.jsp.board.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.board.model.BoardDAO;

public class UpdateService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("text/html; charset=UTF-8");
		
		String title = request.getParameter("bTitle");
		String content = request.getParameter("bContent");
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		
		try {
			PrintWriter out = response.getWriter();
			
			String htmlCode = "<script>\r\n" +
									"alert('게시물이 정상적으로 수정되었습니다.');\r\n" +
									"location.href='/mvcWeb/listPage.board';\r\n" +
							   "</script>" ;
			out.print(htmlCode);
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		BoardDAO.getInstance().updateBoard(title, content, bId);
	}

}
