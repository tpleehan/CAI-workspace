package kr.co.jsp.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jsp.board.model.BoardDAO;
import kr.co.jsp.board.model.BoardVO;
import kr.co.jsp.board.service.ContentService;
import kr.co.jsp.board.service.DeleteService;
import kr.co.jsp.board.service.GetListService;
import kr.co.jsp.board.service.IBoardService;
import kr.co.jsp.board.service.ModifyService;
import kr.co.jsp.board.service.RegistService;
import kr.co.jsp.board.service.SearchService;
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
		case "write":
			System.out.println("글쓰기 페이지로 이동");
			response.sendRedirect("board/board_write.jsp");
			break;
			
		case "regist":
			System.out.println("글 등록 요청");
			sv = new RegistService();
			sv.execute(request, response);
			/*
			String writer = request.getParameter("bWriter");
			String title = request.getParameter("bTitle");
			String content = request.getParameter("bContent");
			
			BoardDAO.getInstance().regist(writer, title, content);
			System.out.println("글 등록 성공");
			*/
			/*
			 * board_list.jsp로 리다이렉트로 요청하면 안되는 이유
			 * board_list.jsp는 데이터베이스로부터 전체 글 목록을 가져오는 로직이 없다.
			 * (단순히 보여주는 역할만 하기 때문이다.)
			 * Controller를 통해 글 목록 요청이 다시 들어오도록
			 * sendRedirect()를 사용해서 자동 목록 재요청 한다.
			 */
			
			response.sendRedirect("/MyWeb/list.board");
			break;
		
		case "list":
			System.out.println("글 목록 요청");
			sv = new GetListService();
			sv.execute(request, response);
			/*
			List<BoardVO> boardList = BoardDAO.getInstance().listBoard();
			
			// list에 request로 요청을 보낸다.(name의 "boardList"는 기억하기 쉬운 이름으로 지정)
			request.setAttribute("boardList", boardList);
			*/
			/*
			 * sendRedirect를 사용하면 안되는 이유
			 * request객체에 list에 담아서 전달하는데
			 * sendRedirect를 사용하면 응답이 나가면서 request객체가 소멸한다.
			 */
			// response.sendRedirect("board/board_list.jsp"); (x)
			
			// request객체를 다음 화면까지 운반하기 위한 forward 기능을 지원하는 객체
			// RequestDispatcher (목적지를 지정하고 해당 목적지에 request와 response를 보낸다.)
			dp = request.getRequestDispatcher("board/board_list.jsp");
			dp.forward(request, response);
			break;
		
		case "content":
			System.out.println("글 상세보기 요청");
			sv = new ContentService();
			sv.execute(request, response);
			// 글 번호를 받아서 DAO의 contentBoard() 호출
			// 가져온 데이터를 request에 담아서 board_content.jsp로 포워딩
			// content.jsp에서 데이터를 화면에 나타나게 한다.
			/*
			int bId = Integer.parseInt(request.getParameter("bId"));
			BoardVO vo = BoardDAO.getInstance().contentBoard(bId);
			
			request.setAttribute("content", vo);
			 */
			
			dp = request.getRequestDispatcher("board/board_content.jsp");
			dp.forward(request, response);
			break;
			
		case "modify":
			System.out.println("글 수정 페이지 요청");
			sv = new ModifyService();
			sv.execute(request, response);
			
			dp = request.getRequestDispatcher("board/board_modify.jsp");
			dp.forward(request, response);
			
			break;
		
		case "update":
			System.out.println("글 수정 완료");
			sv = new UpdateService();
			sv.execute(request, response);
			
			response.sendRedirect("/MyWeb/content.board?bId=" + request.getParameter("bId"));
			
			break;
		
		case "delete":
			System.out.println("글 삭제 완료");
			sv = new DeleteService();
			sv.execute(request, response);
			
			response.sendRedirect("/MyWeb/list.board");
			
			break;

		case "search":
			System.out.println("글 검색 요청");
			sv = new SearchService();
			sv.execute(request, response);
			
			if (request.getAttribute("boardList") != null) {
				dp = request.getRequestDispatcher("board/board_list.jsp");
				dp.forward(request, response);
				break;
			}
		
		}
	}
}
