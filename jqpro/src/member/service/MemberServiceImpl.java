package member.service;

import java.util.List;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private static IMemberService service;
	
	private MemberServiceImpl() {}
	
	public static IMemberService getInstance() {
		if(service==null) service=new MemberServiceImpl();
		return service;
	}
	
	IMemberDao dao = MemberDaoImpl.getInstance();
	
	
	
	@Override
	public List<MemberVO> getAllMember() {
		// TODO Auto-generated method stub
		return dao.getAllMember();
	}

}
