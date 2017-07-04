package com.wooltari.mockTest.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("mockTest.testService")
public class TestServiceImpl implements TestService{

	@Autowired
	public CommonDAO dao;
	
	@Override
	public Test readTest(int num) {
		Test dto = null;
		
		try {
			dto=dao.getReadData("test.readTest", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Test> listTest(Map<String, Object> map) {
		List<Test> list = null;
		
		try {
			list=dao.getListData("test.listTest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
