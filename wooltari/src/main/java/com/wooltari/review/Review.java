package com.wooltari.review;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.wooltari.study.StudyCategory;
import com.wooltari.study.StudyLocal;

public class Review {
	private int num,listNum,s_num,hitCount;
	private String subject,content,created;
	private String imageFileName;
	private String userId,userName;
	private MultipartFile upload;
	private int star;
	private String studyName;
	
	private int range;
	
	private List<StudyCategory> listCategory; // 카테고리 객체를 저장하는 리스트
	private List<String> choiceCategory; // JSP에서 카테고리를 리스트로 받음
	private String category;
	
	private List<StudyLocal> listLocal; // 지역 객체를 저장하는 리스트
	private List<String> choiceCity; // JSP에서 지역을 리스트로 받음
	private String city;
	
	
	
	
	public List<StudyCategory> getListCategory() {
		return listCategory;
	}
	public void setListCategory(List<StudyCategory> listCategory) {
		this.listCategory = listCategory;
	}
	public List<String> getChoiceCategory() {
		return choiceCategory;
	}
	public void setChoiceCategory(List<String> choiceCategory) {
		this.choiceCategory = choiceCategory;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<StudyLocal> getListLocal() {
		return listLocal;
	}
	public void setListLocal(List<StudyLocal> listLocal) {
		this.listLocal = listLocal;
	}
	public List<String> getChoiceCity() {
		return choiceCity;
	}
	public void setChoiceCity(List<String> choiceCity) {
		this.choiceCity = choiceCity;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	
	
}
