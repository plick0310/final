package com.wooltari.report;

import java.util.List;
import java.util.Map;

public interface ReportService {
	public int insertBoard(Report dto, String mode);
	public int dataCount(Map<String, Object> map);
	
	public List<Report> listBoard(Map<String, Object> map);
	
	public Report readBoard(int num);
	
	public Report preReadBoard(Map<String, Object> map);
	public Report nextReadBoard(Map<String, Object> map);
	
	public int updateBoard(Report dto);
	public int deleteBoard(int num);
}
