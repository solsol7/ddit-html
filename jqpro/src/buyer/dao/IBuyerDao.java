package buyer.dao;

import java.util.List;

import buyer.vo.BuyerVO;

public interface IBuyerDao {
	public List<BuyerVO> selectList();
	
	public BuyerVO selectById(String buyer_id);
}
