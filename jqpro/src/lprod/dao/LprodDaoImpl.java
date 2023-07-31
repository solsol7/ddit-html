package lprod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lprod.vo.LprodVO;
import mybatis.config.MybatisUtil;

public class LprodDaoImpl implements ILprodDao{
	
	//싱글톤
	private static ILprodDao dao;
	
	private LprodDaoImpl() {}
	
	public static ILprodDao getInstance() {
		if(dao==null) dao=new LprodDaoImpl();
		return dao;
	}
	
	//SqlSession  ==> mapper접근
	private SqlSession sql;

	@Override
	public List<LprodVO> selectAll() {
		//선언
		List<LprodVO> list = null;
		
		//실행
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("lprod.selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			if(sql!=null) sql.close();
		}
		
		//리턴
		return list;
	}

}
