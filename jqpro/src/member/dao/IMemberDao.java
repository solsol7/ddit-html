package member.dao;

import java.util.List;

import member.vo.MemberVO;

public interface IMemberDao {
	
	//메소드 선언
	public List<MemberVO> getAllMember();
}
