 package com.spring.mvc.board.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.spring.mvc.board.commons.PageVO;
import com.spring.mvc.board.commons.SearchVO;
import com.spring.mvc.board.model.BoardVO;

// 게시판 관련 CRUD 추상 메서드 선언
public interface IBoardMapper {

	// 게시글 등록 기능
	void insert(BoardVO article);
	
	/*
	 * # MyBatis로 DB연동을 진행할 때 파라미터 값이 2개 이상인 경우
	 * 1. @Param을 이용해서 작성
	 * 2. Map으로 포장해서 보내기
	 * 3. 객체 하나를 매개값으로 보내기
	 * 
	 * 적절히 상황에 맞춰 선택한다.
	 게시글 전체 조회 기능
	 List<BoardVO> getArticleList(PageVO paging, String keyword, String condition);
	
	// @Param을 이용한 매개값 전달 방식
	// @Param("xml파일 내에서 사용할 이름") 매개변수
	List<BoardVO> getArticleList(@Param("paging") PageVO paging,
								@Param("keword") String keyword,
								@Param("condition") String condition);
								
	// 여러 개의 파라미터를 Map으로 포장해서 보내는 방식
	// <key, value> key: xml파일에서 사용할 이름, value: 값(Object타입)
	List<BoardVO> getArticleList(Map<String, Object> datas);
	 */
	
	// 검색 결과와 페이지 정보까지 가지고 있는 하나의 객체를 매개값으로 받는 방식
	List<BoardVO> getArticleList(SearchVO search);
	
	// 게시글 상세 조회 기능
	BoardVO getArticle(int boardNo);
	
	// 게시글 수정 기능
	void update(BoardVO article);
	
	// 게시글 삭제 기능
	void delete(int boardNo);
	
	// 게시물 수 조회 기능
	int countArticles(SearchVO search);
	
	/*
	int countArticles(@Param("keyword") String keyword,
						@Param("title") String title);
						
	int countArticles();
	*/

}
