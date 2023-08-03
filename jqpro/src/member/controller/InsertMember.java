package member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;


@WebServlet("/insertMember.do")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//요청시 데이타받기 9개
		//vo에 저장
		
		MemberVO vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		/*
		// 요청시 전송데이타 받기  - 9개
		String userId = request.getParameter("id");
		String userName = request.getParameter("name");
		String userPass = request.getParameter("pass");
		String userBir = request.getParameter("bir");
		String userHp = request.getParameter("hp");
		String userMail = request.getParameter("mail");
		String userZip = request.getParameter("zip");
		String userAdd1 = request.getParameter("add1");
		String userAdd2 = request.getParameter("add2");
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(userId);
		vo.setMem_name(userName);
		vo.setMem_pass(userPass);
		vo.setMem_bir(userBir);
		vo.setMem_hp(userHp);
		vo.setMem_mail(userMail);
		vo.setMem_zip(userZip);
		vo.setMem_add1(userAdd1);
		vo.setMem_add2(userAdd2);
		*/
		
		//service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		//service메소드 호출하기 - 결과값 받기
		int res = service.insertMember(vo);
		
		//request에 결과 저장
		request.setAttribute("insert", res);
		
		//view페이지로 이동
		request.getRequestDispatcher("/memberview/insertMember.jsp")
			.forward(request, response);
	}

}
