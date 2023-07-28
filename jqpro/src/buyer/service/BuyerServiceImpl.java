package buyer.service;

import java.util.List;

import buyer.dao.BuyerDaoImpl;
import buyer.dao.IBuyerDao;
import buyer.vo.BuyerVO;

public class BuyerServiceImpl implements IBuyerService {

	//자기 자신의 변수
	private static IBuyerService service;
	
	//dao객체변수
	private IBuyerDao dao;
	
	//생성자 - dao객체 얻어오기
	private BuyerServiceImpl() {
		dao=BuyerDaoImpl.getInstance();
	}
	
	public static IBuyerService getInstance() {
		if(service==null) service=new BuyerServiceImpl();
		return service;
	}
	
	
	@Override
	public List<BuyerVO> selectList() {
		//변수선언
		List<BuyerVO> list=null;
		
		//실행
		list=dao.selectList();
		
		//리턴
		return list;
	}

	@Override
	public BuyerVO selectById(String buyer_id) {
		//실행 리턴
		return dao.selectById(buyer_id);
	}

}
