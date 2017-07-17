package com.wooltari.playZone;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("playZone.serviceImpl")
public class PlayZoneServiceImpl implements PlayZoneService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int pointlist(Map<String, Object> map) {
		int result = 0;
		try {
			result=dao.getIntValue("playZone.point", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int pointupdate(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.updateData("playZone.pointupdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}



	
