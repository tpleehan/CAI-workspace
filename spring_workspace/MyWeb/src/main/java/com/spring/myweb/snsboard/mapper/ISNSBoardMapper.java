package com.spring.myweb.snsboard.mapper;

import java.util.List;

import com.spring.myweb.command.SNSBoardVO;
import com.spring.myweb.util.PageVO;

public interface ISNSBoardMapper {

	// 글 등록
	void insert(SNSBoardVO vo);
	
	// 글 목록
	List<SNSBoardVO> getList(PageVO paging);
	
	// 글 상세보기
	SNSBoardVO getDetail(int bno);
	
	// 글 삭제
	void delete(int bno);
	
}
