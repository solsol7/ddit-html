package prod.service;

import java.util.List;

import prod.dao.IProdDao;
import prod.dao.ProdDaoImpl;
import prod.vo.ProdVO;

public class ProdServiceImpl implements IProdService{

	private IProdDao dao;
	
	private static IProdService service;
	
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}
	
	public static IProdService getInstance() {
		if(service==null) service = new ProdServiceImpl();
		return service;
	}
	
	
	@Override
	public List<ProdVO> selectByLgu(String lgu) {
		return dao.selectByLgu(lgu);
	}

	@Override
	public ProdVO prodDetail(String id) {
		return dao.prodDetail(id);
	}

}
