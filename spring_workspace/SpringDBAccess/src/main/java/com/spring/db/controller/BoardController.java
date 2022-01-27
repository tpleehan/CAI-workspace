package com.spring.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.db.model.BoardVO;
import com.spring.db.service.IBoardService;

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

	// 작성된 글 등록 처리 요청
	@PostMapping("/write")
	public String write(BoardVO vo) {
		System.out.println("/board/write: POST");
		service.insertArticle(vo);
		return "redirect:/board/list";
	}

	// 글 목록 화면 요청
	@GetMapping("list")
	public void list(Model model) {
		System.out.println("/board/list: GET");
		model.addAttribute("articles", service.getArticles());
	}

	// 글 내용 상세보기 요청 처리 메서드
	@GetMapping("/content")
	public void content(@ModelAttribute("boardNo") int boardNo, Model model) {
		System.out.println("/board/content?boardNo=" + boardNo);
		model.addAttribute("article", service.getArticle(boardNo));
	}
	
	// 글 수정 화면 이동 요청
	@GetMapping("/modify")
	public void modify(@ModelAttribute("boardNo") int boardNo, Model model) {
		System.out.println("/board/modify?boardNo=" + boardNo );
		model.addAttribute("article", service.getArticle(boardNo));
	}
	
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
