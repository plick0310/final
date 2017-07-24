package com.wooltari.keyword;

import java.util.List;

public class UsedShop {
	private int num,parent,categoryNum,price,del,pointuse,listNum,pointprice;
	private String userId,catetitle;
	private String subject,content,created;
	private int category;
	private List<String> choiceCategory; // 선택카테고리

	
	
	public int getParent() {
		return parent;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	
	
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCatetitle() {
		return catetitle;
	}
	public void setCatetitle(String catetitle) {
		this.catetitle = catetitle;
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

	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public List<String> getChoiceCategory() {
		return choiceCategory;
	}
	public void setChoiceCategory(List<String> choiceCategory) {
		this.choiceCategory = choiceCategory;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getPointuse() {
		return pointuse;
	}
	public void setPointuse(int pointuse) {
		this.pointuse = pointuse;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getPointprice() {
		return pointprice;
	}
	public void setPointprice(int pointprice) {
		this.pointprice = pointprice;
	}
	
	
}
