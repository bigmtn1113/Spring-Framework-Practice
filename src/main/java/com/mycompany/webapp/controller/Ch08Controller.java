package com.mycompany.webapp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mycompany.webapp.dto.Ch08InputForm;

@Controller
@RequestMapping("/ch08")
@SessionAttributes({"inputForm"})
public class Ch08Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch08Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		return "ch08/content";
	}
	
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		if(mid.equals("admin") && mpassword.equals("12345")) {
			session.setAttribute("sessionMid", mid);
		}
		
		return "redirect:/ch01/content";
	}
	
	@GetMapping("/userinfo")
	public String userinfo(@SessionAttribute("sessionMid") String mid, HttpSession session) {
		//String mid = (String)session.getAttribute("sessionMid");
		LOGGER.info(mid);
		return "ch08/content";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//session.removeAttribute("sessionMid");
		session.invalidate();
		return "redirect:/ch01/content";
	}
	
	//-------------------------------------------------------
	
	@ModelAttribute("inputForm")         
	public Ch08InputForm createInputForm() {
		LOGGER.info("실행");
		return new Ch08InputForm();
	}
	
	@GetMapping("/inputStep1")
	public String inputStep1(@ModelAttribute("inputForm") Ch08InputForm inputForm) {	//세션에 동일한 이름이 있으면 세션 객체를 inputForm에 대입. 없으면 예외 발생
		return "ch08/inputStep1";
	}
	
	@PostMapping("/inputStep2")
	public String inputStep2(@ModelAttribute("inputForm") Ch08InputForm inputForm) {
		LOGGER.info("data1: " + inputForm.getData1());
		LOGGER.info("data2: " + inputForm.getData2());
		return "ch08/inputStep2";
	}
	
	@PostMapping("/inputDone")
	public String inputDone(@ModelAttribute("inputForm") Ch08InputForm inputForm, SessionStatus sessionStatus) {
		LOGGER.info("data1: " + inputForm.getData1());
		LOGGER.info("data2: " + inputForm.getData2());
		LOGGER.info("data3: " + inputForm.getData3());
		LOGGER.info("data4: " + inputForm.getData4());
		sessionStatus.setComplete();
		return "redirect:/ch01/content";
	}
}
