package com.wooltari.point;

import java.util.List;
import java.util.Map;

public interface PointService {
	public void insertLog(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Point> listLog(Map<String, Object> map);
	
	
	public void insertPointPay(Map<String, Object> map) throws Exception;
	public int updatePointPay(Map<String, Object> map);
	public int deletePointPay(Map<String, Object> map);
	public int countPointPay();
	public PointPay readPointPay(int price);
	public List<PointPay> listPointPay(Map<String, Object> map);
}
