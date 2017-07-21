package com.wooltari.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

//울타리 신고 건의
@Service("report.ReportService")
public class ReportServiceImpl implements ReportService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertReport(Report dto, String mode) {
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
				
				dao.updateData("report.updateOrderNo", map);
				
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			result=dao.insertData("report.insertReport", dto);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try{
			result= dao.getIntValue("report.dataCount", map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Report> listReport(Map<String, Object> map) {
		List<Report> list = null;
		
		try{
			list=dao.getListData("report.listReport", map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public Report readReport(int repNum) {
		Report dto= null;
		try{
			dto=dao.getReadData("report.readReport",repNum);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Report preReadReport(Map<String, Object> map) {
		Report dto=null;
		
		try{
			dto=dao.getReadData("report.preReadReport",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Report nextReadReport(Map<String, Object> map) {
		Report dto=null;
		
		try{
			dto=dao.getReadData("report.nextReadReport",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateReport(Report dto) {
		int result=0;
		
		try{
			result=dao.updateData("report.updateReport", dto);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReport(int repNum) {
		int result=0;
		
		try{
			result=dao.deleteData("report.deleteReport", repNum);
		}catch(Exception e) {
		}
		return result;
	}

	
	
}
