package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		
		//service메소드 호출 - 결과값 받기 - list
		
		//결과값 list를 출력 또는 json데이타 생성 - view페이지로 이동
		
		//request객체에 list결과값을 저장
		
		//forward를 이용하여 view페이지로 이동
	}

}
