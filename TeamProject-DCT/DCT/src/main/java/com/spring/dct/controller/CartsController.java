package com.spring.dct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dct.cart.service.ICartService;
import com.spring.dct.vo.CartsVO;

@Controller
@RequestMapping("/order")
public class CartsController {
	
	@Autowired
	private ICartService service;
	
	@GetMapping("/carts")
	public void carts() {}
	
	// 장바구니에 담기
	@PostMapping("/addCart")
	public String addCarts(CartsVO vo, Model model, int userNo, HttpSession session, RedirectAttributes ra) {
		System.out.println("carts post");
		
		service.addCart(vo);
		
		model.addAttribute("carts", service.getCartItemsByUserNo(userNo));
		
		return "redirect:/order/carts";
	}
	
	
	
}
