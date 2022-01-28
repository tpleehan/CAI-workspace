package com.spring.db.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.db.commons.BoardMapper;
import com.spring.db.model.BoardVO;

@Repository
public class BoardDAO implements IBoardDAO {

	// 내부 클래스 선언
	class BoardMapper implements RowMapper<BoardVO> {
		
		@Override
		public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {

			BoardVO vo = new BoardVO();
			
			vo.setBoardNo(rs.getInt("board_no"));
			vo.setWriter(rs.getString("writer"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			
			return vo;
		}
	}

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
		
		/*
		내부 클래스 사용 시
		return template.query(sql, new BoardMapper());
		*/
		
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
		
		// queryForObject는 null 값 호출이 안되기 때문에 board_no의 null(없는 번호) 반환할 경우 try catch 사용
		return template.queryForObject(sql, new BoardMapper(), bId);
			
	}

	@Override
	public void deleteArticle(int bId) {
		String sql = "DELETE FROM jdbc_board WHERE board_no = ?";
		template.update(sql, bId);

	}

	@Override
	public void updateArticle(BoardVO vo) {
		String sql = "UPDATE jdbc_board SET writer = ?, title = ?, content = ? WHERE board_no = ?";
		template.update(sql, vo.getWriter(), vo.getTitle(), vo.getContent(), vo.getBoardNo());
	}
	
	@Override
	public List<BoardVO> searchList(String keyword) {
		
		String sql = "SELECT * FROM jdbc_board WHERE writer LIKE ?";
		
		return template.query(sql, new BoardMapper(), keyword);
		
	}

}
