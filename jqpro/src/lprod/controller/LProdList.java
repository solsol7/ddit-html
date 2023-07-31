package lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lprod.service.ILprodService;
import lprod.service.LprodServiceImpl;
import lprod.vo.LprodVO;


@WebServlet("/lProdList.do")
public class LProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 데이타 전송 받기
		
		//service객체 얻기
		ILprodService service = LprodServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값
		List<LprodVO> list = service.selectAll();
		
		//결과값을 request에 저장
		request.setAttribute("lprodList", list);
		
		//view페이지로 이동
		request.getRequestDispatcher("/prodview/lprodList.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
