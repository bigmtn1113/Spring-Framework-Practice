package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/ch09")
public class Ch09Controller {
	private static final Logger LOGGER = LoggerFactory.getLogger(Ch09Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		return "ch09/content";
	}
	
	@PostMapping("/boardUpload")
	public String boardUpload(String title, String content, MultipartFile attach) {
		LOGGER.info("title: + " + title);
		LOGGER.info("content: + " + content);
		
		if(!attach.isEmpty()) {
			LOGGER.info("attach file name: " + attach.getOriginalFilename());
			LOGGER.info("attach file size: " + attach.getSize());
			LOGGER.info("attach file type: " + attach.getContentType());
			
			// 중복 방지를 위해 파일 앞에 시간 붙이기
			String saveFileName = new Date().getTime() + "_" + attach.getOriginalFilename();
			try {
				attach.transferTo(new File("C:/MyWorkspace/Temp/upload/" + saveFileName));
			} catch (Exception e) {}
		}
		
		return "ch09/content";
	}
	
	/*@PostMapping("/boardUpload")
	public String boardUpload(Ch09Board board) {
		LOGGER.info("title: + " + board.getTitle());
		LOGGER.info("content: + " + board.getContent());
		
		if(!board.getAttach().isEmpty()) {
			LOGGER.info("attach file name: " + board.getAttach().getOriginalFilename());
			LOGGER.info("attach file size: " + board.getAttach().getSize());
			LOGGER.info("attach file type: " + board.getAttach().getContentType());
			
			// 중복 방지를 위해 파일 앞에 시간 붙이기
			String saveFileName = new Date().getTime() + "_" + board.getAttach().getOriginalFilename();
			try {
				board.getAttach().transferTo(new File("C:/MyWorkspace/Temp/upload/" + saveFileName));
			} catch (Exception e) {}
		}
		
		return "ch09/content";
	}*/
	
	@PostMapping("/boardUploadAjax")
	public String boardUploadAjax(String title, String content, MultipartFile attach, Model model) {
		LOGGER.info("title: + " + title);
		LOGGER.info("content: + " + content);
		if(!attach.isEmpty()) {
			LOGGER.info("attach file name: " + attach.getOriginalFilename());
			LOGGER.info("attach file size: " + attach.getSize());
			LOGGER.info("attach file type: " + attach.getContentType());
			
			// 중복 방지를 위해 파일 앞에 시간 붙이기
			String saveFileName = new Date().getTime() + "_" + attach.getOriginalFilename();
			try {
				attach.transferTo(new File("C:/MyWorkspace/Temp/upload/" + saveFileName));
			} catch (Exception e) {}
		}
		
		File uploadDir = new File("C:/MyWorkspace/Temp/upload");
		String[] fileNames = uploadDir.list();
		model.addAttribute("fileNames", fileNames);
		
		return "ch09/getFileList";
	}
	
	@GetMapping("/getFileList")
	public String getFileList(Model model) {
		File uploadDir = new File("C:/MyWorkspace/Temp/upload");
		String[] fileNames = uploadDir.list();
		model.addAttribute("fileNames", fileNames);
		
		return "ch09/getFileList";
	}
	
	@GetMapping("/download")
	public void download(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		LOGGER.info("fileName: " + fileName);
		
		//파일의 데이터를 읽기 위한 입력 스트림 얻기
		String saveFilePath = "C:/MyWorkspace/Temp/upload/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
		
		//응답 HTTP 헤더 구성
		//1)Content-Type 헤더 구성
		ServletContext application = request.getServletContext();
		String fileType = application.getMimeType(fileName);
		response.setContentType(fileType);
		
		//2)Content-Disposition 헤더 구성
		String originalFileName = fileName.split("_")[1];
		originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");	//한글 아스키코드화
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");
		
		//3)Content-Length 헤더 구성(다운로드할 파일의 크기를 지정)
		int fileSize = (int)new File(saveFilePath).length();
		response.setContentLength(fileSize);
		
		//응답 HTTP의 바디(본문) 구성
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}
}
