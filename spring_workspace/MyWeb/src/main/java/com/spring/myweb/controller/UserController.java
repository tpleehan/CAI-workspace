package com.spring.myweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myweb.command.UserVO;
import com.spring.myweb.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	// 회원가입 페이지 이동
	@GetMapping("/userJoin")
	public void userJoin() {}
	
	// 아이디 중복 확인(비동기)
	@ResponseBody // RestController가 아닌 경우 ResponseBody 어노테이션을 붙여야 비동기 통신이 가능하다.
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		int result = service.idCheck(userId);
		if(result == 1) {
			return "duplicated";
			
		} else {
			return "ok";
			
		}
		
	}
	
	// 회원 가입 처리
	@PostMapping("/join")
	public String join(UserVO vo, RedirectAttributes ra) {
		System.out.println("param: " + vo);
		service.join(vo);
		ra.addFlashAttribute("msg", "joinSuccess");
		
		return "redirect:/user/userLogin";
	}
	
	// 로그인 페이지 이동 요청
	@GetMapping("/userLogin")
	public void userLogin() {}
	
	// 로그인 요청
	@PostMapping("/login")
	public String login(String userId, String userPw, Model model) {
		UserVO vo = service.login(userId, userPw);
		model.addAttribute("user", vo);
		
		return "/user/userLogin";
	}
	
	
	
	
}
