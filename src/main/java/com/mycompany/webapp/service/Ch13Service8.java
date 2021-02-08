package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Ch13Service8 {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch13Service8.class);
	
	private int prop1;
	private double prop2;
	private boolean prop3;
	private String prop4;
	
	public Ch13Service8(int prop1, double prop2) {
		LOGGER.info("실행");
		this.prop1 = prop1;
		this.prop2 = prop2;
	}
	
	public void setProp3(boolean prop3) {
		LOGGER.info("실행");
		this.prop3 = prop3;
	}
	public void setProp4(String prop4) {
		LOGGER.info("실행");
		this.prop4 = prop4;
	}
	
	public void method() {
		LOGGER.info("prop1: " + prop1);
		LOGGER.info("prop2: " + prop2);
		LOGGER.info("prop3: " + prop3);
		LOGGER.info("prop4: " + prop4);
	}
	
}
