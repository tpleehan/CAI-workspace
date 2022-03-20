package com.spring.dct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index() {
		System.out.println("메인 화면 - index");
		return "index";
	}
	
	@RequestMapping("/chatting")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chatting");
		return mv;
	}

}
