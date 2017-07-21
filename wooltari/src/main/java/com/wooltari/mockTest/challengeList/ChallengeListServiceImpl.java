package com.wooltari.mockTest.challengeList;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("challengeList.ChallengeListService")
public class ChallengeListServiceImpl implements ChallengeListService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<ChallengeList> challengeList(Map<String, Object> map) {
		List<ChallengeList> challengeList = null;
		
		try {
			challengeList = dao.getListData("chall.challengeList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return challengeList;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result=dao.getIntValue("chall.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ChallengeList> highChartList(Map<String, Object> map) {
		List<ChallengeList> highChartList = null;
		
		try {
			highChartList = dao.getListData("chall.highChartList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return highChartList;
	}
}
