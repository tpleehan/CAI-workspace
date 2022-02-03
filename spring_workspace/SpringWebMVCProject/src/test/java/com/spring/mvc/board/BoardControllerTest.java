package com.spring.mvc.board;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml", 
								   "file:src/main/webapp/WEB-INF/spring/servlet-config.xml"})
@WebAppConfiguration
@Log4j
public class BoardControllerTest {
	
	// 테스트 환경에서 가상의 DispatcherServlet을 사용하기 위한 객체 자동 주입
	// WebApplicationContext: Spring에서 제공되는 여러 servlet을 사용할 수 있도록 정보를 저장하는 객체
	@Autowired
	private WebApplicationContext ctx;

//	@Autowired
//	private BoardController controller;
	
	// MockMvc: 웹 어플리케이션을 서버에 배포하지 않아도 스프링 MVC 동작을 구현할 수 있는 가상의 구조를 만들어 준다.
	private MockMvc mockMvc;

	@Before
	public void setUp() {
		// 가상 구조 세팅
		// 스프링 컨테이너에 등록된 모든 빈과 의존성 주입까지 로드해서 사용이 가능하다.
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
		// 테스트할 컨트롤러를 수동으로 주입. 
		// 하나의 컨트롤러만 테스트를 진행할 때 사용한다.
//		this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	@Test
	public void testInsert() throws Exception {
		String viewPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/write")
										.param("title", "테스트 새 글 제목")
										.param("content", "테스트 새 글 내용")
										.param("writer", "user01")
										).andReturn().getModelAndView().getViewName();
		log.info(viewPage);
		
	}
	
	// 게시글 상세보기 요청 넣어보기.
	// 컨트롤러에서는 DB에서 가지고 온 글 객체를 model에 담아서 jsp로 이동시킨다.
	// 42번글을 보여달라는 요청을 넣고, 요청 결과가 들어있는 model을 출력한다.
	// /board/content -> get
	@Test
	public void testContent() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/content")
						.param("boardNo", "42")
						).andReturn().getModelAndView().getModelMap()
				);
	}
	
	// 5번글의 제목과 내용을 수정하는 요청을 보낸다.
	// 전송방식은 post 수정 후 이동하는 페이지는 해당 글의 상세보기 페이지
	// 컨트롤러가 리턴하는 viewName을 출력한다. ("/board/modify")
	@Test
	public void testModify() throws Exception {
		String viewName = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
							.param("title", "수정된 테스트 수정 글 제목2")
							.param("content", "수정된 테스트 수정 글 내용2")
							.param("boardNo", "5")
							).andReturn().getModelAndView().getViewName();
		log.info(viewName);
	}
	
	// 42번글을 삭제한다.
	// 전송 방식은 post방식이고, 이동하는 곳은 목록 요청이 재요청되고 viewName을 출력한다.
	@Test
	public void testRemove() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/board/delete")
						.param("boardNo", "42")).andReturn().getModelAndView().getViewName()
				);
		
	}
	
}
