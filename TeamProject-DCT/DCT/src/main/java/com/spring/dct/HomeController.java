package com.spring.dct;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dct.lecture.service.ILectureService;
import com.spring.dct.util.PageCreator;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.OnlineLectureUplaodVO;

@Controller
public class HomeController {

	@Autowired
	private ILectureService service;

	@RequestMapping("/chatting")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chatting");
		return mv;
	}
	
	@GetMapping("/")
	public String lectureIndex(PageVO page, Model model) {
		System.out.println("메인페이지");
		
		PageCreator pc = new PageCreator();
		
		List<OnlineLectureUplaodVO> list = new ArrayList<>();
		list = service.getList(page);
		
		model.addAttribute("lectureList", list);
		model.addAttribute("p", pc);
		
		return "index";
		
	}
	
}
