package com.spring.dct.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dct.vo.UsersVO;
import com.spring.dct.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;

	@GetMapping("/userJoin")
	public void userJoin() {
		System.out.println("userJoin 페이지 진입");
	}
	
	@PostMapping("/idCheck")
	public String checkId(@RequestBody String userId) {
		System.out.println("/user/checkId: POST");
		System.out.println("param: " + userId);
		
		int checkNum = service.idCheck(userId);
		
		if (checkNum == 1) {
			System.out.println("아이디 중복");
			return "duplicated";
		} else {
			System.out.println("아이디 사용 가능");
			return "available";
		}
		
	}
	
	
	// 회원 가입 처리
	@PostMapping("/")
	public String join(UsersVO vo, RedirectAttributes ra) {
		System.out.println("param: " + vo);
		service.register(vo);
		ra.addFlashAttribute("msg", "joinSuccess");
		
		return "redirect:/user/userLogin";
	}
	
	
	// 로그인 요청 처리
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestBody UsersVO vo,
								HttpSession session,
								HttpServletResponse response) {
		System.out.println("/user/loginCheck: POST");
		System.out.println("param: " + vo);
		
		// 서버에서 세션 객체를 얻는 방법
		// 1. HttpServletRequest 객체 사용
		// HttpSession session = request.getSession();
		
		// 2. 매개값으로 HttpSession 객체를 받아서 사용
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		UsersVO dbData = service.selectOne(vo.getUserId());
		
		if (dbData != null) {
			System.out.println("dbData : " + dbData);
			if (encoder.matches(vo.getUserPw(), dbData.getUserPw())) {
				// 로그인 성공 회원을 대상으로 세션 정보 생성
				session.setAttribute("login", dbData);
	
				long limitTime = 60 * 60 * 24 * 90;
				
				
				return "loginSuccess";
				
			} else {
				return "pwFail";
				
			}
			
		} else {
			return "idFail";
			
		}
		
	}
	
	
	@GetMapping("/userMypage")
	public void userMypage() {
		System.out.println("userMypage 페이지 진입");
	}
	
	/* 내 정보 수정 처리
	@GetMapping("/userModify")
	public void userMyPage(HttpSession session, Model model) {
		
		// 세션 데이터에서 id를 가지고 와서 sql문을 작성 가능
		String id = ((UserVO) session.getAttribute("login")).getUserId();
		
		UserVO userInfo = service.getInfo(id);
		
		model.addAttribute("userInfo", userInfo);
	}
	*/
	
	@GetMapping("/userModify")
	public void userModify() {
		System.out.println("userModify 페이지 진입");
	}
	
	
	// 마이페이지 수정 처리
	@PostMapping("/userUpdate")
	public String userUpdate(UsersVO vo, RedirectAttributes ra) {
		System.out.println("내 정보 수정 처리");
		System.out.println("param: " + vo);
		service.updateUser(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		
		return "redirect:/user/userModify";
	}
	
	@GetMapping("/userDelete")
	public void userDelete() {
		System.out.println("userDelete 페이지 진입");
	}
	
	
	@GetMapping("/userMypageStudy")
	public void userMypageStudy() {
		System.out.println("userMypageStudy 페이지 진입");
	}
	
	@GetMapping("/userMypageConfirmation")
	public void userMypageConfirmation() {
		System.out.println("userMypageConfirmation 페이지 진입");
	}
	
	@GetMapping("/userMypageQna")
	public void userMypageQna() {
		System.out.println("userMypageQna 페이지 진입");
	}
	
	@GetMapping("/userMypageRecentLecture")
	public void userMypageRecentLecture() {
		System.out.println("userMypageRecentLecture 페이지 진입");
	}
	
	
	/* 유저 로그아웃 */
	
	/*
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes ra, 
								HttpServletRequest request, HttpServletResponse response) {
		System.out.println("/user/logout: GET");
		
		UserVO user = (UserVO) session.getAttribute("login");
		
		session.removeAttribute("login");
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			service.keepLogin("none", new Date(), user.getAccount());
		}
		
		ra.addFlashAttribute("msg", "logout");
		
		return new ModelAndView("redirect:/");
	}
	 */
	
	

	@GetMapping("/userIdSearch")
	public void userIdSearch() {
		System.out.println("userIdSearch 페이지 진입");
	}
	
	
	@GetMapping("/userPwSearch")
	public void userPwSearch() {
		System.out.println("userPwSearch 페이지 진입");
	}

}
