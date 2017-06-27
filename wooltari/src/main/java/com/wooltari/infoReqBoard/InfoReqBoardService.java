package com.wooltari.infoReqBoard;

import java.util.List;
import java.util.Map;

public interface InfoReqBoardService {
	public int insertBoard(InfoReqBoardService dto, String pathname);
	public List<InfoReqBoardService> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public InfoReqBoard readBoard(int num);
	public int updateHitCount(int num);
	public InfoReqBoard preReadBoard(Map<String, Object> map);
	public InfoReqBoard nextReadBoard(Map<String, Object> map);
	public int updateBoard(InfoReqBoardService dto, String pathname);
	public int deleteBoard(int num, String saveFilename, String pathname);
	
	public int insertLikeBoard(InfoReqBoard dto);
	public int countLikeBoard(int num);
	
	public int deleteBoardId(String userId, String root);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public List<Reply> listReplyAnswer(int answer);
	public int replyDataCount(Map<String, Object> map);
	public int replyCountAnswer(int answer);
	public int deleteReply(Map<String, Object> map);
	
	public int insertReplyLike(Reply dto);
	public Map<String, Object> replyCountLike(int replyNum);
}
