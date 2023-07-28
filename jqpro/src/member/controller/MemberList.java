package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;


@WebServlet("/memberList.bms")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberList() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청시 전송 데이타 받기 : 예) id, pass
		
		//service객체가 필요 -  service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 받기 - list
		List<MemberVO> list = service.getAllMember();
		
		//결과값 list를 출력 또는 json데이타 생성 - view페이지로 이동
		//request객체에 list결과값을 저장
		request.setAttribute("listvalue", list);
		
		//forward를 이용하여 view페이지로 이동
		RequestDispatcher disp = request.getRequestDispatcher("/memberview/memberList.jsp");
		disp.forward(request, response);
		
	}

}
