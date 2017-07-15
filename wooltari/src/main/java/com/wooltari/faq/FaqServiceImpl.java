package com.wooltari.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;

@Service("faq.FaqService")
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private CommonDAO  dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertBoard(Faq dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Faq> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Faq readBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Faq preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Faq nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
