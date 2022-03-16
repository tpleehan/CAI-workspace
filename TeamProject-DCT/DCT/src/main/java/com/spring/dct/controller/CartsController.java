package com.spring.dct.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class CartsController {
	
	@GetMapping("/carts")
	public void carts() {
		System.out.println("carts 페이지 진입");
	}
	
}
