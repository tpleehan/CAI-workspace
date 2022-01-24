package com.spring.basic;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.UserVO;

// 자동으로 스프링 컨테이너에 해당 클래스의 빈을 등록하는 어노테이션
// 빈을 등록 해야 HandlerMapping이 이 클래스의 객체를 검색할 수 있다.
@Controller
@RequestMapping("/request") // 컨트롤러 자체에 공통된 URI를 맵핑
public class RequestController {

	public RequestController() {
		System.out.println("RequestCon 생성");
	}
	
	@RequestMapping("/test")
	public String testCall() {
		System.out.println("/request/test 요청이 들어옴");
		return "test";
	}
	
	/*
	 * 만약 사용자가 /request/req 요청을 보내 왔을 때
	 * views 폴더 아래에 request라는 폴더 안에 존재하는
	 * req-ex01.jsp 파일을 열도록 메서드를 구성해 본다.
	 */
	@RequestMapping("/req")
	public String req() {
		System.out.println("/request/req 요청이 들어옴");
		return "request/req-ex01";
	}
	
	/*
	@RequestMapping("/basic01")
	public String basicReq() {
		System.out.println("/request/basic01 요청이 들어옴");
		return "request/req-ex01";
	}
	*/
	
	//@RequestMapping(value="/basic01", method = RequestMethod.GET)
	@GetMapping("/basic01") // Spring 4버전 이후부터 가능한 문법
	public String basicGet() {
		System.out.println("/request/basic01 요청이 들어옴: GET 요청");
		return "request/req-ex01";
	}
	
	//@RequestMapping(value="/basic01", method = RequestMethod.POST)
	@PostMapping("/basic01") // Spring 4버전 이후부터 가능한 문법
	public String basicPost() {
		System.out.println("/request/basic01 요청이 들어옴: POST 요청");
		return "request/req-ex01";
	}
	
	/////////////////////////////////////////////////////////////////////////////////
	
	// 화면을 띄울 메서드
	/*
	@GetMapping("/join")
	public String register() {
		System.out.println("/request/join: GET");
		return "request/join";
	}
	*/
	
	// 컨트롤러 내의 메서드 타입을 void로 선언하면 요청이 들어온 URI값을 뷰 리졸버에게 전달한다.
	@GetMapping("/join")
	public void register() {
		System.out.println("/request/join: GET");
	}
	
	// 요청 URI 주소가 같더라도 전송 방식에 따라 맵핑이 다르게 진행하기 때문에 같은 주소를 사용하는 것이 가능하다.
	
	/*
	1. 전통적인 jsp/servlet 방식의 파라미터 읽기 처리 방법
	- HttpServletRequest 객체를 활용 (jsp에서 사용한 방식)
	
	@PostMapping("/join")
	public void register(HttpServletRequest request) {
		System.out.println("/request/join: POST");
		
		System.out.println("ID: " + request.getParameter("userId"));
		System.out.println("PW: " + request.getParameter("userPw"));
		System.out.println("NAME: " + request.getParameter("userName"));
		System.out.println("HOBBY: " + Arrays.toString(request.getParameterValues("hobby")));
	}
	*/
	
	/*
	2. @RequestParam 어노테이션을 이용한 요청 파라미터 처리
	- @RequestParam("파라미터 변수명") 값을 받아서 처리할 변수
	   
	@PostMapping("/join")
	public void register(@RequestParam("userId") String id,
			@RequestParam("userPw") String pw,
			@RequestParam(value = "hobby", required = false, defaultValue = "no hobby person") List<String> hobbies) {
		System.out.println("ID: " + id);
		System.out.println("PW: " + pw);
		System.out.println("HOBBY: " + hobbies);
	}
	*/
	
	/*
	3. 커맨드 객체를 활용한 파라미터 처리
	- 파라미터 데이터와 연동되는 VO 클래스가 필요하다.
	*/
	@PostMapping("/join")
	public void register(UserVO user) {
		System.out.println("ID: " + user.getUserId());
		System.out.println("PW: " + user.getUserPw());
		System.out.println("NAME: " + user.getUserName());
		System.out.println("HOBBY: " + user.getHobby());
	}
	
}
