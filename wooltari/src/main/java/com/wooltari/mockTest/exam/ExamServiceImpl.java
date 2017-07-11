package com.wooltari.mockTest.exam;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("mockTest.testService")
public class ExamServiceImpl implements ExamService{

	@Autowired
	public CommonDAO dao;
	
	@Override
	public Exam readTest(int num) {
		Exam dto = null;
		
		try {
			dto=dao.getReadData("test.readTest", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Exam> listTest(Map<String, Object> map) {
		List<Exam> list = null;
		
		try {
			list=dao.getListData("test.listTest", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
