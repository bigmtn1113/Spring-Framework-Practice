package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch12")
public class Ch12Controller {
	
	@RequestMapping("/content")
	public String content() {
		return "ch12/content";
	}	
	
	@GetMapping("/fileList")
	public String fileList() {
		return "ch12FileListView";
	}
	
	@GetMapping("/fileDownload")
	public String fileDownload(String fileName, Model model) {
		model.addAttribute("fileName", fileName);
		
		return "ch12FileDownloadView";
	}
	
	/*@GetMapping("/fileDownload")
	public String fileDownload(@ModelAttribute("fileName") String fileName) {
		return "ch12FileDownloadView";
	}*/
}
