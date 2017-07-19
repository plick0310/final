package com.wooltari.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("report.reportService")
public class ReportServiceImpl implements ReportService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertBoard(Report dto, String mode) {
		int result=0;
		
		try{
			int seq=dao.getIntValue("report.seq");
			dto.setRepNum(seq);
					
			if(mode.equals("created")){
				dto.setGroupNum(seq);
			}else if(mode.equals("reply")){
				//orderNo 변경
				Map<String, Object> map= new HashMap<String, Object>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				
				dao.updateData("board.updateOrderNo", map);
				
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			result=dao.insertData("report.insertBoard", dto);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Report> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Report readBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Report preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Report nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(Report dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
