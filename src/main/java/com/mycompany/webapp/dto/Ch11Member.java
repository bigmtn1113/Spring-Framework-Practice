package com.mycompany.webapp.dto;

public class Ch11Member {
	private String mid;
	private String mname;
	private String mpassword;
	private String mnation;
	private String mtype;
	private String mjob;
	private String mcity;
	private String[] mlanguage;
	private String[] mskill;

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

	public String getMnation() {
		return mnation;
	}

	public void setMnation(String mnation) {
		this.mnation = mnation;
	}

	public String getMtype() {
		return mtype;
	}

	public void setMtype(String mtype) {
		this.mtype = mtype;
	}

	public String getMjob() {
		return mjob;
	}

	public void setMjob(String mjob) {
		this.mjob = mjob;
	}

	public String getMcity() {
		return mcity;
	}

	public void setMcity(String mcity) {
		this.mcity = mcity;
	}

	public String[] getMlanguage() {
		return mlanguage;
	}

	public void setMlanguage(String[] mlanguage) {
		this.mlanguage = mlanguage;
	}

	public String[] getMskill() {
		return mskill;
	}

	public void setMskill(String[] mskill) {
		this.mskill = mskill;
	}
}
