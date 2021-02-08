package com.mycompany.webapp.service;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Ch13Service4 {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch13Service3.class);
	
	private List skillList;
	private Set skillSet;
	private Map skillMap;
	private Properties skillProp;

	public void setSkillList(List skillList) {
		LOGGER.info("실행");
		this.skillList = skillList;
	}

	public void setSkillSet(Set skillSet) {
		LOGGER.info("실행");
		this.skillSet = skillSet;
	}

	public void setSkillMap(Map skillMap) {
		LOGGER.info("실행");
		this.skillMap = skillMap;
	}

	public void setSkillProp(Properties skillProp) {
		LOGGER.info("실행");
		this.skillProp = skillProp;
	}
}
