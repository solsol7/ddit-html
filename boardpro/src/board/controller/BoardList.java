package board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;
import board.vo.PageVO;


@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송데이타 받기  - page, stype, sword
		int page = Integer.parseInt(request.getParameter("page"));
		
		//최초 실행 시 값이 없다
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		//service객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		//service메소드 호출 - page 정보 얻기
		PageVO pvo = service.pageInfo(page, stype, sword);
		
		//service메소드 호출 - page정보에 의한 리스트 select
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		map.put("stype", stype);
		map.put("sword", sword);
		
		List<BoardVO> list = service.selectByPage(map);
		
		//결과값을 request에 저장
		request.setAttribute("listvalue", list);
		request.setAttribute("startpage", pvo.getStartPage());
		request.setAttribute("endpage", pvo.getEndPage());
		request.setAttribute("totalpage", pvo.getTotalPage());
		
		//view페이지로 이동
		request.getRequestDispatcher("/boardview/list.jsp").forward(request, response);
	}
	
	

}
