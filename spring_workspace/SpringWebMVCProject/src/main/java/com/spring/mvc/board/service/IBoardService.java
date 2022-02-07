package com.spring.mvc.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.mvc.board.commons.PageVO;
import com.spring.mvc.board.commons.SearchVO;
import com.spring.mvc.board.model.BoardVO;

public interface IBoardService {

	// 게시글 등록 기능
	void insert(BoardVO article);
	
	// 게시글 전체 조회 기능
	List<BoardVO> getArticleList(SearchVO search);
//	List<BoardVO> getArticleList(PageVO paging, String keyword, String condition);
	
	// 게시글 상세 조회 기능
	BoardVO getArticle(int boardNo);

	// 게시글 수정 기능
	void update(BoardVO article);

	// 게시글 삭제 기능
	void delete(int boardNo);
	
	// 게시물 수 조회 기능
	// 검색 결과에 따라 게시물 수를 리턴할 수 있어야 하기 때문에 검색 결과를 품고 있는 SearchVO를 매개값으로 받는다.
	int countArticles(SearchVO search);
	
	/*
	// @Param을 이용한 게시물 수 조회 기능
	int countArticles(@Param("keyword") String keyword, 
					@Param("title") String title);
					
	int countArticles();
	*/

}
