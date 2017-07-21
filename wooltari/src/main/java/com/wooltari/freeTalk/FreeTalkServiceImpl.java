package com.wooltari.freeTalk;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;
@Service("freeTalk.freeTalkService")
public class FreeTalkServiceImpl implements FreeTalkService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertFreeTalk(FreeTalk dto) {
		int result=0;
		try {
			result=dao.insertData("freeTalk.insertFreeTalk", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<FreeTalk> listFreeTalk(Map<String, Object> map) {
		List<FreeTalk> list = null;
		
		try {
			list=dao.getListData("freeTalk.listFreeTalk",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount() {
		int result=0;
		
		try {
			result=dao.getIntValue("freeTalk.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

	@Override
	public int deleteFreeTalk(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.deleteData("freeTalk.deleteFreeTalk", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
