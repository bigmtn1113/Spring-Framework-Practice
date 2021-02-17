package com.mycompany.webapp.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Ch14Member;
import com.mycompany.webapp.service.Ch14Service;

@Controller
@RequestMapping("/ch17")
public class Ch17Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch17Controller.class);

	@RequestMapping("/content")
	public String content() {
		return "ch17/content";
	}

	@GetMapping("/loginForm")
	public String loginForm() {
		return "ch17/loginForm";
	}

	@RequestMapping("/loginInfo")
	public String loginInfo() {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();

		// 로그인 여부
		if (authentication.isAuthenticated()) {
			String mid = authentication.getName();
			LOGGER.info("로그인한 아이디: " + mid);

			for (GrantedAuthority authority : authentication.getAuthorities()) {
				String role = authority.getAuthority();
				LOGGER.info("로그인한 아이디의 권한: " + role);
			}

			WebAuthenticationDetails details = (WebAuthenticationDetails) authentication.getDetails();
			String clientIp = details.getRemoteAddress();
			LOGGER.info("로그인한 PC IP: " + clientIp);
		}

		return "ch17/content";
	}

	@RequestMapping("/adminAction")
	public String adminAction() {
		return "redirect:/ch14/content";
	}

	@RequestMapping("/managerAction")
	public String managerAction() {
		return "redirect:/ch13/content";
	}

	@RequestMapping("/userAction")
	public String userAction() {
		return "redirect:/ch07/content";
	}

	@RequestMapping("/error403")
	public String error403() {
		return "ch17/error403";
	}

	@RequestMapping("/encodePassword")
	public String encodePassword(String mpassword) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(mpassword);
		LOGGER.info("암호화된 비밀번호: " + encodedPassword);

		return "ch17/content";
	}

	@Resource private Ch14Service service;

	@PostMapping("/join")
	public String join(Ch14Member member) throws IllegalStateException, IOException {
		LOGGER.info("실행");
		if (!member.getMphotoAttach().isEmpty()) {
			String originalFileName = member.getMphotoAttach().getOriginalFilename();
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveName = member.getMid() + extName;
			File dest = new File("C:/MyWorkspace/photo/" + saveName);
			
			member.getMphotoAttach().transferTo(dest);
			member.setMphoto(saveName);
		} else {
			member.setMphoto("unnamed.png");
		}

		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(member.getMpassword());
		member.setMpassword(encodedPassword);
		member.setMenabled(true);
		
		service.join(member);
		
		return "redirect:/ch17/content";
	}
}
