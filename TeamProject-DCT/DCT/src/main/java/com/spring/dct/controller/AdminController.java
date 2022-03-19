package com.spring.dct.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	@GetMapping("/admin_404")
	public void adminError() {
		System.out.println("admin_404 페이지 진입");
	}

	@GetMapping("/admin_blank")
	public void adminBlank() {
		System.out.println("admin_blank 페이지 진입");
	}

	@GetMapping("/admin_buttons")
	public void adminButtons() {
		System.out.println("admin_buttons 페이지 진입");
	}

	@GetMapping("/admin_cards")
	public void adminCards() {
		System.out.println("admin_cards 페이지 진입");
	}

	@GetMapping("/admin_charts")
	public void adminCharts() {
		System.out.println("admin_charts 페이지 진입");
	}

	@GetMapping("/admin_forgot-password")
	public void adminForgotPassword() {
		System.out.println("admin_forgot-password 페이지 진입");
	}

	@GetMapping("/admin_index")
	public void adminIndex() {
		System.out.println("admin_index 페이지 진입");
	}

	@GetMapping("/admin_login")
	public void adminLogin() {
		System.out.println("admin_login 페이지 진입");
	}

	@GetMapping("/admin_register")
	public void adminRegister() {
		System.out.println("admin_register 페이지 진입");
	}

	@GetMapping("/admin_tables")
	public void adminTables() {
		System.out.println("admin_tables 페이지 진입");
	}

	@GetMapping("/admin_utilities-animation")
	public void adminUtilitiesAnimation() {
		System.out.println("admin_utilities-animation 페이지 진입");
	}

	@GetMapping("/admin_utilities-border")
	public void adminUtilitiesBorder() {
		System.out.println("admin_utilities-border 페이지 진입");
	}

	@GetMapping("/admin_utilities-color")
	public void adminUtilitiesColor() {
		System.out.println("admin_utilities-color 페이지 진입");
	}

	@GetMapping("/admin_utilities-other")
	public void adminUtilitiesOther() {
		System.out.println("admin_utilities-other 페이지 진입");
	}

}
