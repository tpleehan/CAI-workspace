package com.spring.mvc.user.commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.spring.mvc.user.model.UserVO;
import com.spring.mvc.user.repository.IUserMapper;

public class AutoLoginInterceptor implements HandlerInterceptor {

	@Autowired
	private IUserMapper mapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("자동 로그인 인터셉터 발동");
		
		// 1. 자동 로그인 쿠기가 있는지 여부 확인 -> loginCookie의 존재 여부 확인
		
		// 원하는 쿠키의 값을 한번에 꺼내오기 (request객체, 쿠키이름)
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		// 자동 로그인 신청한 유저의 로그인 유지를 위해 세션 데이터를 만든다.
		HttpSession session = request.getSession();
		
		if (loginCookie != null) { // 자동 로그인을 이전에 신청한 유저

			// 2. DB에서 쿠키값(세션ID)과 일치하는 세션ID를 가진 회원의 정보를 조회
			UserVO vo = mapper.getUserWithSessionId(loginCookie.getValue());
			System.out.println("쿠키의 값: " + loginCookie.getValue());
			System.out.println("DB에서 가지고 온 값: " + vo);
			
			if (vo != null) {
				// 자동 로그인 신청한 사람의 로그인 데이터(세션)를 만들어 준다.
				session.setAttribute("login", vo);
				System.out.println("세션 제작 완료");
			}
		}
		
		// true일 경우 컨트롤러로 요청이 들어가고, false일 경우 요청을 막는다.
		// 자동 로그인 신청 여부와 상관 없이 홈 화면으로 요청해야 하기 때문에 true를 작성한다.
		return true;
	}
	
}
