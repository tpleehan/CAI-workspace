package com.spring.myweb.controller;

import javax.servlet.http.HttpSession;

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
import com.spring.myweb.util.MailSendService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	@Autowired
	private MailSendService mailService;
	
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
	
	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
//		System.out.println("이메일 인증 요청");
//		System.out.println("인증 이메일: " + email);
		
		return mailService.joinEmail(email);
		
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
	
	// userMyPage 이동 요청
	@GetMapping("/userMyPage")
	public void userMyPage(HttpSession session, Model model) {
		
		// 세션 데이터에서 id를 가지고 와서 sql문을 작성할 수 있다.
		String id = ((UserVO) session.getAttribute("login")).getUserId();
		
		UserVO userInfo = service.getInfo(id);
		
		model.addAttribute("userInfo", userInfo);
		
	}
	
	// 마이페이지 수정 처리
	@PostMapping("/userUpdate")
	public String userUpdate(UserVO vo, RedirectAttributes ra) {
		System.out.println("마이페이지 수정처리");
		System.out.println("param: " + vo);
		service.updateUser(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		
		return "redirect:/user/userMyPage";
	}
	
	
}
