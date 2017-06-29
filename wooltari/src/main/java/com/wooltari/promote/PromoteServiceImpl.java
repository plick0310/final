package com.wooltari.promote;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("promote.serviceImpl")
public class PromoteServiceImpl implements PromoteService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertBoard(Promote dto, String pathname) {
		int result=0;
		try {
			result=dao.insertData("promote.insertBoard", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Promote> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Promote readBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(Promote dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int num, String imageFileName, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoardId(String userId, String root) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReply(PromoteReply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PromoteReply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
