package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVO;
import kr.or.ddit.member.model.MemberVO;

public interface MemberServiceI {
	
	public MemberVO getMember(String userid);
	
	List<MemberVO> selectAllMember();
	
	/* List<MemberVO> selectMemberPageList(PageVO pageVo); */
	
	Map<String, Object> selectPagingComponent(Map<String, Object> paramMap);
	
	int insertMember(MemberVO memberVo);
	
	int deleteMember(String userId);

	int updateMember(MemberVO memberVo);
	
	int insertTransactionTest(MemberVO memberVo);
	
	Map<String, Object> searchMemberList(Map<String, Object> map);
	
	
}
