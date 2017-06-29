package com.wooltari.promote;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


public interface PromoteService {
	public int insertBoard(Promote dto, String pathname);
	public List<Promote> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Promote readBoard(int num);
	public int updateHitCount(int num);
	public int updateBoard(Promote dto, String pathname);
	public int deleteBoard(int num, String imageFileName, String pathname);
	
	public int deleteBoardId(String userId, String root);
	
	public int insertReply(PromoteReply dto);
	public List<PromoteReply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);

}
