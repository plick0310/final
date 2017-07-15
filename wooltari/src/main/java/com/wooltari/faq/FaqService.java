package com.wooltari.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public int insertBoard(Faq dto, String pathname);
	public List<Faq> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Faq readBoard(int num);
	public Faq preReadBoard(Map<String, Object> map);
	public Faq nextReadBoard(Map<String, Object> map);
	
	
}
