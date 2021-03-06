package com.wooltari.mockTest;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("mockTest.mockTestService")
public class MockTestServiceImpl implements MockTestService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertExamwishList(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.insertData("mockTest.insertExamwishList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateExamwishLIST(Map<String, Object> map) {
		int result = 0;
		
		try {
			result=dao.updateData("mockTest.updateExamwishList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MockTest> readExamList(Map<String, Object> map) {
		List<MockTest> examinfoList = null;
		
		try {
			examinfoList = dao.getListData("mockTest.readExamList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return examinfoList;
	}

	@Override
	public List<MockTest> examwishList(Map<String, Object> map) {
		List<MockTest> wishList = null;
		
		try {
			wishList = dao.getListData("mockTest.examwishList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return wishList;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result=dao.getIntValue("mockTest.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteExamwishList(List<String> list) {
		int result = 0;
		
		try {
			result = dao.deleteData("mockTest.deleteWishlists",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<MockTest> examTestList(Map<String, Object> map) {
		List<MockTest> examList = null;
		
		try {
			examList = dao.getListData("mockTest.examTestList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return examList;
	}

	@Override
	public List<MockTest> examTestArticle(Map<String, Object> map) {
		List<MockTest> examArticle = null;
		
		try {
			examArticle = dao.getListData("mockTest.examArticle", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return examArticle;
	}

}
