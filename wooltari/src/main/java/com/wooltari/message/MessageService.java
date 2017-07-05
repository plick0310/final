package com.wooltari.message;

import java.util.List;
import java.util.Map;

public interface MessageService {
	public int sendMessage(Message dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Message> listMessage(Map<String, Object> map);
	public Message readMessage(int num);
	public int updateReadMessage(int num);
	public int updateHoldMessage(int num);
	public int updateTrashMessage(int num);
}
