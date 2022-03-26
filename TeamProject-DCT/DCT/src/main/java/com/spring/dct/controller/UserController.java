package com.spring.dct.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.dct.vo.UsersVO;
import com.spring.dct.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;

	@GetMapping("/userJoin")
	public void userJoin() {
		System.out.println("userJoin 페이지 진입");
	}

	// 아이디 중복
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		int result = service.idCheck(userId);
		if (result == 1) {
			return "duplicated";
		} else {
			return "ok";
		}
	}

	// 회원 가입 처리
	@PostMapping("/join")
	public String join(UsersVO user, RedirectAttributes ra) {
		System.out.println("param: " + user);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호하기 전 비번: " + user.getUserPw());

		// 비밀번호를 암호화 해서 user객체에 다시 저장
		String securePw = encoder.encode(user.getUserPw());
		// 암호화 후 비번
		System.out.println("암호화 후 비번: " + securePw);
		user.setUserPw(securePw);

		service.join(user);
		ra.addFlashAttribute("msg", "joinSuccess");

		return "redirect:/";
	}

	// 로그인 페이지 이동 요청
	@GetMapping("/userLogin")
	public void userLogin() {
	}

	// 로그인 요청
	@PostMapping("/loginCheck")
	@ResponseBody
	public String loginCheck(@RequestBody UsersVO vo, HttpSession session, HttpServletResponse response) {
		System.out.println("/user/loginCheck: POST");
		System.out.println("param: " + vo);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		UsersVO dbData = service.getInfo(vo.getUserId());

		if (dbData != null) {
			System.out.println("dbData : " + dbData);

			if (encoder.matches(vo.getUserPw(), dbData.getUserPw())) {
				session.setAttribute("login", dbData);

				long limitTime = 60 * 60 * 24 * 90;

				// 자동 로그인 체크 시 처리해야 할 내용
				if (vo.isAutoLogin()) {
					System.out.println("자동 로그인 쿠키 생성 중");
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/"); 
					loginCookie.setMaxAge((int) limitTime);
					
					response.addCookie(loginCookie);
					
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					Date limitDate = new Date(expiredDate);
					
					System.out.println("자동 로그인 만료 시간: " + limitDate);
					
					service.keepLogin(session.getId(), limitDate, vo.getUserId());
				}

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

	@GetMapping("/userModify")
	public void userModify(HttpSession session, Model model) {
		System.out.println("userModify 페이지 진입");
		
		String id = ((UsersVO) session.getAttribute("login")).getUserId();
		UsersVO userInfo = service.getInfo(id);
		model.addAttribute("userInfo", userInfo);
		
	}

	// 마이페이지 수정 처리
	@PostMapping("/userUpdate")
	public String userUpdate(UsersVO vo, RedirectAttributes ra) {
		System.out.println("내 정보 수정처리");
		System.out.println("param: " + vo);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		System.out.println("암호화 하기 전 비밀번호: " + vo.getUserPw());
		
		String securePw = encoder.encode(vo.getUserPw());
		System.out.println("암호화 하기 전 비밀번호: " + securePw);
		vo.setUserPw(securePw);
		
		service.updateUser(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		
		return "redirect:/user/userModify";
	}

	@GetMapping("/userDelete")
	public void userDelete(HttpSession session, Model model) {
		System.out.println("userDelete 페이지 진입");
		
		String id = ((UsersVO) session.getAttribute("login")).getUserId();
		UsersVO userInfo = service.getInfo(id);
		model.addAttribute("userInfo", userInfo);
	}
	
	/* 유저 삭제 */
	@PostMapping("/deleteCheck")
	@ResponseBody
	public String deleteCheck(@RequestBody UsersVO vo, HttpSession session, RedirectAttributes ra) {
		System.out.println("유저 삭제 처리");
		System.out.println("param: " + vo);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		UsersVO user = (UsersVO) session.getAttribute("login");
		System.out.println("user : " + user);
		
		String sessionPw = user.getUserPw();
		System.out.println("sessionPw : " + sessionPw);
		
		if (encoder.matches(vo.getUserPw(), sessionPw)) {
			service.deleteUser(vo);
			session.invalidate();
			ra.addFlashAttribute("msg", "deleteSuccess");
			
		} else {
			ra.addFlashAttribute("msg", "deleteFail");
		}
		
		return "redirect:/";
		
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

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes ra, 
								HttpServletRequest request, HttpServletResponse response) {
		System.out.println("/user/logout: GET");
		
		UsersVO user = (UsersVO) session.getAttribute("login");
		
		session.removeAttribute("login");
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			service.keepLogin("none", new Date(), user.getUserId());
		}
		
		ra.addFlashAttribute("msg", "logout");
		
		return new ModelAndView("redirect:/");
	}

	@GetMapping("/userIdSearch")
	public void userIdSearch() {
		System.out.println("userIdSearch 페이지 진입");
	}

	@GetMapping("/userPwSearch")
	public void userPwSearch() {
		System.out.println("userPwSearch 페이지 진입");
	}

}
