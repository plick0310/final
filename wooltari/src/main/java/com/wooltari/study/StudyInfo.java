package com.wooltari.study;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StudyInfo {
	private long s_num;
	private String userId ;
	private String studyName, study_Info, created, gender; // 스터디명,스터디한줄소개,스터디생성일
	private int recruit, range, memcnt, star;// 모집인원 , 스터디 공개 범위, 회원수, 후기별점
	
	private String userName , userImg;
	
	/*private String[] target =null;// 모집대상*/
	private String s_target;
	private List<String> target ;

	private List<StudyCategory> listCategory; // 카테고리 객체를 저장하는 리스트
	private List<String> choiceCategory; // JSP에서 카테고리를 리스트로 받음
	private String category;
	
	private List<StudyLocal> listLocal; // 지역 객체를 저장하는 리스트
	private List<String> choiceCity; // JSP에서 지역을 리스트로 받음
	private String city;

	private List<String> pointx; // 위도?
	private String point_x;
	private List<String> pointy; // 경도?
	private String point_y;
	
	private MultipartFile upload;
	private String imageFileName;
	
	
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
	public int getMemcnt() {
		return memcnt;
	}
	public void setMemcnt(int memcnt) {
		this.memcnt = memcnt;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public String getS_target() {
		return s_target;
	}
	public void setS_target(String s_target) {
		this.s_target = s_target;
	}
	public List<String> getTarget() {
		return target;
	}
	public void setTarget(List<String> target) {
		this.target = target;
	}
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
	public List<String> getPointx() {
		return pointx;
	}
	public void setPointx(List<String> pointx) {
		this.pointx = pointx;
	}
	public String getPoint_x() {
		return point_x;
	}
	public void setPoint_x(String point_x) {
		this.point_x = point_x;
	}
	public List<String> getPointy() {
		return pointy;
	}
	public void setPointy(List<String> pointy) {
		this.pointy = pointy;
	}
	public String getPoint_y() {
		return point_y;
	}
	public void setPoint_y(String point_y) {
		this.point_y = point_y;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	
}
