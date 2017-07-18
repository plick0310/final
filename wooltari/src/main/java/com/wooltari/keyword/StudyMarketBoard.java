package com.wooltari.keyword;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StudyMarketBoard {
	private int innerlistNum, bestlistNum, listNum, num;
	private String subject, content, userId, created, userImg;
	private int hitCount;
	private int likeCount, replyCount; 
	private List<StudyMarketBoard> innerList;//dto(StudyMarketBoard)를 담을 수 있는 innerList를 만듬.
	
	private String urlContent, startdate, enddate, address;
	
	//리스트에서 새글 옆에 new 띄움
	private long gap;
	
	private int fileNum;
	private String originalFilename, saveFilename;
	private List<MultipartFile> upload;
	
	
	
		
	public int getInnerlistNum() {
		return innerlistNum;
	}
	public void setInnerlistNum(int innerlistNum) {
		this.innerlistNum = innerlistNum;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public int getBestlistNum() {
		return bestlistNum;
	}
	public void setBestlistNum(int bestlistNum) {
		this.bestlistNum = bestlistNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public String getUrlContent() {
		return urlContent;
	}
	public void setUrlContent(String urlContent) {
		this.urlContent = urlContent;
	}
	public long getGap() {
		return gap;
	}
	public void setGap(long gap) {
		this.gap = gap;
	}
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public List<StudyMarketBoard> getInnerList() {
		return innerList;
	}
	public void setInnerList(List<StudyMarketBoard> innerList) {
		this.innerList = innerList;
	}
	
	
}
