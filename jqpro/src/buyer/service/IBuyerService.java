package buyer.service;

import java.util.List;

import buyer.vo.BuyerVO;

public interface IBuyerService {
	public List<BuyerVO> selectList();
	
	public BuyerVO selectById(String buyer_id);
}
