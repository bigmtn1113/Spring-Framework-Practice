package com.mycompany.webapp.aspect;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
@Aspect
public class Ch15Aspect8Around {
	@Around("execution(public * com.mycompany.webapp.controller.Ch15Controller.boardList(..))")
	public Object method(ProceedingJoinPoint joinPoint) throws Throwable {
		// 전처리
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		HttpServletResponse response = sra.getResponse();
		HttpSession session = request.getSession();

		String mid = (String) session.getAttribute("sessionMid");
		if (mid == null) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", "loginNeed");
			String json = jsonObject.toString();

			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(json);
			out.flush();
			out.close();
			
			return null;
		} else {
			//
			Object result = joinPoint.proceed();
			//
			// 후처리

			return result;
		}
	}
}
