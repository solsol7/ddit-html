package prod.dao;

import java.util.List;

import prod.vo.ProdVO;

public interface IProdDao {
	public List<ProdVO> selectByLgu(String lgu);
	
	public ProdVO prodDetail(String id);
}
