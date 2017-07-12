package com.wooltari.mockTest.exam;

public class Exam {
	private int num;
	private int examlistNum;
	private String examInfoName;
	private String examInfoOrgan;
	private String questionSubject;
	private String created;
	private long gap;
	
	
	
	public int getExamlistNum() {
		return examlistNum;
	}
	public void setExamlistNum(int examlistNum) {
		this.examlistNum = examlistNum;
	}
	public long getGap() {
		return gap;
	}
	public void setGap(long gap) {
		this.gap = gap;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getExamInfoName() {
		return examInfoName;
	}
	public void setExamInfoName(String examInfoName) {
		this.examInfoName = examInfoName;
	}
	public String getExamInfoOrgan() {
		return examInfoOrgan;
	}
	public void setExamInfoOrgan(String examInfoOrgan) {
		this.examInfoOrgan = examInfoOrgan;
	}
	public String getQuestionSubject() {
		return questionSubject;
	}
	public void setQuestionSubject(String questionSubject) {
		this.questionSubject = questionSubject;
	}
}
