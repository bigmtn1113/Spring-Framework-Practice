package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch02")
public class Ch02Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch02Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		//요청처리
		LOGGER.info("실행");
		return "ch02/content";
	}
	
	//@RequestMapping(value="/getMethod", method=RequestMethod.GET)
	@GetMapping("/getMethod")
	public String getMethod() {
		LOGGER.info("실행");
		return "ch02/content";
	}
	
	//@RequestMapping(value="/postMethod", method=RequestMethod.POST)
	@PostMapping("/postMethod")
	public String postMethod() {
		LOGGER.info("실행");
		return "ch02/content";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		LOGGER.info("실행");
		return "ch02/joinForm";
	}
	
	//@GetMapping("/join")과 요청은 같지만 요청방식이 다르므로 다른 실행을 할수 있다.
	@PostMapping("/join")
	public String join() {
		LOGGER.info("실행");
		return "ch02/content";
	}
	
}
