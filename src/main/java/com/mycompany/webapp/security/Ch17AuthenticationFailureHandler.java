package com.mycompany.webapp.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class Ch17AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch17AuthenticationFailureHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		LOGGER.info("실행");
		
		if (super.isUseForward()) {
			LOGGER.info("포워드");
			
			request.setAttribute("mid", request.getParameter("mid"));
		} else {
			LOGGER.info("리다이렉트");
			
			HttpSession session = request.getSession();
			session.setAttribute("mid", request.getParameter("mid"));
		}
		super.onAuthenticationFailure(request, response, exception);
	}
}
