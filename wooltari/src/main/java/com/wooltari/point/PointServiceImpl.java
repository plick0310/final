package com.wooltari.point;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("point.pointService")
public class PointServiceImpl implements PointService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertLog(Map<String, Object> map) {
		try {
			dao.insertData("point.insertLog", map);
			dao.updateData("point.updatePoint", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.getIntValue("point.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Point> listLog(Map<String, Object> map) {
		List<Point> list = null;
		try {
			list = dao.getListData("point.listLog", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
