package com.wooltari.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;
import com.wooltari.member.Member;

@Service("admin.adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Member> listBoard(Map<String, Object> map) {
		List<Member> list= null;
		
		try{
			list=dao.getListData("admin.listBoard",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.getIntValue("admin.dataCount",map);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateBoard(Member dto) {
		int result=0;
		try{
			result= dao.updateData("admin.updateBoard", dto);
		}catch(Exception e){
		}
		return result;
	}

	
}
