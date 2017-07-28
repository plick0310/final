package com.wooltari.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("main.mainService")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public CountMain countMain() {
		CountMain dto = null;
		try {
			dto = dao.getReadData("main.countMain");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
