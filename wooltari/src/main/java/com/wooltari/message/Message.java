package com.wooltari.message;

public class Message {
	private int listNum, num, sent_Category, recv_Category, read;
	private String sent_Id, recv_Id, content, date_Sent, date_Read;
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSent_Category() {
		return sent_Category;
	}
	public void setSent_Category(int sent_Category) {
		this.sent_Category = sent_Category;
	}
	public int getRecv_Category() {
		return recv_Category;
	}
	public void setRecv_Category(int recv_Category) {
		this.recv_Category = recv_Category;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public String getSent_Id() {
		return sent_Id;
	}
	public void setSent_Id(String sent_Id) {
		this.sent_Id = sent_Id;
	}
	public String getRecv_Id() {
		return recv_Id;
	}
	public void setRecv_Id(String recv_Id) {
		this.recv_Id = recv_Id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate_Sent() {
		return date_Sent;
	}
	public void setDate_Sent(String date_Sent) {
		this.date_Sent = date_Sent;
	}
	public String getDate_Read() {
		return date_Read;
	}
	public void setDate_Read(String date_Read) {
		this.date_Read = date_Read;
	}
}
