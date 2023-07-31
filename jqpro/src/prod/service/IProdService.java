package prod.service;

import java.util.List;

import prod.vo.ProdVO;

public interface IProdService {
	public List<ProdVO> selectByLgu(String lgu);
	
	public ProdVO prodDetail(String id);
}
