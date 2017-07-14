package com.wooltari.mockTest.examFiles;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;
import com.wooltari.mockTest.exam.Exam;

@Service("mockTest.examFilesService")
public class ExamFilesServiceImpl implements ExamFilesService{

	@Autowired
	public CommonDAO dao;
	
	@Override
	public ExamFiles readExamFiles(int num) {
		ExamFiles dto = null;
		
		try {
			dto = dao.getReadData("examFiles.readTestFiles",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<ExamFiles> examReady(Map<String, Object> map) {
		List<ExamFiles> readyList = null;
		
		try {
			readyList=dao.getListData("examFiles.examReady",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return readyList;
	}

	@Override
	public List<ExamFiles> examList(Map<String, Object> map) {
		List<ExamFiles> examList = null;
		
		try {
			examList = dao.getListData("examFiles.examList",map); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return examList;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result=dao.getIntValue("examFiles.examCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<ExamFiles> listExamfiles(Map<String, Object> map) {
		List<ExamFiles> list = null;
		
		try {
			list=dao.getListData("examFiles.listExamfiles", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
