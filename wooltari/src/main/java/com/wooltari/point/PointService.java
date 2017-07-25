package com.wooltari.point;

import java.util.List;
import java.util.Map;

public interface PointService {
	public void insertLog(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Point> listLog(Map<String, Object> map);
}
