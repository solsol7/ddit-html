package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.vo.MemberVO;
import mybatis.config.MybatisUtil;

public class MemberDaoImpl implements IMemberDao{
	
	//자기 자신의 객체
	private static IMemberDao dao;
	
	private MemberDaoImpl() {}
	
	public static IMemberDao getInstance() {
		if(dao==null) dao = new MemberDaoImpl();
		return dao;
	}
	
	//mapper에 접근하는 SqlSession객체
	
	@Override
	public List<MemberVO> getAllMember() {
		// 변수 선언
		List<MemberVO> list = null;
		
		SqlSession sql = MybatisUtil.getSqlSession();
		
		try {
			list = sql.selectList("member.getAllMember");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.commit();
			sql.close();
		}
		
		return list;
	}

}
