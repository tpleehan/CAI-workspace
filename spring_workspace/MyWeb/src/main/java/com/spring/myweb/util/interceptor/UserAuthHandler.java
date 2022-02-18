package com.spring.myweb.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;


public class UserAuthHandler implements HandlerInterceptor {

	// 회원권한이 필요한 페이지 요청이 들어왔을 때 요청을 확인할 인터셉터 
	// 글쓰기 화면과 마이페이지 화면에 들어갈 때 요청 검사를 하고 권한이 없으면 로그인 페이지로 보낸다.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("회원권한 인터셉터 동작");
		
		// 세션에서 로그인 데이터를 얻은 후 확인
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) { // 로그인이 안된 시점
			response.sendRedirect(request.getContextPath() + "/user/userLogin");
			return false; // 컨트롤러 진입을 막는다.
			
		}
		
		return true; // 컨트롤러 통과
		
	}
	
}
