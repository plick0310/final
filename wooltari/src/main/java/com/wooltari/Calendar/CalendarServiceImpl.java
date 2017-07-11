package com.wooltari.Calendar;

import java.util.HashMap;
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


	
}
