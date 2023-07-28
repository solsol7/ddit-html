package buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import buyer.vo.BuyerVO;
import mybatis.config.MybatisUtil;

public class BuyerDaoImpl implements IBuyerDao {

	//싱글톤 - 자신의 객체 생성, 리턴
	private static IBuyerDao dao;
	
	private BuyerDaoImpl() {}
	
	public static IBuyerDao getInstance() {
		if(dao==null) dao=new BuyerDaoImpl();
		return dao;
	}
	
	private SqlSession sql;
	
	@Override
	public List<BuyerVO> selectList() {
		//변수선언
		List<BuyerVO> list = null;
		
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("buyer.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			sql.close();
		}
		
		
		//실행

		
		//리턴
		return list;
	}

	@Override
	public BuyerVO selectById(String buyer_id) {
		//변수 선언
		BuyerVO vo = null;
		
		//실행
		
		try {
			sql = MybatisUtil.getSqlSession();
			vo=sql.selectOne("buyer.selectById",buyer_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			sql.close();
		}
		
		//리턴
		return vo;
	}

}
