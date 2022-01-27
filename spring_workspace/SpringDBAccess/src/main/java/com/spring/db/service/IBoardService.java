package com.spring.db.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.db.model.BoardVO;

@Service
public interface IBoardService {

	// 게시글 등록
	void insertArticle(BoardVO vo);
	
	// 전체 게시글 목록 조회
	List<BoardVO> getArticles();
	
	// 게시글 상세보기
	BoardVO getArticle(int bId);
	
	// 게시글 삭제
	void deleteArticle(int bId);
	
	// 게시글 수정
	void updateArticle(BoardVO vo, int bId);
	
}
