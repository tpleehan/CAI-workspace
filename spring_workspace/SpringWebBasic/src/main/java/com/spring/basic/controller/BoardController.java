package com.spring.basic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	/**
	 * 메서드 이름 -> content, 요청 url -> /content
	 * DB 역할을 하는 리스트에서 글 번호에 해당하는 글 객체를 content.jsp로 보낸다.
	 * content.jsp에서 해당 글 정보를 모두 출력
	 */
	// 글 내용 상세보기 요청 처리 메서드
	@GetMapping("/content")
	public void content(@ModelAttribute("boardNo") int boardNo, Model model) {
		System.out.println("/board/content?boardNo=" + boardNo);
		model.addAttribute("article", service.getArticle(boardNo));
	}
	
	/**
	 * form 태그에 작성자, 제목, 내용을 수정할 수 있는 폼을 만들어서 수정
	 * 글 번호는 숨겨서 폼 데이터와 함께 보내야 한다.
	 */
	// 글 수정 화면 이동 요청
	@GetMapping("/modify")
	public void modify(@ModelAttribute("boardNo") int boardNo, Model model) {
		System.out.println("/board/modify?boardNo=" + boardNo );
		model.addAttribute("article", service.getArticle(boardNo));
	}
	
	/**
	 * modify.jsp를 생성해서 form태그에 사용자가 처음에 작성했던 내용이 드러나도록 배치 후 수정을 받는다.
	 * 수정 처리하는 메서드: modify(), 요청 url: /modify -> POST
	 * 수정 처리 완료 이후 방금 수정한 글의 상세보기 요청이 다시 들어올 수 있도록 작성
	 */
	// 글 수정 처리 요청
	@PostMapping("/modify")
	public String modify(@RequestParam("boardNo") int boardNo, BoardVO vo) {
		System.out.println("/board/modify: POST " + boardNo);
		service.updateArticle(vo, boardNo);
		return "redirect:/board/content?boardNo=" + boardNo;
	}
	

	// 글 삭제 처리 요청 메서드
	@GetMapping("/delete")
	public String delete(@RequestParam("boardNo") int boardNo, RedirectAttributes ra) {
		System.out.println("/board/delete?boardNo=" + boardNo);
		service.deleteArticle(boardNo);
		ra.addFlashAttribute("msg", "delSuccess");
		
		return "redirect:/board/list";
	}
	
}
