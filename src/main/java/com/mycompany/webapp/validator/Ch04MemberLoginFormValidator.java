package com.mycompany.webapp.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.webapp.dto.Ch04Member;

public class Ch04MemberLoginFormValidator implements Validator {
	private static final Logger logger = LoggerFactory.getLogger(Ch04MemberLoginFormValidator.class);

	@Override
	public boolean supports(Class<?> clazz) {
		logger.info("실행 - 유효성 검사가 가능한지 확인");
		boolean support = Ch04Member.class.isAssignableFrom(clazz);
		return support;
	}

	@Override
	public void validate(Object target, Errors errors) {
		logger.info("실행 - 각 필드마다 유효성 검사 실시");
		Ch04Member member = (Ch04Member)target;
		
		if (member.getMid() == null || member.getMid().trim().equals("")) {
			errors.rejectValue("mid", "errors.mid.required");
		} else if(member.getMid().length() < 4) {
			errors.rejectValue("mid", "errors.mid.minlength", new Object[] {4}, "회원 아이디는 4자 이상이여야 합니다.");
		}
		
		if (member.getMpassword() == null || member.getMpassword().trim().equals("")) {
			errors.rejectValue("mpassword", "errors.mpassword.required");
		} else if(member.getMpassword().length() < 8) {
			errors.rejectValue("mpassword", "errors.mpassword.minlength", new Object[] {8}, "");
		}
	}
	
	
}
