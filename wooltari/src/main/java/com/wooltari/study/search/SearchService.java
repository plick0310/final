package com.wooltari.study.search;

import java.util.List;
import java.util.Map;

import com.wooltari.study.StudyInfo;


public interface SearchService {
	public List<StudyInfo> listSearch(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
