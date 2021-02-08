package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.Ch13BoardDao1;
import com.mycompany.webapp.dao.Ch13BoardDao2;
import com.mycompany.webapp.dao.Ch13BoardDao3;

@Service
public class Ch13Service5 {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch13Service5.class);
	
	@Autowired private Ch13BoardDao1 dao1;
	private Ch13BoardDao2 dao2;
	private Ch13BoardDao3 dao3;
	
	@Autowired
	public Ch13Service5(Ch13BoardDao2 dao2) {
		LOGGER.info("실행");
		this.dao2 = dao2;
	}
	
	@Autowired
	public void setDao3(Ch13BoardDao3 dao3) {
		LOGGER.info("실행");
		this.dao3 = dao3;
	}

	public void method() {
		LOGGER.info("실행");
		dao1.method();
		dao2.method();
		dao3.method();
	}
}
