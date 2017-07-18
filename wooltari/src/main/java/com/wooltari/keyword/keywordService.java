package com.wooltari.keyword;

import java.util.List;
import java.util.Map;

import com.wooltari.promote.Promote;

public interface keywordService {
	public List<StudyInfo> studyList(Map<String, Object> map);
	public List<StudyInfo> allStudyList(Map<String, Object> map);
	public int studyCount(Map<String, Object> map);
	
	public List<DownloadBoard> DownloadBoardList(Map<String, Object> map);
	public int DownloadBoardCount(Map<String, Object> map);
	
	public List<MockTest> MockTestList(Map<String, Object> map);
	public int MockTestCount(Map<String, Object> map);
	
	public List<Promote> PromoteList(Map<String, Object> map);
	public int PromoteCount(Map<String, Object> map);
	
	public List<Review> ReviewList(Map<String, Object> map);
	public int ReviewCount(Map<String, Object> map);
	
	public List<StudyMarketBoard> StudyMarketBoardList(Map<String, Object> map);
	public int StudyMarketBoardCount(Map<String, Object> map);
	
	public List<StudyWhere> StudyWhereList(Map<String, Object> map);
	public int StudyWhereCount(Map<String, Object> map);
	
}
