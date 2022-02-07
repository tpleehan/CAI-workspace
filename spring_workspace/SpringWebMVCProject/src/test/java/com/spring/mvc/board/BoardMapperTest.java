package com.spring.mvc.board;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mvc.board.model.BoardVO;
import com.spring.mvc.board.repository.IBoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class BoardMapperTest {

	// test는 main과 별개의 모듈이기 때문에 xml 설정을 끌고 와야 @Autowired를 적용 시킬 수 있다. 
	@Autowired
	private IBoardMapper mapper;
	
	// 게시글 등록 단위 테스트
	@Test
	public void insertTest() {
		for (int i = 1; i <= 300; i++) {
			BoardVO article = new BoardVO();
			article.setTitle("테스트 제목입니다." + i);
			article.setWriter("김테스트" + i);
			article.setContent("테스트 내용입니다." + i);
			mapper.insert(article);
		}
		
	}
	
	/*
	// 게시글 목록 전체 조회 테스트
	// 게시글 개수 몇개인지 출력하고 게시글 모든 내용을 toString()으로 출력
	@Test
	public void getArticleListTest() {
		List<BoardVO> list = mapper.getArticleList();

		for (BoardVO vo : list) {
			System.out.println(vo);
		}
	}
	*/
	
	// 게시글 단일 조회 테스트
	// 44번 글을 조회하고 글 상세 내용을 출력
	@Test
	public void getArticleTest() {
		BoardVO vo = mapper.getArticle(44);
		System.out.println(vo);
	}
	
	// 게시글 수정 테스트
	// BoardVO 객체를 하나 생성하고 VO의 setter를 사용하여 
	// 수정 내용(글 제목, 글 내용)을 입력하고 수정을 진행 (1번글의 제목, 내용 수정하기)
	@Test
	public void updateTest() {
		BoardVO vo = new BoardVO();
		vo.setBoardNo(1);
		vo.setTitle("수정된 제목 수정");
		vo.setContent("수정입니다. 수정합니다.");
		mapper.update(vo);
		System.out.println("수정 후 정보: " + mapper.getArticle(1));
	}
	
	// 게시글 삭제 테스트
	// 3번글을 삭제하고 삭제 후 상세보기를 통해 3번글을 가져 왔을 때 
	// null이 리턴 되는지 조건문으로 확인해서 결과를 출력 (null이 리턴 되면 삭제 성공, 게시글 없음)
	@Test
	public void deleteTest() {
		mapper.delete(3);
		if (mapper.getArticle(3) == null) {
			System.out.println("삭제 성공, 게시글 없음");
		} else {
			System.out.println("삭제 실패");
		}
	}
	
	
}