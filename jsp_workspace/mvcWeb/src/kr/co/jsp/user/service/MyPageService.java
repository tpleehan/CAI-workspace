package kr.co.jsp.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.board.model.BoardDAO;
import kr.co.jsp.board.model.BoardVO;
import kr.co.jsp.user.model.UserVO;

public class MyPageService implements IUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserVO vo = (UserVO) request.getSession().getAttribute("user");
		String id = vo.getId();
		String category = "writer";
		
		List<BoardVO> list = BoardDAO.getInstance().searchBoard(id, category);
		request.setAttribute("myInfoList", list);
		
	}

}
