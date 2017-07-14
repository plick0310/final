package com.wooltari.playZone;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("playZone.serviceImpl")
public class PlayZoneServiceImpl implements PlayZoneService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<PlayZone> pointlist(Map<String, Object> map) {
		List<PlayZone> list=null;
		try {
			list=dao.getListData("playZone.pointlist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}



	
