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
	public void insertLog(Map<String, Object> map) throws Exception{
		try {
			dao.insertData("point.insertLog", map);
			dao.updateData("point.updatePoint", map);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
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

	@Override
	public List<PointPay> listPointPay(Map<String, Object> map) {
		List<PointPay> list = null;
		try {
			list = dao.getListData("point.listPointPay", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertPointPay(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("point.insertPointPay", map);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
	}

	@Override
	public int updatePointPay(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.updateData("point.updatePointPag", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deletePointPay(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.deleteData("point.deletePointPag", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int countPointPay() {
		int result=0;
		try {
			result = dao.getIntValue("point.countPointPay");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public PointPay readPointPay(int price) {
		PointPay dto = null;
		try {
			dto=dao.getReadData("point.readPointPay", price);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
}
