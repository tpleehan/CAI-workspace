package kr.co.jsp.user.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.user.model.UserDAO;
import kr.co.jsp.user.model.UserVO;

public class UpdateService implements IUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String phone = request.getParameter("phone") 
				+ request.getParameter("phone2")
				+ request.getParameter("phone3");
		String email = request.getParameter("email") + "@" + request.getParameter("emailSel");
		String address = request.getParameter("address") 
				+ " " + request.getParameter("address2");
		
		UserVO vo = new UserVO(
					id,
					request.getParameter("pw"),
					request.getParameter("name"),
					phone,
					email,
					address
				);

		UserDAO dao = UserDAO.getInstance();
		dao.updateUser(vo);
		
		request.getSession().setAttribute("user", dao.getUserInfo(vo.getId()));
		
		try {
			PrintWriter out = response.getWriter();
		
			String htmlCode = "<script>\r\n" +
					"alert('회원 정보가 수정되었습니다.');\r\n" +
					"location.href='/mvcWeb/myPage.user';\r\n" +
					"</script>" ;
			out.print(htmlCode);
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}