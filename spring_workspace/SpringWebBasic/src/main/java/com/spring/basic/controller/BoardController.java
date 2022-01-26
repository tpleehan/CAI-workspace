package com.spring.basic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.basic.model.BoardVO;
import com.spring.basic.service.IBoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private IBoardService service;

	// 글 작성 화면 요청 메서드
	@GetMapping("/write")
	public void write() {
		System.out.println("/board/write: GET");
	}

	/**
	 * 메서드명: write()
	 * 작성된 글을 DB에 등록 후 /board/list.jsp 파일로 응답할 수 있도록 처리
	 * (글 목록 보여주는 요청이 자동으로 들어오도록 처리)
	 */
	// 작성된 글 등록 처리 요청
	@PostMapping("/write")
	public String write(BoardVO vo) {
		System.out.println("/board/write: POST");
		service.insertArticle(vo);
		return "redirect:/board/list";
	}

	/**
	 * 메서드 이름 -> list()
	 * DB 대용 리스트에서 가지고 온 글 목록을 list.jsp 파일로 전달해서 브라우저에 글 목록을 띄운다.
	 * 글 목록은 table을 사용해서 간단히 만든다. (글 번호는 인덱스 이용)
	 * 번호 제목 작성자 비고 4개의 열을 생성 (맨 밑에 글쓰기 창으로 가는 링크 생성)
	 */
	// 글 목록 화면 요청
	@GetMapping("/list")
	public void list(Model model) {
		System.out.println("/board/list: GET");
		model.addAttribute("articles", service.getArticles());
	}

}
