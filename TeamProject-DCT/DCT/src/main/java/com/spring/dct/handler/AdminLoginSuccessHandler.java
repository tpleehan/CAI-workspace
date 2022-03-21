package com.spring.dct.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dct.vo.AdminsVO;

public class AdminLoginSuccessHandler implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		System.out.println("관리자 로그인 인터셉터");
		
		ModelMap mv = modelAndView.getModelMap();
		AdminsVO vo = (AdminsVO) mv.get("admin");
		
		if (vo != null) {
			System.out.println("로그인 성공 로직 동작");
			HttpSession session = request.getSession();
			session.setAttribute("adminLogin", vo);
			response.sendRedirect(request.getContextPath());
		} else {
			System.out.println("로그인 실패 로직 동작");
			modelAndView.addObject("msg", "adminLoginFail");
		}
		
	}
	
}
