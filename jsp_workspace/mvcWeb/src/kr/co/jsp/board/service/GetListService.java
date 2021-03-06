package kr.co.jsp.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.board.commons.PageCreator;
import kr.co.jsp.board.commons.PageVO;
import kr.co.jsp.board.model.BoardDAO;
import kr.co.jsp.board.model.BoardVO;

public class GetListService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO dao = BoardDAO.getInstance();
		PageVO paging = new PageVO();
		
		if (request.getParameter("page") != null) {
			paging.setPage(Integer.parseInt(request.getParameter("page")));
			paging.setCountPerPage(Integer.parseInt(request.getParameter("countPerPage")));
			
		}
		
		List<BoardVO> boardList = dao.listBoard(paging);
		
		PageCreator pc = new PageCreator();
		pc.setPaging(paging);
		pc.setAticleTotalCount(dao.countAticles());
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("pc", pc);
		
	}

}
