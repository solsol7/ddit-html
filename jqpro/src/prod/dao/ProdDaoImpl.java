package prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao{
	
	//자기자신 싱글톤
	private static IProdDao dao;
	
	private ProdDaoImpl() {}
	
	public static IProdDao getInstance() {
		if(dao==null) dao = new ProdDaoImpl();
		return dao;
	}
	
	private SqlSession sql = null;

	@Override
	public List<ProdVO> selectByLgu(String lgu) {
		//선언
		List<ProdVO> list = null;
		
		//실행
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("prod.selectByLgu", lgu);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			if(sql!=null) sql.close();
		}
		
		//리털
		return list;
	}

	@Override
	public ProdVO prodDetail(String id) {
		ProdVO vo = null;
		
		try {
			sql = MybatisUtil.getSqlSession();
			vo = sql.selectOne("prod.prodDetail",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			if(sql!=null) sql.close();
		}
		
		return vo;
	}

}
