package com.spring.dct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	@GetMapping("/freeBoardList")
	public String freeBoardList() {
		System.out.println("자유게시판 - freeBoardList");
		return "board/freeBoardList";
	}
	
	@GetMapping("/freeBoardRegist")
	public String freeBoardRegist() {
		System.out.println("자유게시판 - freeBoardRegist");
		return "board/freeBoardRegist";
	}
	
	@GetMapping("/freeBoardDetail")
	public String freeBoardDetail() {
		System.out.println("자유게시판 - freeBoardDetail");
		return "board/freeBoardDetail";
	}
	
	@GetMapping("/freeBoardModify")
	public String freeBoardModify() {
		System.out.println("자유게시판 - freeBoardModify");
		return "board/freeBoardModify";
	}
	
	@GetMapping("/qnaBoardList")
	public String qnaBoardList() {
		System.out.println("질문과 답변 - qnaBoardList");
		return "board/qnaBoardList";
	}
	
	@GetMapping("/qnaBoardRegist")
	public String qnaBoardRegist() {
		System.out.println("질문과 답변 - qnaBoardRegist");
		return "board/qnaBoardRegist";
	}
	
	@GetMapping("/qnaBoardDetail")
	public String qnaBoardDetail() {
		System.out.println("질문과 답변 - qnaBoardDetail");
		return "board/qnaBoardDetail";
	}
	
	@GetMapping("/qnaBoardModify")
	public String qnaBoardModify() {
		System.out.println("질문과 답변 - qnaBoardModify");
		return "board/qnaBoardModify";
	}

}
