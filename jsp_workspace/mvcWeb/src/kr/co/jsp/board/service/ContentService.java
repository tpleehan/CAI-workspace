package kr.co.jsp.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.board.model.BoardDAO;
import kr.co.jsp.board.model.BoardVO;

public class ContentService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		BoardVO vo = BoardDAO.getInstance().contentBoard(bId);
		
		vo.setContent(vo.getContent().replace("\r\n", "<br>"));

		request.setAttribute("content", vo);
	}

}
