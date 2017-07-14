package com.wooltari.mockTest.examFiles;

public class ExamFiles {
	private int num;
	private int mockExamNum; // rowNum
	private String examInfoName;
	private String questionSubject;
	private String today;
	
	// 있어도 그만, 없어도 그만
	private String cbt; // cbt
	private String scale; // 시험범위
	private String clearScore; // 합격점수
	private String fail; // 불합격

	// 응시 전 / 후	
	private String beforAafter;
	
	private String exam;
	private String answer; // 회원이 선택한 답
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMockExamNum() {
		return mockExamNum;
	}
	public void setMockExamNum(int mockExamNum) {
		this.mockExamNum = mockExamNum;
	}
	public String getExamInfoName() {
		return examInfoName;
	}
	public void setExamInfoName(String examInfoName) {
		this.examInfoName = examInfoName;
	}
	public String getQuestionSubject() {
		return questionSubject;
	}
	public void setQuestionSubject(String questionSubject) {
		this.questionSubject = questionSubject;
	}
	public String getCbt() {
		return cbt;
	}
	public void setCbt(String cbt) {
		this.cbt = cbt;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getClearScore() {
		return clearScore;
	}
	public void setClearScore(String clearScore) {
		this.clearScore = clearScore;
	}
	public String getFail() {
		return fail;
	}
	public void setFail(String fail) {
		this.fail = fail;
	}
	public String getBeforAafter() {
		return beforAafter;
	}
	public void setBeforAafter(String beforAafter) {
		this.beforAafter = beforAafter;
	}
	public String getExam() {
		return exam;
	}
	public void setExam(String exam) {
		this.exam = exam;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
