package com.mycompany.webapp.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
@Aspect
public class Ch15Aspect7Around {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch15Aspect7Around.class);

	@Around("execution(public * com.mycompany.webapp.controller.Ch15Controller.runtimeCheck(..))")
	public Object method(ProceedingJoinPoint joinPoint) throws Throwable {
		// 전처리
		long startTime = System.nanoTime();
		//
		Object result = joinPoint.proceed();
		//
		// 후처리
		long finishTime = System.nanoTime();
		LOGGER.info("실행 시간: " + (finishTime - startTime));

		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		request.setAttribute("runtime", (finishTime - startTime));

		return result;
	}
}
