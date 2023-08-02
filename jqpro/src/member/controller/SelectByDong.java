package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.ZipVO;


@WebServlet("/selectByDong.do")
public class SelectByDong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송 데이터 받기
		String dong = request.getParameter("dong");
		
		//service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//service메소드 호출하기 - 결과값 가져오기 - List<ZipVO>
		List<ZipVO> list = service.selectByDong(dong);
		
		//결과값을 request에 저장
		request.setAttribute("selectByDong", list);
		
		//view페이지로 이동 - /memberview/dongList.jsp
		request.getRequestDispatcher("/memberview/dongList.jsp")
			.forward(request, response);
		
		
	}
}
