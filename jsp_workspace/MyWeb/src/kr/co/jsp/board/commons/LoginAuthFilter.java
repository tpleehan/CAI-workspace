package kr.co.jsp.board.commons;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter("*.board") // .board로 끝나는 모든 요청에 반응한다.

@WebFilter(filterName = "loginAuth",
			urlPatterns = {"/write.board", "/modify.board", "/delete.board", "/myPage.user"},
			servletNames = {"basic"})
public class LoginAuthFilter implements Filter {

	public LoginAuthFilter() {
    
	}

	public void destroy() {
		// 필터 객체가 제거될 때 실행되는 메서드
		// 보통 초기화 시 생성했던 자원들을 종료하는 기능에 사용한다.
	}

	// 필터의 핵심기능은 doFilter에서 실행된다.
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/*
		 * # 필터의 핵심 메서드
		 * - doFilter()는 클라이언트의 요청이 있을 때마다 실행된다.
		 * - request 객체와 response 객체를 넘겨주기 때문에 요청과 응답을 조작할 수 있다. 
		 * - FilterChain을 통해 조작 이후 요청을 원래 목적지인 서블릿으로 전달할 수 있다.
		 */
		System.out.println("doFilter 메서드 요청");
		// 평소에 사용하던 타입은 HttpServletRequest
		// 부모 타입의 ServletRequest를 자식 타입으로 끌어 내리면 사용 가능하다.
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("user") == null) {
			System.out.println("회원 권한 없음");
			res.sendRedirect("/MyWeb");
			return;
		} 
		
		// 문제가 없으면 필터를 통과하게 한다.
		chain.doFilter(request, response);
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// 웹컨테이너(서버)가 시작될 때 필터 객체를 생성하는데,
		// 객체가 생성되면서 최초 한 번 호출되는 메서드
		// 필터에서 처리 시 필요한 객체를 초기화 하는데 사용한다. (JDBC관련 설정)
		System.out.println("로그인 권한 필터 객체 생성");
	}

}
