package com.spring.dct.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dct.mentoring.service.IMentoringService;
import com.spring.dct.util.PageCreator;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.MentoringsVO;



@Controller
@RequestMapping("/lecture")
public class MentoringController {

	@Autowired
	private IMentoringService service;
	
	
	//강의 수강평 화면 처리
	@GetMapping("/mentoringWrite")
	public void mentoringWrite() {
		System.out.println("/lecture/mentoringWrite: GET");
	}
	
	//멘토링 리스트 화면
	@GetMapping("/mentoringPage")
	public String mentoringPage(PageVO vo, Model model) {
		System.out.println("/lecture/mentoringPage: GET");
		
		System.out.println("페이지 번호: " + vo.getPageNum());
		System.out.println("검색어: " + vo.getKeyword());
		System.out.println("검색조건: " + vo.getCondition());
		System.out.println("categoryNum: " + vo.getCategoryNum());
		
		
		PageCreator pc = new PageCreator();
		
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		
		System.out.println(pc);
		
		List<MentoringsVO> list = new ArrayList<>();
		list = service.getList(vo);
		System.out.println(list);
		
		for(MentoringsVO up : list) {
			System.out.println(up.toString());
		}
		
		model.addAttribute("mentoringList", list);
		model.addAttribute("pc", pc);
		
		return "lecture/mentoringPage";
		
	}
	

	//멘토링 상세 화면
	@GetMapping("/mentoringDetail")
	public void mentoringDetailPage(int mentoringNo, @ModelAttribute("p") PageVO vo, Model model) {
		System.out.println("/lecture/lectureDetailPage: GET");
		
		model.addAttribute("mentoringArticle", service.getContent(mentoringNo));
		
		
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
