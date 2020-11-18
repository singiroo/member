package kr.or.ddit.member.model;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class MemberVOValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO memberVo = (MemberVO)target;
		if(memberVo.getUserId() == null || "".equals(memberVo.getUserId())) {
			errors.rejectValue("userId", "requiredId");
		}
		
		if(memberVo.getUserNm() == null || "".equals(memberVo.getUserNm())) {
			errors.rejectValue("userNm", "requiredNm");
		}
		
		
		if(memberVo.getPass() == null || "".equals(memberVo.getPass())) {
			errors.rejectValue("pass", "requiredPass");
		}
		
	}
	
	
}
