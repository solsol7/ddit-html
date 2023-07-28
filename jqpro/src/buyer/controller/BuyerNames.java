package buyer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buyer.service.BuyerServiceImpl;
import buyer.service.IBuyerService;
import buyer.vo.BuyerVO;

/**
 * Servlet implementation class BuyerNames
 */
@WebServlet("/buyerNames.do")
public class BuyerNames extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 전송데이타 받기
		
		//service객체 요청 - 가져오기
		IBuyerService service = BuyerServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기 - list
		List<BuyerVO> list = service.selectList();
		
		//request객체에 list결과값을 저장한다
		request.setAttribute("sss", list);
		
		//view페이지로 이동
		request.getRequestDispatcher("/buyerview/buyerNames.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
