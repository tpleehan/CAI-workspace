package com.spring.db.commons;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.spring.db.model.BoardVO;

public class BoardMapper implements RowMapper<BoardVO> {

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
