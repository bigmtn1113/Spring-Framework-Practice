package com.mycompany.webapp.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Component
@ControllerAdvice
public class Ch10ExceptionHandler {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch10ExceptionHandler.class);
	
	@ExceptionHandler
	public String handleException(NullPointerException e) {
		LOGGER.info("NullPointerException 실행");
		return "ch10/nullPointerException";
	}
	
	@ExceptionHandler
	public String handleException(RuntimeException e) {
		LOGGER.info("RuntimeException 실행");
		return "ch10/runtimeException";
	}
	
	@ExceptionHandler
	public String handleException(Ch10NotFoundAccountException e) {
		LOGGER.info("Ch10NotFoundAccountException 실행");
		
		/*String message = e.getMessage();
		if (message.equals("입금 계좌 없음")) {
			
		} else {
			
		}*/
		return "ch10/notFoundAccountException";
	}
}
