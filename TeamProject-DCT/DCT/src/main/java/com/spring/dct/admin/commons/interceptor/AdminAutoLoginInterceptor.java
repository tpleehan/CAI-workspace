package com.spring.dct.admin.commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.spring.dct.user.mapper.IUserMapper;
import com.spring.dct.vo.UsersVO;

public class AdminAutoLoginInterceptor implements HandlerInterceptor {

	@Autowired
	private IUserMapper mapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		System.out.println("자동 로그인 인터셉터 발동!");

		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

		HttpSession session = request.getSession();

		if (loginCookie != null) {// 자동로그인을 이전에 신청한 유저구나~

			// DB에서 쿠키값(세션ID)과 일치하는 세션ID를 가진 회원의 정보를 조회
			UsersVO vo = mapper.getUserWithSessionId(loginCookie.getValue());
			System.out.println("쿠키의 값: " + loginCookie.getValue());
			System.out.println("DB에서 가지고 온 값: " + vo);

			if (vo != null) {
				// 자동 로그인 신청한 사람의 로그인 데이터(세션)을 만들어 줍시다.
				session.setAttribute("login", vo);
				System.out.println("세션 제작 완료!");

			}

		}

		// true이면 컨트롤러로 요청이 들어가고, false면 요청을 막습니다.
		// 자동 로그인 신청 여부와 상관없이 홈 화면은 무조건 봐야 하니까 true를 작성합니다.
		return true;

	}

}
