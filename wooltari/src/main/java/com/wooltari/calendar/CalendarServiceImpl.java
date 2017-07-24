package com.wooltari.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("calendar.calendarService")
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertBoard(Calendar dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("tableName", dto.getTableName());
			
			int maxNum=dao.getIntValue("calendar.maxNum",map);
			dto.setNum(maxNum+1);
		
			result=dao.insertData("calendar.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Calendar> listCalendar(Map<String, Object> map) {
		List<Calendar> list=null;
		
		try {
			
			list=dao.getListData("calendar.listCalendar",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("calendar.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getMonth(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("calendar.getMonth",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteBoard(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("calendar.deleteBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Calendar> listCal(Map<String, Object> map) {
		List<Calendar> list=null;
		
		try {
			list=dao.getListData("calendar.listCal", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Calendar> memberStudy(Map<String, Object> map) {
		List<Calendar> list=null;
		
		try {
			list=dao.getListData("calendar.memberStudy",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
