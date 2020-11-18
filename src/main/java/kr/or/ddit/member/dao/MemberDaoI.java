package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.common.model.SearchVO;
import kr.or.ddit.member.model.MemberVO;

public interface MemberDaoI {

	public MemberVO getMember(String userid);

	public List<MemberVO> selectAllMember();

	public List<MemberVO> selectMemberPageList(Map<String, Object> map);

	public int selectMemberTotalCnt(SearchVO search);

	public int insertMember(MemberVO memberVo);

	public int deleteMember(String userId);

	public int updateMember(MemberVO memberVo);

}
