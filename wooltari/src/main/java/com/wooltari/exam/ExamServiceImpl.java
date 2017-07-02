package com.wooltari.exam;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("exam.examService")
public class ExamServiceImpl implements ExamService{
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertExamwishList(Exam dto) {
		int result=0;
		
		try {
			result=dao.insertData("exam.insertExamwishList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Exam> ExamwishList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteExamwishList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
