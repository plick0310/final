package com.wooltari.downloadBoard;

import java.util.List;
import java.util.Map;

public interface DownloadBoardService {
	public int insertBoard(DownloadBoardService dto, String pathname);
	public List<DownloadBoardService> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public DownloadBoard readBoard(int num);
	public int updateHitCount(int num);
	public DownloadBoard preReadBoard(Map<String, Object> map);
	public DownloadBoard nextReadBoard(Map<String, Object> map);
	public int updateBoard(DownloadBoardService dto, String pathname);
	public int deleteBoard(int num, String saveFilename, String pathname);
	
	public int insertLikeBoard(DownloadBoard dto);
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
