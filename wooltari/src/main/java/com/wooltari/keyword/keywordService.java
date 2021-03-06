package com.wooltari.keyword;

import java.util.List;
import java.util.Map;

public interface keywordService {
	public List<StudyInfo> studyList(Map<String, Object> map);
	public List<StudyInfo> allStudyList(Map<String, Object> map);
	public int studyCount(Map<String, Object> map);
	
	public List<DownloadBoard> DownloadBoardList(Map<String, Object> map);
	public List<DownloadBoard> allDownloadBoardList(Map<String, Object> map);
	public int DownloadBoardCount(Map<String, Object> map);
	
	public List<MockTest> MockTestList(Map<String, Object> map);
	public List<MockTest> allMockTestList(Map<String, Object> map);
	public int MockTestCount(Map<String, Object> map);
	
	public List<Promote> PromoteList(Map<String, Object> map);
	public List<Promote> allPromoteList(Map<String, Object> map);
	public int PromoteCount(Map<String, Object> map);
	
	public List<Review> ReviewList(Map<String, Object> map);
	public List<Review> allReviewList(Map<String, Object> map);
	public int ReviewCount(Map<String, Object> map);
	
	public List<StudyMarketBoard> StudyMarketBoardList(Map<String, Object> map);
	public List<StudyMarketBoard> allStudyMarketBoardList(Map<String, Object> map);
	public int StudyMarketBoardCount(Map<String, Object> map);
	
	public List<StudyWhere> StudyWhereList(Map<String, Object> map);
	public List<StudyWhere> allStudyWhereList(Map<String, Object> map);
	public int StudyWhereCount(Map<String, Object> map);
	
	public List<UsedShop> UsedShopList(Map<String, Object> map);
	public List<UsedShop> allUsedShopList(Map<String, Object> map);
	public int UsedShopCount(Map<String, Object> map);
	

}
