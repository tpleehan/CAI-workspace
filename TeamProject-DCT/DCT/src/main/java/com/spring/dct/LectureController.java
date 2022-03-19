package com.spring.dct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LectureController {

	@GetMapping("/mentoringList")
	public String mentoringList() {
		System.out.println("멘토링 - mentoringList");
		return "lecture/mentoringList";
	}
	
	@GetMapping("/lectureList")
	public String lectureList() {
		System.out.println("강의 - lectureList");
		return "lecture/lectureList";
	}
	

}
