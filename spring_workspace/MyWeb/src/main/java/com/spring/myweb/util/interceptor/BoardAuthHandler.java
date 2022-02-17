package com.spring.myweb.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.myweb.command.UserVO;

public class BoardAuthHandler implements HandlerInterceptor {
	
	/*
	 * 화면에서 변경, 수정, 삭제가 일어날 때, writer값을 넘겨주도록 처리
	 * 게시글 수정, 삭제에 대한 권한 처리 핸들러
	 * 세션값과 writer(작성자) 정보가 같다면 컨트롤러를 실행,
	 * 그렇지 않다면 '권한이 없습니다.' 출력 후 뒤로가기.
	 * 권한이 없습니다. 경고창은 jsp에서 했었던 PrintWriter 객체를 이용
	 * PrintWriter 객체는 response 객체에게 받아 온다.
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String writer = request.getParameter("writer");
		System.out.println("interceptor writer: " + writer);
		
		HttpSession session = request.getSession();
		
		UserVO user = (UserVO) session.getAttribute("login");
		System.out.println("interceptor user: " + user);
		
//		String id = user.getUserId();
//		System.out.println("interceptor id: " + id);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		
		if(user != null) {
			if(!writer.equals(user.getUserId())) {
				System.out.println("해당 글 작성자가 아닌 유저");
				
				out.print("<script>"
							+ "alert('권한이 없습니다.');"
							+ "location.href='/myweb'"
						+ "</script>");

				out.close();
				
				return false;
			
			} else {
				System.out.println("해당 글 작성자 유저");
				return true;
			}
			
		} else {
			System.out.println("로그인을 하지 않은 유저");
			out.print("<script>"
						+ "alert('권한이 없습니다.');"
						+ "location.href='/myweb'"
					+ "</script>");

			out.close();
			
			return false;
		}

	}
	
}
