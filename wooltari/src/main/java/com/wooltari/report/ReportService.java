package com.wooltari.report;

import java.util.List;
import java.util.Map;

public interface ReportService {
	public int insertReport(Report dto, String mode);
	public int dataCount(Map<String, Object> map);
	
	public List<Report> listReport(Map<String, Object> map);
	
	public Report readReport(int num);
	
	public Report preReadReport(Map<String, Object> map);
	public Report nextReadReport(Map<String, Object> map);
	
	public int updateReport(Report dto);
	public int deleteReport(int num);
	
	public int deleteList(List<Integer> list);
}
