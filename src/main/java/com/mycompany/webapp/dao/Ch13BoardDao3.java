package com.mycompany.webapp.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Ch13BoardDao3 {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch13BoardDao3.class);
	
	private Ch13BoardDao3(String str) {
		LOGGER.info("실행");
	}
	
	public static Ch13BoardDao3 getInstance() {
		return new Ch13BoardDao3("매개값");
	}
	
	public void method() {
		LOGGER.info("실행");
	}
}
