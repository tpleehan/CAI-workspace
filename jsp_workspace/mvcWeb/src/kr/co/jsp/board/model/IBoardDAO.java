package kr.co.jsp.board.model;

import java.util.List;

import kr.co.jsp.board.commons.PageVO;

public interface IBoardDAO {

	void regist(String writer, String title, String content);
	
	List<BoardVO> listBoard(PageVO paging);
	
	BoardVO contentBoard(int bId);
	
	void updateBoard(String title, String content, int bId);
	
	List<BoardVO> searchBoard(String keyword, String category);
	
	void deleteBoard(int bId);
	
	int countAticles();
	
}
