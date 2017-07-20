package com.wooltari.study;

public class StudyCategory {
	private int categoryNum;
	private String subject , p_subject;
	private int parent;
	
	
	public String getP_subject() {
		return p_subject;
	}
	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	
}
