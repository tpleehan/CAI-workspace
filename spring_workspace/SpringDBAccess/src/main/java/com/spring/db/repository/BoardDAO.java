package com.spring.db.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spring.db.commons.BoardMapper;
import com.spring.db.model.BoardVO;

@Repository
public class BoardDAO implements IBoardDAO {

	@Autowired
	private JdbcTemplate template;
	
	@Override
	public void insertArticle(BoardVO vo) {
		String sql = "INSERT INTO jdbc_board VALUES(bid_seq.NEXTVAL, ?, ?, ?)";
		
		template.update(sql, vo.getWriter(), vo.getTitle(), vo.getContent());

	}

	@Override
	public List<BoardVO> getArticles() {
		
		String sql = "SELECT * FROM jdbc_board ORDER BY board_no ASC";
		return template.query(sql, (rs, rowNum) -> {
			BoardVO vo = new BoardVO();
			vo.setBoardNo(rs.getInt("board_no"));
			vo.setWriter(rs.getString("writer"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			
			return vo;
		});
		
	}

	@Override
	public BoardVO getArticle(int bId) {
		String sql = "SELECT * FROM jdbc_board WHERE board_no = ?";
				
		try {
			return template.queryForObject(sql, new BoardMapper(), bId);
			
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void deleteArticle(int bId) {
		String sql = "DELETE FROM jdbc_board WHERE board_no = ?";
		template.update(sql, bId);

	}

	@Override
	public void updateArticle(BoardVO vo, int bId) {
		String sql = "UPDATE jdbc_board SET writer = ?, title = ?, content = ? WHERE board_no = ?";
		template.update(sql, vo.getWriter(), vo.getTitle(), vo.getContent(), bId);
	}

}
