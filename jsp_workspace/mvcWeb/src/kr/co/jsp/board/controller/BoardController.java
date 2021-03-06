package kr.co.jsp.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.board.service.ContentService;
import kr.co.jsp.board.service.DeleteService;
import kr.co.jsp.board.service.GetListService;
import kr.co.jsp.board.service.IBoardService;
import kr.co.jsp.board.service.ModifyService;
import kr.co.jsp.board.service.RegistService;
import kr.co.jsp.board.service.UpdateService;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private RequestDispatcher dp;
	private IBoardService sv;
	
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doRequest(request, response);
	}

	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		
		uri = uri.substring(conPath.length() + 1, uri.lastIndexOf("."));
		
		System.out.println(uri);
		
		switch (uri) {
		
		case "listPage":
			System.out.println("글 목록 요청");
			sv = new GetListService();
			sv.execute(request, response);
			
			dp = request.getRequestDispatcher("board/bbs.jsp");
			dp.forward(request, response);
			break;
		
		case "writePage":
			System.out.println("글쓰기 페이지 이동");
			response.sendRedirect("board/bbs_write.jsp");
			break;
			
		case "regist":
			System.out.println("글 등록 요청");
			sv = new RegistService();
			sv.execute(request, response);
			
			response.sendRedirect("/mvcWeb/listPage.board");
			break;
		
		case "contentPage":
			System.out.println("글 상세보기 페이지 이동");
			sv = new ContentService();
			sv.execute(request, response);
			
			dp = request.getRequestDispatcher("board/bbs_content.jsp");
			dp.forward(request, response);
			break;
			
		case "modifyPage":
			System.out.println("글 수정 페이지 요청");
			sv = new ModifyService();
			sv.execute(request, response);
			
			dp = request.getRequestDispatcher("board/bbs_modify.jsp");
			dp.forward(request, response);
			
			break;
		
		case "update":
			System.out.println("글 수정 완료");
			sv = new UpdateService();
			sv.execute(request, response);
			
			break;
		
		case "delete":
			System.out.println("글 삭제 완료");
			sv = new DeleteService();
			sv.execute(request, response);
			
			response.sendRedirect("/mvcWeb/listPage.board");
			break;

		}
	}
}
