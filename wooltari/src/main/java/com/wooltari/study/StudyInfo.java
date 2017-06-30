package com.wooltari.study;

import java.util.List;

public class StudyInfo {
	private long s_num;
	private String userId;
	private String studyName, study_Info, created; // 스터디명,스터디한줄소개,스터디생성일
	private String imageFileName, gender;// 스터디사진,스터디성별
	private int recruit, range;// 모집인원 , 스터디 공개 범위

	private String[] target =null;// 모집대상
	private String s_target;
	
	private List<String> choiceCategory; // 선택카테고리
	private String category;
	
	private List<String> choiceCity; // 선택 도시
	private String city;
	
	
	
	
	public String getS_target() {
		return s_target;
	}

	public void setS_target(String s_target) {
		this.s_target = s_target;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public long getS_num() {
		return s_num;
	}

	public void setS_num(long s_num) {
		this.s_num = s_num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	public String getStudy_Info() {
		return study_Info;
	}

	public void setStudy_Info(String study_Info) {
		this.study_Info = study_Info;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getRecruit() {
		return recruit;
	}

	public void setRecruit(int recruit) {
		this.recruit = recruit;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public String[] getTarget() {
		return target;
	}

	public void setTarget(String[] target) {
		this.target = target;
	}


	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<String> getChoiceCategory() {
		return choiceCategory;
	}

	public void setChoiceCategory(List<String> choiceCategory) {
		this.choiceCategory = choiceCategory;
	}

	public List<String> getChoiceCity() {
		return choiceCity;
	}

	public void setChoiceCity(List<String> choiceCity) {
		this.choiceCity = choiceCity;
	}

	
 
	
}
