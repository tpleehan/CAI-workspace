package com.spring.dct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@PostMapping("/adminLogin")
	public String adminLogin(String adminId, String adminPw, Model model) {
		System.out.println("관리자 로그인 요청");
		AdminsVO vo = service.adminLogin(adminId, adminPw);
		model.addAttribute("admin", vo);
		System.out.println("vo: " + vo);
		return "/admin/admin_login";
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


