package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mycompany.webapp.dao.Ch13BoardDao4;

public class Ch13Service1 {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch13Service2.class);
	
	public Ch13BoardDao4 getInstance() {
		LOGGER.info("실행");
		return new Ch13BoardDao4();
	}
}
