package com.wooltari.study.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int num , hitCount;
	private String userId, content , created , userName;
	private long s_num;
	
	private List<MultipartFile> upload2;
	private String imageFileName;
	
	private String userImg;
	
	private String tableName;

	private int likeCount;
	private int replyCount;
	
	private int likeCheck;
	
	
	
	
	
	public List<MultipartFile> getUpload2() {
		return upload2;
	}

	public void setUpload2(List<MultipartFile> upload2) {
		this.upload2 = upload2;
	}
	
	
	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public long getS_num() {
		return s_num;
	}

	public void setS_num(long s_num) {
		this.s_num = s_num;
	}


	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	
	
}
