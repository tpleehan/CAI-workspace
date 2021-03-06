package kr.co.jsp.user.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutService implements IUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");
		
		request.getSession().getAttribute("user");
		
		try {
			PrintWriter out = response.getWriter();
			request.getSession().invalidate();
			
			String htmlCode = "<script>\r\n" + 
					"	alert('로그아웃 처리 되었습니다.');\r\n" + 
					"	location.href='/mvcWeb';\r\n" + 
					"</script>";
			out.print(htmlCode);
			out.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
