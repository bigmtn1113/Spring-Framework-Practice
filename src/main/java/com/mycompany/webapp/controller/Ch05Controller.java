package com.mycompany.webapp.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch05")
public class Ch05Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch05Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		return "ch05/content";
	}
	
	@GetMapping("/method1")
	public String method1(@RequestHeader("user-Agent") String userAgent, HttpServletRequest request) {
		LOGGER.info("실행");
		LOGGER.info(userAgent);
		
		String browserKind = "unknown";
		if (userAgent.contains("Chrome") && userAgent.contains("Edg")) {
			//Edge
			browserKind = "Edge";
		} else if (userAgent.contains("Chrome")) {
			//Chrome
			browserKind = "Chrome";
		} else if (userAgent.contains("Trident/7.0")) {
			//Internet Explorer 11
			browserKind = "IE11";
		}
		
		request.setAttribute("browserKind", browserKind);
		return "ch05/content";
	}
	
	@GetMapping("/method2")
	public String method2(HttpServletResponse response) {
		Cookie cookie1 = new Cookie("mid", "fall");
		Cookie cookie2 = new Cookie("memail", "fall@mycompany.com");
		
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		return "ch05/content";
	}
	
	@GetMapping("/method3")
	public String method3(@CookieValue String mid, @CookieValue("memail") String email, HttpServletRequest request) {
		request.setAttribute("mid", mid);
		request.setAttribute("memail", email);
		return "ch05/content";
	}
}
