package com.mycompany.webapp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Ch16Account;
import com.mycompany.webapp.service.Ch16Service;

@Controller
@RequestMapping("/ch16")
public class Ch16Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch16Controller.class);

	@Autowired private Ch16Service service;

	@RequestMapping("/content")
	public String content(Model model) {
		LOGGER.info("실행");
		
		List<Ch16Account> list = service.getAccountList();
		model.addAttribute("list", list);
		
		return "ch16/content";
	}

	@RequestMapping("/transaction1")
	public String accountTransfer1(int fromAno, int toAno, int amount) {
		LOGGER.info("실행");
		
		service.transfer1(fromAno, toAno, amount);
		
		return "redirect:/ch16/content";
	}

	@RequestMapping("/transaction2")
	public String accountTransfer2(int fromAno, int toAno, int amount) {
		LOGGER.info("실행");
		
		service.transfer2(fromAno, toAno, amount);
		
		return "redirect:/ch16/content";
	}
}
