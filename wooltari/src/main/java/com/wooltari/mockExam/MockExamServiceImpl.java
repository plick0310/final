package com.wooltari.mockExam;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("mockExam.mockExamService")
public class MockExamServiceImpl implements MockExamService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<MockExam> examList(Map<String, Object> map) {
		List<MockExam> questionlist = null;
		
		try {
			questionlist = dao.getListData("mockExam.examQuestionList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionlist;
	}


	@Override
	public List<MockExam> scoring(Map<String, Object> map) {
		List<MockExam> scoring = null;
		
		try {
			scoring = dao.getListData("mockExam.scoring",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scoring;
	}


	@Override
	public int insertResult(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.insertData("mockExam.insertResult", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
