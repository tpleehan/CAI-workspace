package com.spring.dct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dct.cart.service.ICartService;
import com.spring.dct.vo.CartsVO;
import com.spring.dct.vo.UsersVO;

@Controller
@RequestMapping("/order")
public class CartsController {
	
	@Autowired
	private ICartService service;
	
	@GetMapping("/carts")
	public void carts() {}
	
	// 장바구니에 담기
	@PostMapping("/addCart")
	public String addCarts(CartsVO vo, Model model, int userNo) {
		service.addCart(vo);
		System.out.println("addCarts POST ");
		return "redirect:/lecture/lecturePage"; 
		
	}
	
	@PostMapping("/addPurchases")
	public String addPurchases(CartsVO vo, Model model, HttpSession session) {
		
		System.out.println("addPurchases POST 매핑");
		System.out.println(vo.getUserNo());
		System.out.println(vo.getCartAmount());
		System.out.println(vo.getLectureNo());
		int userNo = ((UsersVO) session.getAttribute("login")).getUserNo();
		System.out.println("userNo " + userNo);
		
		model.addAttribute("carts", service.getCartItemsByUserNo(userNo));
		System.out.println("service가 무너ㅑ: " + service.getCartItemsByUserNo(userNo));
		
		
		return "order/carts";
		
	}
	
}
