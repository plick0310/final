package com.wooltari.message;

import java.util.List;
import java.util.Map;

public interface MessageService {
	public int sendMessage(Message dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public int noreadCount(Map<String, Object> map);
	public List<Message> listMessage(Map<String, Object> map);
	public Message readMessage(int num);
	public int updateReadMessage(int num);
	
	public int readMessageList(List<Integer> list);
	public int keepMessageList(List<Integer> list);
	public int trashMessageList(List<Integer> list);
	public int receiveMessageList(List<Integer> list);
	public int deleteMessageList(List<Integer> list);
	public int deleteSendMessageList(List<Integer> list);
	
}
