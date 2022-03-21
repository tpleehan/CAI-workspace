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
				// 로그인 성공 회원을 대상으로 세션 정보 생성
				session.setAttribute("login", dbData);
				System.out.println(session.getId());

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

					service.keepLogin(session.getId(), limitDate, vo.getUserId());
					System.out.println(session.getId());

					System.out.println(vo.getUserId());

				}

				return "loginSuccess";

			} else {
				return "pwFail";

			}

		} else {
			return "idFail";

		}

	} // loginCheck

	@GetMapping("/userMypage")
	public void userMypage() {
		System.out.println("userMypage 페이지 진입");
	}

	/*
	 * 내 정보 수정 처리
	 * 
	 * @GetMapping("/userModify") public void userMyPage(HttpSession session, Model
	 * model) {
	 * 
	 * // 세션 데이터에서 id를 가지고 와서 sql문을 작성 가능 String id = ((UserVO)
	 * session.getAttribute("login")).getUserId();
	 * 
	 * UserVO userInfo = service.getInfo(id);
	 * 
	 * model.addAttribute("userInfo", userInfo); }
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

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes ra, HttpServletRequest request,
			HttpServletResponse response) {
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
