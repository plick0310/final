package com.wooltari.mockTest;

public class MockTest {
	
	// 응시할 리스트 
	private int num;
	private int wishlistNum;
	private String userId;
	private Integer dday;
	private Integer gap;
	private String examInfoName;
	private String examInfoOrgan;
	private String questionSubject;
	private String examwishDate;
	private String checkMode;
	
	
	// 모의 테스트 & 문제 DB
	private int testNum; // 시험번호
	private String created; // 생성일
	
	// 응시내역
	
	
	public String getCheckMode() {
		return checkMode;
	}
	public int getTestNum() {
		return testNum;
	}
	public void setTestNum(int testNum) {
		this.testNum = testNum;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public void setCheckMode(String checkMode) {
		this.checkMode = checkMode;
	}
	public Integer getGap() {
		return gap;
	}
	public void setGap(Integer gap) {
		this.gap = gap;
	}
	public void setDday(Integer dday) {
		this.dday = dday;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getWishlistNum() {
		return wishlistNum;
	}
	public void setWishlistNum(int wishlistNum) {
		this.wishlistNum = wishlistNum;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
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
	public String getExamwishDate() {
		return examwishDate;
	}
	public void setExamwishDate(String examwishDate) {
		this.examwishDate = examwishDate;
	}
}
