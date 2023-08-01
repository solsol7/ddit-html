package prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prod.service.IProdService;
import prod.service.ProdServiceImpl;
import prod.vo.ProdVO;


@WebServlet("/prodList.do")
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 전송테이타 받기
		String lgu = request.getParameter("gu");
		
		//service객체 얻기
		IProdService service = ProdServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기
		List<ProdVO> list = service.selectByLgu(lgu);
		
		//결과값을 request에 저장
		request.setAttribute("selectBylgu", list);
		
		//view 이동
		request.getRequestDispatcher("prodview/pordList.jsp").forward(request, response);
	}

}
