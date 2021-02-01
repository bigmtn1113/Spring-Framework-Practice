package com.mycompany.webapp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch06")
public class Ch06Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch06Controller.class);
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request) {
		LOGGER.info("실행");
		String param1 = "spring";
		String param2 = "summer";
		
		request.setAttribute("param1", param1);
		request.setAttribute("param2", param2);
		return "ch06/content";
	}
	
	@GetMapping("/forward")
	public String forward(HttpServletRequest request) {
		String param1 = "fall";
		String param2 = "winter";
		
		request.setAttribute("param1", param1);
		request.setAttribute("param2", param2);
		return "ch06/forwarded";
	}
	
	@GetMapping("/redirect")
	public String redirect(HttpServletRequest request, HttpSession session) {
		String param1 = "spring";
		String param2 = "summer";
		String param3 = "fall";
		String param4 = "winter";
		String param5 = "늦가을";
		String param6 = "늦겨울";
		
		request.setAttribute("param1", param1);
		request.setAttribute("param2", param2);
		session.setAttribute("param3", param3);
		session.setAttribute("param4", param4);
		try {
			param5 = URLEncoder.encode(param5, "UTF-8");
			param6 = URLEncoder.encode(param6, "UTF-8");
		} catch (UnsupportedEncodingException e) {}
		
		return "redirect:/ch06/redirected?param5=" + param5 + "&param6=" + param6;
	}
	
	@GetMapping("/redirected")
	public String redirected(String param5, String param6, HttpServletRequest request) {
		try {
			param5 = URLDecoder.decode(param5, "UTF-8");
			param6 = URLDecoder.decode(param6, "UTF-8");
		} catch (UnsupportedEncodingException e) {}
		
		request.setAttribute("param5", param5);
		request.setAttribute("param6", param6);
		return "ch06/redirected";
	}
}
