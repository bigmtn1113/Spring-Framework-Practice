package com.mycompany.webapp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Ch14Board;
import com.mycompany.webapp.service.Ch14Service;

@Controller
@RequestMapping("/ch15")
public class Ch15Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch15Controller.class);

	@Autowired private Ch14Service service;

	@RequestMapping("/content")
	public String content() {
		LOGGER.info("실행");

		return "ch15/content";
	}

	@RequestMapping("/before")
	public String before() {
		LOGGER.info("실행");

		return "ch15/content";
	}

	@RequestMapping("/after")
	public String after() {
		LOGGER.info("실행");

		return "ch15/content";
	}

	@RequestMapping("/afterReturning")
	public String afterReturning() {
		LOGGER.info("실행");

		return "ch15/content";
	}

	@RequestMapping("/afterThrowing")
	public String afterThrowing() {
		LOGGER.info("실행");

		if (true) {
			throw new RuntimeException("테스트 예외");
		}

		return "ch15/content";
	}

	@RequestMapping("/around")
	public String around() {
		LOGGER.info("실행");

		return "ch15/content";
	}

	@RequestMapping("/runtimeCheck")
	public String runtimeCheck() {
		LOGGER.info("실행");

		for (int i = 0; i < 1000000; ++i) {
			int result = i * 10;
		}

		return "ch15/content";
	}

	@RequestMapping("/boardList")
	public String boardList(Model model) {
		LOGGER.info("실행");

		List<Ch14Board> list = service.getBoardList();
		model.addAttribute("list", list);

		LOGGER.info("갯수: " + list.size());

		return "ch15/boardList";
	}
}
