package com.wooltari.study.search;

import java.util.List;
import java.util.Map;


public interface SearchService {
	public List<StudySearch> listSearch(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
