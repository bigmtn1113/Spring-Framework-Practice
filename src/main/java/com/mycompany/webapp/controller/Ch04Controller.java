package com.mycompany.webapp.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Ch04Member;
import com.mycompany.webapp.validator.Ch04MemberJoinFormValidator;
import com.mycompany.webapp.validator.Ch04MemberLoginFormValidator;

@Controller
@RequestMapping("/ch04")
public class Ch04Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch04Controller.class);

	@RequestMapping("/content")
	public String content() {
		LOGGER.info("실행");
		return "ch04/content";
	}

	@PostMapping("/join")
	public String join(@ModelAttribute("joinForm") @Valid Ch04Member member, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			//forward(JSP 양식 폼으로 이동)
			return "ch04/content";
		}
		
		LOGGER.info("실행");
		return "redirect:/ch01/content";
	}
	
	@InitBinder("joinForm")
	public void joinForm(WebDataBinder binder) {
		binder.setValidator(new Ch04MemberJoinFormValidator());
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute("loginForm") @Valid Ch04Member member, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "ch04/content";
		}
		
		LOGGER.info("실행");
		return "redirect:/ch01/content";
	}
	
	@InitBinder("loginForm")
	public void loginForm(WebDataBinder binder) {
		binder.setValidator(new Ch04MemberLoginFormValidator());
	}

}
