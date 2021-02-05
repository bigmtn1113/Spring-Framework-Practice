package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.exception.Ch10NotFoundAccountException;

@Controller
@RequestMapping("/ch10")
public class Ch10Controller {
	
	@RequestMapping("/content")
	public String content() {
		return "ch10/content";
	}
	
	@RequestMapping("/runtimeException")
	public String runtimeException() {
		String data = null;
		int length = data.length();	// 500 에러(NullPointerException) 발생
		return "ch10/content";
	}
	
	@RequestMapping("/customException")
	public String customException() {
		if(true) {
			//예외 발생 코드
			findAccount();
		}
		
		return "ch10/content";
	}
	
	public boolean findAccount() throws Ch10NotFoundAccountException{
		if(true) {
			//예외 발생 코드
			throw new Ch10NotFoundAccountException("입금 계좌가 없음");
		}
		
		return true;
	}
}
