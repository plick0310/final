package com.wooltari.keyword;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;
import com.wooltari.promote.Promote;

@Service
public class keywordServiceImpl implements keywordService {

	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private CommonDAO dao;
	

	@Override
	public List<StudyInfo> studyList(Map<String, Object> map) {
		List<StudyInfo> list=null;
		
		try {
			list=dao.getListData("keyword.study",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<StudyInfo> allStudyList(Map<String, Object> map) {
		List<StudyInfo> list=null;
		
		try {
			list=dao.getListData("keyword.allStudy",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;	
	}



	@Override
	public int studyCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.getIntValue("keyword.studyCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	@Override
	public List<DownloadBoard> DownloadBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int DownloadBoardCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<MockTest> MockTestList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int MockTestCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Promote> PromoteList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int PromoteCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Review> ReviewList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int ReviewCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<StudyMarketBoard> StudyMarketBoardList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int StudyMarketBoardCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<StudyWhere> StudyWhereList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int StudyWhereCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}



}
