package com.wooltari.freeTalk;

import java.util.List;
import java.util.Map;

public interface FreeTalkService {
	public int insertFreeTalk(FreeTalk dto);
	public List<FreeTalk> listFreeTalk(Map<String, Object>map);
	public int dataCount();
	public int deleteFreeTalk(Map<String, Object>map);
}
