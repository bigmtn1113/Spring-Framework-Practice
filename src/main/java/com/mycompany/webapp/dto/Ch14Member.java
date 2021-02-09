package com.mycompany.webapp.dto;

import org.springframework.web.multipart.MultipartFile;

public class Ch14Member {
	private String mid;
	private String mname;
	private String mpassword;
	private boolean menabled;
	private String mrole;
	private String mphoto;
	private MultipartFile mphotoAttach;

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}

	public boolean isMenabled() {
		return menabled;
	}

	public void setMenabled(boolean menabled) {
		this.menabled = menabled;
	}

	public String getMrole() {
		return mrole;
	}

	public void setMrole(String mrole) {
		this.mrole = mrole;
	}

	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	public MultipartFile getMphotoAttach() {
		return mphotoAttach;
	}

	public void setMphotoAttach(MultipartFile mphotoAttach) {
		this.mphotoAttach = mphotoAttach;
	}
}
