package com.wooltari.study.search;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("study.search.SearchService")
public class SearchServiceImpl implements SearchService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<StudySearch> listSearch(Map<String, Object> map) {
		List<StudySearch> list=null;
		try {
			list = dao.getListData("search.listSearch", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("search.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
