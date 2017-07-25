package com.wooltari.usedshop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;
import com.wooltari.studywhere.StudyWhere;

@Service("usedshop.UsedShopService")
public class UsedShopServiceImpl implements UsedShopService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertUsedShop(UsedShop dto) {
		int result = 0;
		
		try {
			result = dao.insertData("usedshop.insertUsedShop", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result=dao.getIntValue("usedshop.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UsedShop> listUsedShop(Map<String, Object> map) {
		List<UsedShop> list =null;
		
		try {
			list=dao.getListData("usedshop.listUsedShop",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public UsedShop readUsedShop(int num) {
		UsedShop dto = null;
		
		try {
			dto=dao.getReadData("usedshop.readUsedShop",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public UsedShop preReadUsedShop(Map<String, Object> map) {
		UsedShop dto = null;
		try {
			dto=dao.getReadData("usedshop.preReadUsedShop",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public UsedShop nextReadUsedShop(Map<String, Object> map) {
		UsedShop dto = null;
		try {
			dto=dao.getReadData("usedshop.nextReadUsedShop",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateUsedShop(UsedShop dto) {
		int result = 0;
		try {
			
			dao.updateData("usedshop.updateUsedShop", dto);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteUsedShop(int num, String userId) {
		int result= 0;
		
		try {
			UsedShop dto = readUsedShop(num);
			if(dto!=null) {
				if(! dto.getUserId().equals(userId)&&!userId.equals("admin")) {
					return result;
				}
				
			}
			dao.deleteData("usedshop.deleteUsedShop", num);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<UsedShop> listbiccate() {
		List<UsedShop> list= new ArrayList<>();
	      try {
	         list=dao.getListData("usedshop.listBigCategory");
	      } catch (Exception e) {
	         System.out.println(e.toString());
	      }
	      return list;
	}

	@Override
	public List<UsedShop> listsmallcate(int parent) {
		List<UsedShop> list= new ArrayList<>();
	      try {
	         list=dao.getListData("usedshop.listSmallCategory",parent);
	      } catch (Exception e) {
	         System.out.println(e.toString());
	      }
	      return list;
	}

	@Override
	public List<UsedShop> reverselistUsedShop(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
