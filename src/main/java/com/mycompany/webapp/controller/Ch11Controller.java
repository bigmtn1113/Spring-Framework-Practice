package com.mycompany.webapp.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Ch11City;
import com.mycompany.webapp.dto.Ch11Member;
import com.mycompany.webapp.dto.Ch11Skill;

@Controller
@RequestMapping("/ch11")
public class Ch11Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch11Controller.class);

	@RequestMapping("/content")
	public String content() {
		return "ch11/content";
	}	
	
	@GetMapping("/join1")
	public String join1_get(Ch11Member member) {
		logger.info("실행");
		member.setMnation("대한민국");
		
		return "ch11/join1";
	}
	
	@PostMapping("/join1")
	public String join1_post(Ch11Member member) {
		logger.info("실행");
		logger.info("mid: " + member.getMid());
		logger.info("mname: " + member.getMname());
		logger.info("mpassword: " + member.getMpassword());
		logger.info("mnation: " + member.getMnation());
		
		return "ch11/content";
	}	
	
	@GetMapping("/join2")
	public String join2_get(Ch11Member member, Model model) {
		logger.info("실행");
		
		List<String> typeList = Arrays.asList("일반회원", "기업회원", "헤드헌터회원");
		List<String> jobList = Arrays.asList("학생", "개발자", "디자이너");
		List<Ch11City> cityList = Arrays.asList(
				new Ch11City("서울","1"), new Ch11City("부산","2"), 
				new Ch11City("광주", "3"),  new Ch11City("대구", "4"), 
				new Ch11City("제주", "5"));
		
		model.addAttribute("typeList", typeList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("cityList", cityList);
		
		member.setMtype("기업회원");
		member.setMjob("개발자");
		member.setMcity("5");
		
		return "ch11/join2";
	}
	
	@PostMapping("/join2")
	public String join2_post(Ch11Member member) {
		logger.info("실행");
		logger.info("mtype: " + member.getMtype());
		logger.info("mjob: " + member.getMjob());
		logger.info("mcity: " + member.getMcity());
		
		return "ch11/content";
	}	
	
	@GetMapping("/join3")
	public String join3_get(Ch11Member member, Model model) {
		logger.info("실행");
		
		List<String> languageList =  Arrays.asList("C", "C++", "Java", "JavaScript");
		List<Ch11Skill> skillList = Arrays.asList(
				new Ch11Skill("JavaFX", "1"), 
				new Ch11Skill("Servlet/JSP", "2"), 
				new Ch11Skill("Spring", "3"));
		
		model.addAttribute("languageList", languageList);
		model.addAttribute("skillList", skillList);
		
		member.setMlanguage(new String[] {"Java", "JavaScript"});
		member.setMskill(new String[] {"2", "3"});
		
		return "ch11/join3";
	}
	
	@PostMapping("/join3")
	public String join3_post(Ch11Member member) {
		logger.info("실행");
		logger.info("mlanguage: " + Arrays.toString(member.getMlanguage()));
		logger.info("mskill: " + Arrays.toString(member.getMskill()));
		
		return "ch11/content";
	}	
	
	@GetMapping("/join4")
	public String join4_get(Ch11Member member, Model model) {
		logger.info("실행");
		
		List<String> typeList = Arrays.asList("일반회원", "기업회원", "헤드헌터회원");
		List<Ch11City> cityList = Arrays.asList(
				new Ch11City("서울","1"), new Ch11City("부산","2"), 
				new Ch11City("광주", "3"),  new Ch11City("대구", "4"), 
				new Ch11City("제주", "5"));
		
		model.addAttribute("typeList", typeList);
		model.addAttribute("cityList", cityList);
		
		member.setMtype("기업회원");
		member.setMcity("5");
		
		return "ch11/join4";
	}
	
	@PostMapping("/join4")
	public String join4_post(Ch11Member member) {
		logger.info("실행");
		logger.info("mtype: " + member.getMtype());
		logger.info("mcity: " + member.getMcity());
		
		return "ch11/content";
	}
	
	@GetMapping("/join5")
	public String join5_get(Ch11Member member) {
		logger.info("실행");
		
		return "ch11/join5";
	}
	
	@Autowired private MessageSource messageSource;
	
	@PostMapping("/join5")
	public String join5_post(Ch11Member member) {
		logger.info("실행");
		
		Locale locale = LocaleContextHolder.getLocale();
		String emailText = messageSource.getMessage("join.form.email", null, locale);
		logger.info("국제화 이메일 문자: " + emailText);
		
		return "ch11/content";
	}
}
