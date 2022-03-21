package com.spring.dct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dct.freeboard.service.IFreeBoardService;
import com.spring.dct.util.PageCreator;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.CommunitiesVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private IFreeBoardService service;

	// 목록 화면
	@GetMapping("/freeBoardList")
	public String freeBoardList(PageVO vo, Model model) {

		System.out.println("검색어: " + vo.getKeyword());
		System.out.println("검색 조건: " + vo.getCondition());

		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));

		System.out.println(pc);

		model.addAttribute("boardList", service.getList(vo));
		model.addAttribute("pc", pc);

		System.out.println(service.getList(vo));

		return "board/freeBoardList";
	}

	// 글쓰기 화면 처리
	@GetMapping("/freeBoardRegist")
	public String freeBoardRegist() {
		return "board/freeBoardRegist";
	}

	// 글 등록 처리
	@PostMapping("/registForm")
	public String registForm(CommunitiesVO vo, RedirectAttributes ra) {
		service.regist(vo);

		ra.addFlashAttribute("msg", "정상 등록 처리 되었습니다.");

		return "redirect:/board/freeBoardList";
	}

	// 글 상세보기 처리
	@GetMapping("/freeBoardDetail")
	public void getContent(@RequestParam("bno") int bno, @ModelAttribute("p") PageVO vo, Model model) {
		model.addAttribute("article", service.getContent(bno));
	}

	// 글 수정 페이지 이동 처리
	@GetMapping("/freeBoardModify")
	public void modify(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("article", service.getContent(bno));
	}

	// 글 수정 처리
	@PostMapping("/freeBoardUpdate")
	public String freeBoardUpdate(CommunitiesVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg", "updateSuccess");

		return "redirect:/board/freeBoardDetail?communityNo=" + vo.getCommunityNo();
	}

	// 글 삭제 처리
	@PostMapping("/freeBoardDelete")
	public String freeBoardDelete(CommunitiesVO vo, RedirectAttributes ra) {
		service.delete(vo.getCommunityNo());

		ra.addFlashAttribute("msg", "게시글이 정상 삭제 되었습니다.");
		return "redirect:/board/freeBoardList";
	}

}
