package com.wooltari.calendar;

import java.util.List;
import java.util.Map;

public interface CalendarService {
	
	public int insertBoard(Calendar dto); 
	public List<Calendar> listCalendar(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int getMonth(Map<String, Object>map);
	public int deleteBoard(Map<String, Object>map);
	
	public List<Calendar> listCal(Map<String, Object> map);
	
	public List<Calendar> memberStudy(Map<String, Object>map);
}
