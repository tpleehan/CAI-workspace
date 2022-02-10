package com.spring.mvc.user.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.resource.HttpResource;
import org.springframework.web.util.WebUtils;

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
								HttpSession session,
								HttpServletResponse response) {
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
	
				long limitTime = 60 * 60 * 24 * 90;
				
				// 자동 로그인 체크 시 처리해야 할 내용
				if (vo.isAutoLogin()) {
					// 자동 로그인을 희망하는 경우
					// 쿠키를 이용하여 자동 로그인 정보를 저장
					System.out.println("자동 로그인 쿠키 생성 중");
					// 세션 아이디를 가지고 와서 쿠키에 저장(고유한 값이 필요하기 때문)
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/"); // 쿠키가 동작할 수 있는 유효한 url
					loginCookie.setMaxAge((int) limitTime);
					
					// 응답 객체에 쿠키 전달
					response.addCookie(loginCookie);
					
					// 자동 로그인 유지 시간을 날짜 객체로 변환 (DB에 삽입하기 위해, 밀리초)
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					// Date 객체의 생성자에 매개값으로 밀리초의 정수를 전달하면 날짜 형태로 변경해 준다.
					Date limitDate = new Date(expiredDate);
					
					System.out.println("자동 로그인 만료 시간: " + limitDate);
					
					service.keepLogin(session.getId(), limitDate, vo.getAccount());
				}
				
				return "loginSuccess";
				
			} else {
				return "pwFail";
				
			}
			
		} else {
			return "idFail";
			
		}
		
	}
	
	// 로그아웃 요청 처리
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes ra, 
								HttpServletRequest request, HttpServletResponse response) {
		System.out.println("/user/logout: GET");
		
		UserVO user = (UserVO) session.getAttribute("login");
		
//		session.invalidate();
		session.removeAttribute("login");
		
		/*
		 * 자동 로그인 쿠키 확인 여부(없는 사람도 있음)
		 * 쿠기가 존재한다면 쿠키의 수명을 0
		 * 쿠키를 지울 때 setPath를 동일하게 지정해야 한다.
		 * DB의 내용도 바꿔고
		 * 세션ID: 'none', 만료시간: 현재 시간
		 */
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			service.keepLogin("none", new Date(), user.getAccount());
		}
		
		ra.addFlashAttribute("msg", "logout");
		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("name", "value");
//		mv.setViewName("redirect:/");
		
		return new ModelAndView("redirect:/");
		
	}
 	
}
