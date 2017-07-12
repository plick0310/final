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
	public Exam readExam(int num) {
		Exam dto = null;
		
		try {
			dto=dao.getReadData("exam.readTest", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Exam> listExam(Map<String, Object> map) {
		List<Exam> list = null;
		
		try {
			list=dao.getListData("exam.listExam", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result=dao.getIntValue("exam.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
