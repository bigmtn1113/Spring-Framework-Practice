package com.mycompany.webapp.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
@Qualifier("ch13BoardDao6Qualifier")
public class Ch13BoardDao6 implements Ch13BoardDao{
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch13BoardDao6.class);

	@Override
	public void method() {
		LOGGER.info("실행");
	}
}
