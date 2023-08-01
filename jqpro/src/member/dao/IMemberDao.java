package member.dao;

import java.util.List;

import member.vo.MemberVO;
import member.vo.ZipVO;

public interface IMemberDao {
	
	//메소드 선언
	public List<MemberVO> getAllMember();
	
	//중복검사
	public String selectById(String mid);
	
	//회원가입을 위한 메소드
	public int insertMember(MemberVO vo);
	
	//우편번호 검색 메서드(동)
	public List<ZipVO> selectByDong(String dong);
}
