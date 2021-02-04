package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class Ch09Board {
	private String title;
	private String content;
	private MultipartFile attach;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
}
