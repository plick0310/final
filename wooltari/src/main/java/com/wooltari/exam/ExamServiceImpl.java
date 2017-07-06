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
	public List<Exam> readExamList(Map<String, Object> map) {
		List<Exam> examinfoList = null;
		
		try {
			examinfoList = dao.getListData("exam.readExamList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return examinfoList;
	}

	@Override
	public List<Exam> examwishList(Map<String, Object> map) {
		List<Exam> wishList = null;
		
		try {
			// ↓ 아래 ""안에 mapper에서 선언한 내용 가져오기. 
			wishList = dao.getListData("exam.examwishList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return wishList;
	}

	@Override
	public int deleteExamwishList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


}
