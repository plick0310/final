package com.wooltari.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("faq.FaqService")
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private CommonDAO  dao;
	
	
	@Override
	public int insertFaq(Faq dto) {
		int result=0;
		
		try{
			int maxNum=dao.getIntValue("faq.maxNum");
			dto.setNum(maxNum+1);
			
			result=dao.insertData("faq.insertFaq", dto);
						
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return result;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.getIntValue("faq.dataCount", map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list=null;
		try{
			list=dao.getListData("faq.listFaq",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int updateFaq(Faq dto) {
		int result=0;
		
		try{
			result=dao.updateData("faq.updateFaq", dto);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return result;
	}
	@Override
	public int deleteFaq(int num) {
		int result=0;
		
		try{
			result = dao.deleteData("faq.deleteFaq", num);
		}catch(Exception e){
		}
		
		return result;
	}
	@Override
	public int deleteList(List<Integer> list) {
		int result=0;
		
		try{
			result=dao.deleteData("faq.deleteList", list);
		}catch(Exception e){			
		}
		return result;
	}
	
	@Override
	public Faq readFaq(int num) {
		Faq dto=null;
		
		try{
			dto=dao.getReadData("faq.readFaq",num);
		}catch(Exception e){			
		}
		return dto;
	}

}
