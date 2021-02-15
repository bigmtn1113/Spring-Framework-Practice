package com.mycompany.webapp.aspect;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Ch15Aspect4AfterReturning {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch15Aspect4AfterReturning.class);

	@AfterReturning("execution(public * com.mycompany.webapp.controller.Ch15Controller.afterReturning(..))")
	public void method() {
		LOGGER.info("후처리 내용");
	}
}
