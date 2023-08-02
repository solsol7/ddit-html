package member.service;

import java.util.List;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.vo.MemberVO;
import member.vo.ZipVO;

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
		return dao.getAllMember();
	}

	@Override
	public String selectById(String mid) {
		return dao.selectById(mid);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		return dao.selectByDong(dong);
	}

}
