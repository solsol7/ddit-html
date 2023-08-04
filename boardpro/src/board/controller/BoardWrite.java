package board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import board.service.BoardServiceImpl;
import board.service.IBoardService;
import board.vo.BoardVO;


@WebServlet("/BoardWrite.do")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송 데이타 받기 - writer, subject, password, content, mail
		BoardVO vo = new BoardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setWip(request.getRemoteAddr());
		
		//service객체 얻기
		IBoardService service = BoardServiceImpl.getService();
				
		//service메소드 호출하기 - 결과값
		int res = service.insertBoard(vo);
		
		//request에 저장
		request.setAttribute("result", res);
		
		//view페이지로 이동
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);

	}

}
