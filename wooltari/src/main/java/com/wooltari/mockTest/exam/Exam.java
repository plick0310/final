package com.wooltari.mockTest.exam;

public class Exam {
	private int num;
	private int testNum;
	private String examInfoName;
	private String examInfoOrgan;
	private String questionSubject;
	private String created;
	private long s_num;
	
	
	public long getS_num() {
		return s_num;
	}
	public void setS_num(long s_num) {
		this.s_num = s_num;
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
	public int getTestNum() {
		return testNum;
	}
	public void setTestNum(int testNum) {
		this.testNum = testNum;
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
