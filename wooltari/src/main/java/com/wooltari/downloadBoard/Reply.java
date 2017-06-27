package com.wooltari.downloadBoard;

public class Reply {
	private int num;
	private String userId, created, content;
	private int dlb_num;
	
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
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIrb_num() {
		return dlb_num;
	}
	public void setIrb_num(int dlb_num) {
		this.dlb_num = dlb_num;
	}

	

}
