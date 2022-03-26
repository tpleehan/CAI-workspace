package com.spring.dct.user.commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.spring.dct.admin.mapper.IAdminMapper;
import com.spring.dct.vo.AdminsVO;

public class AutoLoginInterceptor implements HandlerInterceptor {

	@Autowired
	private IAdminMapper mapper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Cookie adminLoginCookie = WebUtils.getCookie(request, "adminLoginCookie");

		HttpSession session = request.getSession();

		if (adminLoginCookie != null) {

			AdminsVO admin = mapper.getAdminWithSessionId(adminLoginCookie.getValue());
			System.out.println("쿠키의 값: " + adminLoginCookie.getValue());
			System.out.println("DB에서 가지고 온 값: " + admin);

			if (admin != null) {
				session.setAttribute("adminLogin", admin);
				System.out.println("세션 제작 완료!");

			}

		}

		return true;

	}

}
