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
	public int updateHoldMessage(int num) {
		int result=0;
		try {
			result = dao.updateData("message.updateHoldMessage", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int updateTrashMessage(int num) {
		int result=0;
		try {
			result = dao.updateData("message.updateTrashMessage", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
