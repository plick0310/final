package com.wooltari.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public int insertFaq(Faq dto);
	
	public List<Faq> listFaq(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);
	
	public Faq readFaq(int num);
	public int updateFaq(Faq dto);
	public int deleteFaq(int num);
	
	public int deleteList(List<Integer> list);
}
