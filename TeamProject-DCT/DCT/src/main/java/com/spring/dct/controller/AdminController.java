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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.dct.admin.service.IAdminService;
import com.spring.dct.vo.AdminsVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private IAdminService service;
	
	// 관리자 로그인 페이지 이동
	@GetMapping("/admin_login")
	public void adminLogin() {}
	
	// 관리자 로그인 요청
	@PostMapping("/adminLoginCheck")
	@ResponseBody
	public String adminLogin(@RequestBody AdminsVO admin, HttpSession session, HttpServletResponse response) {
		System.out.println("관리자 로그인 요청");
		System.out.println("/admin/adminLoginCheck: POST");
		System.out.println("param: " + admin);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		AdminsVO dbData = service.getAdminInfo(admin.getAdminId());

		if (dbData != null) {
			System.out.println("dbData : " + dbData);

			if (encoder.matches(admin.getAdminPw(), dbData.getAdminPw())) {
				session.setAttribute("adminLogin", dbData);

				long limitTime = 60 * 60 * 24 * 90;

				// 자동 로그인 체크 시 처리해야 할 내용
				if (admin.isAdminAutoLogin()) {
					System.out.println("자동 로그인 쿠키 생성 중");
					Cookie adminLoginCookie = new Cookie("adminLoginCookie", session.getId());
					adminLoginCookie.setPath("/"); 
					adminLoginCookie.setMaxAge((int) limitTime);
					
					response.addCookie(adminLoginCookie);
					
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					Date limitDate = new Date(expiredDate);
					
					System.out.println("자동 로그인 만료 시간: " + limitDate);
					
					service.autoLogin(session.getId(), limitDate, admin.getAdminId());
				}

				return "adminLoginSuccess";

			} else {
				return "adminPwFail";

			}

		} else {
			return "adminIdFail";

		}
		
	}
	
	// 관리자 로그아웃
	@GetMapping("adminLogout")
	public ModelAndView logout(HttpSession session, RedirectAttributes ra, 
			HttpServletRequest request, HttpServletResponse response) {
		AdminsVO admin = (AdminsVO) session.getAttribute("adminLogin");
		
		session.removeAttribute("adminLogin");
		
		Cookie adminLoginCookie = WebUtils.getCookie(request, "adminLoginCookie");
		
		if (adminLoginCookie != null) {
			adminLoginCookie.setMaxAge(0);
			adminLoginCookie.setPath("/");
			response.addCookie(adminLoginCookie);
			service.autoLogin("none", new Date(), admin.getAdminId());
		}
		
		ra.addFlashAttribute("msg", "adminLogout");
		
		return new ModelAndView("redirect:/admin/admin_login");
	}
	
	
	// 관리자 가입 페이지 이동
	@GetMapping("/admin_register")
	public void adminRegister() {}
	
	// 관리자 아이디 중복 확인
	@PostMapping("/adminIdCheck")
	@ResponseBody
	public String idCheck(@RequestBody String adminId) {
		int result = service.adminIdCheck(adminId);
		if (result == 1) {
			return "duplicated";
		} else {
			return "ok";
		}
	}
	
	// 관리자 가입 처리
	@PostMapping("/adminJoin")
	public String join(AdminsVO admin, RedirectAttributes ra) {
		System.out.println("param: " + admin);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		String securePw = encoder.encode(admin.getAdminPw());

		admin.setAdminPw(securePw);

		service.adminJoin(admin);
		ra.addFlashAttribute("msg", "adminJoinSuccess");

		return "redirect:/admin/admin_login";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/admin_404")
	public void adminError() {}

	@GetMapping("/admin_blank")
	public void adminBlank() {}

	@GetMapping("/admin_buttons")
	public void adminButtons() {}

	@GetMapping("/admin_cards")
	public void adminCards() {}

	@GetMapping("/admin_charts")
	public void adminCharts() {}

	@GetMapping("/admin_forgot-password")
	public void adminForgotPassword() {}

	@GetMapping("/admin_index")
	public void adminIndex() {}



	@GetMapping("/admin_tables")
	public void adminTables() {}

	@GetMapping("/admin_utilities-animation")
	public void adminUtilitiesAnimation() {}

	@GetMapping("/admin_utilities-border")
	public void adminUtilitiesBorder() {}

	@GetMapping("/admin_utilities-color")
	public void adminUtilitiesColor() {}

	@GetMapping("/admin_utilities-other")
	public void adminUtilitiesOther() {}

}


