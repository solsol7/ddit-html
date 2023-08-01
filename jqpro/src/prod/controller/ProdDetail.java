package prod.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prod.service.IProdService;
import prod.service.ProdServiceImpl;
import prod.vo.ProdVO;


@WebServlet("/prodDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 전송 데이터 받기
		String pid = request.getParameter("id");
		
		//service객체 얻기
		IProdService service = ProdServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기
		ProdVO vo = service.prodDetail(pid);
		
		//request에 저장
		request.setAttribute("prodDetail", vo);
		
		//view페이지로 이동
		request.getRequestDispatcher("/prodview/prodDetail.jsp").forward(request, response);
		
	}

}
