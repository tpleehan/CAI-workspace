package com.spring.myweb.snsboard.service;

import java.util.List;

import com.spring.myweb.command.SNSBoardVO;

public interface ISNSBoardService {
	
	// 글 등록
	void insert(SNSBoardVO vo);
	
	// 글 목록
	List<SNSBoardVO> getList();
	
	// 글 상세보기
	SNSBoardVO getDetail(int bno);
	
	// 글 삭제
	void delete(int bno);

}
