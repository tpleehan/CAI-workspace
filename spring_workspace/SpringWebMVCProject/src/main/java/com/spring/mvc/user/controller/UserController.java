package com.spring.mvc.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.mvc.user.model.UserVO;
import com.spring.mvc.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;

	@PostMapping("/checkId")
	public String checkId(@RequestBody String account) {
		System.out.println("/user/checkId: POST");
		System.out.println("param: " + account);
		
		int checkNum = service.checkId(account);
		
		if (checkNum == 1) {
			System.out.println("아이디 중복");
			return "duplicated";
		} else {
			System.out.println("아이디 사용 가능");
			return "available";
		}
		
	}
	
	// @RequestParam은 get방식
	// 회원 가입 요청 처리
	@PostMapping("/")
	public String register(@RequestBody UserVO vo) {
		System.out.println("/user/: POST");
		service.register(vo);
		
		return "joinSuccess";
	}
	
	// 로그인 요청 처리
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestBody UserVO vo, /* 1. HttpServletRequest request */
								HttpSession session) {
		System.out.println("/user/loginCheck: POST");
		System.out.println("param: " + vo);
		
		// 서버에서 세션 객체를 얻는 방법
		// 1. HttpServletRequest 객체 사용
		// HttpSession session = request.getSession();
		
		// 2. 매개값으로 HttpSession 객체를 받아서 사용
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		UserVO dbData = service.selectOne(vo.getAccount());
		
		if (dbData != null) {
			System.out.println("dbData : " + dbData);
			if (encoder.matches(vo.getPassword(), dbData.getPassword())) {
				// 로그인 성공 회원을 대상으로 세션 정보 생성
				session.setAttribute("login", dbData);
				return "loginSuccess";
			} else {
				return "pwFail";
			}
		} else {
			return "idFail";
		}
		
	}
 	
}
