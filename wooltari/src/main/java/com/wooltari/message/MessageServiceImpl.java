package com.wooltari.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("message.messageService")
public class MessageServiceImpl implements MessageService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int sendMessage(Message dto) throws Exception{
		int result = 0;
		try {
			result = dao.insertData("message.sendMessage", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("message.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int noreadCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("message.noreadCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public List<Message> listMessage(Map<String, Object> map) {
		List<Message> list=null;
		try {
			list = dao.getListData("message.listMessage", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public Message readMessage(int num) {
		Message dto = null;
		try {
			dto = dao.getReadData("message.readMessage", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	@Override
	public int updateReadMessage(int num) {
		int result=0;
		try {
			result = dao.updateData("message.updateReadMessage", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int readMessageList(List<Integer> list) {
		int result=0;
		try {
			result = dao.updateData("message.readMessageList", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int keepMessageList(List<Integer> list) {
		int result=0;
		try {
			result = dao.updateData("message.keepMessageList", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int trashMessageList(List<Integer> list) {
		int result=0;
		try {
			result = dao.updateData("message.trashMessageList", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int receiveMessageList(List<Integer> list) {
		int result=0;
		try {
			result = dao.updateData("message.receiveMessageList", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int deleteMessageList(List<Integer> list) {
		int result=0;
		try {
			result = dao.updateData("message.deleteMessageList", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int deleteSendMessageList(List<Integer> list) {
		int result=0;
		try {
			result = dao.updateData("message.deleteSendMessageList", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
