package com.mycompany.webapp.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Ch15Aspect6Around {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch15Aspect6Around.class);

	@Around("execution(public * com.mycompany.webapp.controller.Ch15Controller.around(..))")
	public Object method(ProceedingJoinPoint joinPoint) throws Throwable {
		// 전처리
		// 호출되는 메서드에 대한 정보
		String methodName = joinPoint.getSignature().toShortString();
		LOGGER.info(methodName + " 전처리 내용");
		//
		Object result = joinPoint.proceed();
		//
		// 후처리
		LOGGER.info(methodName + " 후처리 내용");
		return result;
	}
}
