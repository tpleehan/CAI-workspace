package com.spring.basic.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.basic.model.UserVO;

@Controller
@RequestMapping("/response")
public class ResponseController {

	@GetMapping("/res-ex01")
	public void resEx01() {}

	/*
	1. Model 객체를 사용하여 화면에 데이터 전송하기
	@GetMapping("/test")
	public void test(@RequestParam("age") int age, Model model) {
		model.addAttribute("age", age);
		model.addAttribute("nick", "냥냥이");
	}
	*/
	
	// 2. @ModelAttribute를 사용한 화면에 데이터 전송 처리 (@RequestParam + model.addAttribute처럼 동작)
	@GetMapping("/test")
	public void test(@ModelAttribute("age") int age, Model model) {
		// model.addAttribute("age", age);  매개변수에 ModelAttribute age를 선언하면 작성할 필요가 없다.
		model.addAttribute("nick", "냥냥이");
	}
	
	@GetMapping("/test2")
	public void test2(@ModelAttribute("info") UserVO vo) {
		System.out.println("메서드 내의 콘솔 출력: " + vo);
		System.out.println("유저의 id: " + vo.getUserId());
		System.out.println("유저의 name: " + vo.getUserName());
		
	}
	
	// 3. ModelAndView 객체를 활용한 처리
	@GetMapping("/test3")
	public ModelAndView test3() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("userName", "김철수");
		mv.addObject("userAge", "30");
		mv.setViewName("response/test3");
		
		return mv;

		// 담아낼 값이 복수일 경우 (Map을 활용하거나 커스텀 객체를 활용해서 전달 가능하다.)
		/*
		Map<String, Object> map = new HashMap<>();
		map.put("userName", "김철수");
		map.put("userAge", "30");
		
		return new ModelAndView("response/test3", map); // 여러 값을 보낼 땐 map을 사용
		*/
		
//		return new ModelAndView("response/test3", "userName", "김철수"); 하나 보낼 때 사용
		
		/*
		UserVO vo = new UserVO();
		vo.setUserName("김철수");
		vo.setUserAge(30);
		
		return new ModelAndView("response/test3", "user", vo);
		*/
		
	}
	
	///////////////////////////////////////////////////////////////////////////
	
	// res-quiz01 화면 처리
	@GetMapping("/res-quiz01")
	public void resQuiz() {}
	
	// 커멘드 객체와 Model을 사용한 방식
	@PostMapping("/res-login")
	public String resQuiz02(UserVO vo, Model model) {
		
		String id = vo.getUserId();
		String pw = vo.getUserPw();
		
		model.addAttribute("userId", id);
		
		if(id.equals("kim123") && pw.equals("1234")) {
			return "response/res-quiz02";

		} else {
			return "response/res-quiz03";
			
		}
		
	}
	
	/*
	@PostMapping("/res-login")
	public String resLogin(@ModelAttribute("userId") String id,
						   @RequestParam("userPw") String pw) {
		
		if(id.equals("kim123") && pw.equals("1234")) {
			return "response/res-quiz02";
			
		} else {
			return "response/res-quiz03";
			
		}
	}
	*/

	///////////////////////////////////////////////////////////////////////////
	
	// Redirect 처리
	
	// 폼 화면을 보여주는 메서드
	@GetMapping("/login")
	public String login() {
		System.out.println("/login: GET요청 발생");
		return "response/res-redirect-form";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("userId") String id,
						@RequestParam("userPw") String pw,
						@RequestParam("userPwChk") String pwChk,
						RedirectAttributes ra) {
		System.out.println("/login: POST요청 발생");
		System.out.println("ID: " + id);
		System.out.println("PW: " + pw);
		System.out.println("CHK: " + pwChk);
		
		// redirect: 응답이 나가고 클라이언트 측에서 자동 재요청이 들어올 수 있게 해주는 방식
		// 기존: response 객체의 sendRedirect
		// 스프링: return "redirect:(다시 요청이 들어올 url)"
		if(id.equals("")) {
			// redirect 상황에서 model 객체를 사용하게 되면
			// model 내부의 데이터가 재요청이 들어올 때 파라미터 값으로 붙어서 들어온다.
			// 데이터가 url 주소 뒤에 ?(물음표)와 함께 노출되어 전달된다.
//			model.addAttribute("msg", "아이디는 필수 값 입니다.");
			
			// redirect 처리 중에 데이터를 일회성으로 전달할 수 있는 메서드
			// 파라미터로 처리되지 않기 때문에 el을 이용해서 바로 꺼내서 사용할 수 있다.
			ra.addFlashAttribute("msg", "아이디는 필수 값 입니다.");
			return "redirect:/response/login";
		} else {
			return null;
		}
	}
	
}
