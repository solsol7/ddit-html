package lprod.service;

import java.util.List;

import lprod.dao.ILprodDao;
import lprod.dao.LprodDaoImpl;
import lprod.vo.LprodVO;

public class LprodServiceImpl implements ILprodService{

	private ILprodDao dao;
	
	//싱글톤 - 자기자신의 객체
	private static ILprodService service;
	
	private LprodServiceImpl() {
		dao=LprodDaoImpl.getInstance();
	}
	
	public static ILprodService getInstance() {
		if(service==null) service = new LprodServiceImpl();
		return service;
	}
	
	@Override
	public List<LprodVO> selectAll() {
		//선언 + 실행 + 리턴
		return dao.selectAll();
	}

}
