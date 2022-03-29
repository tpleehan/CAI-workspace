package com.spring.dct.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dct.freeReply.service.IFreeReplyService;
import com.spring.dct.util.PageVO;
import com.spring.dct.vo.freeReplyVO;

@RestController
@RequestMapping("/freeReply")
public class FreeReplyController {

	@Autowired
	private IFreeReplyService service;

	//  댓글등록
	@PostMapping("/boardReplyRegist")
	public String boardReplyRegist(@RequestBody freeReplyVO vo) {
		System.out.println("댓글 등록 요청이 들어옴");
		System.out.println(vo);

		service.regist(vo);
		
		return "regSuccess";
	}

	//페이징이 추가된 댓글 목록
	@GetMapping("/getList/{communityNo}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int communityNo, @PathVariable int pageNum){
		System.out.println("check1");
		System.out.println(communityNo);
		System.out.println(pageNum);
	
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum); 
		vo.setCountPerPage(5);

		List<freeReplyVO> list = service.getList(vo, communityNo);
		int total = service.getTotal(communityNo);
		
		System.out.println("list가 뭔데 " + list);
		System.out.println("total이 뭔데 " + total);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		return map;
	}
		
	
	//update
	@PostMapping("/update")
	public String update(@RequestBody freeReplyVO vo) {
		int result = service.userCheck(vo);
		System.out.println("update쪽 부분");
		System.out.println("result: " + result);
		System.out.println("vo" + vo);
		if(result == 1) {
			service.update(vo);
			return "modSuccess";
		} else {
			return "loginFail";
			
		}
	}

	
	//delete
	@PostMapping("/delete")
	public String delete(@RequestBody freeReplyVO vo) {
		
		int userNo = service.userCheck(vo);
		
		if(userNo == 0) {
			service.delete(vo.getRno());
			return "delSuccess";
		} else {
			
			return "delFail";
		}
		
	}
	

}
