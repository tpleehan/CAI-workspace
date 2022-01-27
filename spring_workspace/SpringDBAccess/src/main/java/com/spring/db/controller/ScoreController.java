package com.spring.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.db.model.ScoreVO;
import com.spring.db.service.IScoreService;

@Controller
@RequestMapping("/score")
public class ScoreController {

	// 빈으로 등록된 Service 객체를 new로 직접 생성하는 것이 아닌 자동 주입으로 사용
	@Autowired
	private IScoreService service;
	
	// 점수 등록 화면 요청 메서드
	@GetMapping("/register")
	public String register() {
		System.out.println("/score/register: GET");
		return "score/write-form";
	}
	
	// 점수 등록 요청 메서드
	@PostMapping("/register")
	public String register(ScoreVO vo) {
		System.out.println("/score/register: POST");
		System.out.println("param: " + vo);
		service.insertScore(vo);
		return "score/write-result";
	}
	
	// 점수 전체 조회 요청 메서드
	@GetMapping("list")
	public void list(Model model) {
		System.out.println("/score/list: GET");
//		List<ScoreVO> list = service.selectAllScores();
//		model.addAttribute("sList", list);
		model.addAttribute("sList", service.selectAllScores());
	}
	
	// 점수 삭제 요청 처리 메서드
	@GetMapping("/delete")
	public String delete(@RequestParam("stuNum") int stuNum, RedirectAttributes ra) {
		System.out.println("/delete 요청. 학번: " + stuNum);
		service.deleteScore(stuNum);
		ra.addFlashAttribute("msg", "delSuccess");
		
		return "redirect:/score/list";
	}
	
	// 점수 개별 조회 화면 요청 처리 메서드
	@GetMapping("/search")
	public void selectOne() {
		System.out.println("/score/search: GET");
	}

	// 점수 개별 조회 처리 메서드
	@GetMapping("/selectOne")
	public String selectOne(@RequestParam("stuNum") int stuNum, 
							RedirectAttributes ra, Model model) {
		
		System.out.println("/score/selectOne: GET");
		
		ScoreVO vo = service.selectOne(stuNum);

		if (vo == null) {
			ra.addFlashAttribute("msg", "검색 결과가 없습니다.");
			return "redirect:/score/search";
		}
		
		model.addAttribute("stu", vo);
		return "score/search-result";
		
	}
	
}
