package com.spring.dct.user.commons.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class UserAuthHandler implements HandlerInterceptor  {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler )
			throws Exception {
		System.out.println("글쓰기 권한 인터셉터");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") != null ) {
			
			return true;
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //메서드 자체에 exeption이 되어 있어서 따로 exeption 처리를 해주지 않아도 된다.
		out.print("<script> \r\n");
		out.print("alert('로그인을 해주세요'); \r\n" );
		out.print("history.back(); \r\n ");
		out.print("</script>");

		out.flush();
		
		return false;
	}
	
	
	
}
