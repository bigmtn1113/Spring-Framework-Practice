package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch01")
public class Ch01Controller {
	
	@RequestMapping("/content")
	public String content() {
		return "ch01/content";
	}
}
