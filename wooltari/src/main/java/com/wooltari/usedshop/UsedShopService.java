package com.wooltari.usedshop;

import java.util.List;
import java.util.Map;

public interface UsedShopService {
	public int insertUsedShop(UsedShop dto);
	public int dataCount(Map<String, Object>map);
	public List<UsedShop> listUsedShop(Map<String, Object>map);
	public List<UsedShop> reverselistUsedShop(Map<String, Object>map);
	public UsedShop readUsedShop(int num);
	
	public List<UsedShop> listbiccate();
	public List<UsedShop> listsmallcate(int parent);
	public UsedShop preReadUsedShop(Map<String, Object>map);
	public UsedShop nextReadUsedShop(Map<String, Object>map);
	public int updateUsedShop(UsedShop dto);
	public int deleteUsedShop(int num,String pathname,String userId);
}
