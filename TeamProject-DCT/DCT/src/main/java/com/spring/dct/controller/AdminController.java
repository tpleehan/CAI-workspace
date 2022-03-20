package com.spring.dct.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
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

import com.spring.dct.admin.service.IAdminService;
import com.spring.dct.vo.AdminsVO;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private IAdminService service;

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

	@GetMapping("/admin_login")
	public void adminLogin() {}
	
	@PostMapping("/adminLogin")
	public String adminLogin(@RequestBody AdminsVO vo, HttpSession session, HttpServletResponse response) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		AdminsVO dbData = service.getAdminInfo(vo.getAdminId());
		
		if (dbData != null) {
			if (encoder.matches(vo.getAdminPw(), dbData.getAdminPw())) {
				session.setAttribute("adminLogin", dbData);
	
				long limitTime = 60 * 60 * 24 * 90;
				
				if (vo.isAdminAutoLogin()) {
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");
					loginCookie.setMaxAge((int) limitTime);
					
					// 응답 객체에 쿠키 전달
					response.addCookie(loginCookie);
					
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					Date limitDate = new Date(expiredDate);
					
					service.autoLogin(session.getId(), limitDate, vo.getAdminId());
				}
				
				return "loginSuccess";
			} else {
				return "pwFail";
			}
			
		} else {
			return "idFail";
		}
	}

	@GetMapping("/admin_register")
	public void adminRegister() {}

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
