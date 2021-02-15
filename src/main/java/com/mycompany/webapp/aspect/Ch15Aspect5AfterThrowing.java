package com.mycompany.webapp.aspect;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Ch15Aspect5AfterThrowing {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch15Aspect5AfterThrowing.class);

	@AfterThrowing(pointcut = "execution(public * com.mycompany.webapp.controller.Ch15Controller.afterThrowing(..))", throwing = "ex")
	public void method(Throwable ex) {
		LOGGER.info("후처리 내용");
		LOGGER.info(ex.toString());
	}
}
