package com.spring.myweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.myweb.command.ReplyVO;
import com.spring.myweb.reply.service.IReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private IReplyService service;
	
	// 댓글 등록
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody ReplyVO vo) {
		System.out.println("댓글 등록 요청");
		service.replyRegist(vo);
		
		return "regSuccess";
		
	}
	
}
