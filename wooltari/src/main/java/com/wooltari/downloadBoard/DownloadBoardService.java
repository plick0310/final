package com.wooltari.downloadBoard;

import java.util.List;
import java.util.Map;

public interface DownloadBoardService {
	public int insertBoard(DownloadBoard dto, String pathname);
	public List<DownloadBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public DownloadBoard readBoard(int num);
	public int updateHitCount(int num);
	public DownloadBoard preReadBoard(Map<String, Object> map);
	public DownloadBoard nextReadBoard(Map<String, Object> map);
	public int updateBoard(DownloadBoard dto, String pathname);
	public int deleteBoard(int num, String saveFilename, String pathname);
	
	public int insertLikeBoard(DownloadBoard dto);
	public int countLikeBoard(int num);
	
	//회원 탈퇴시 글 삭제
	public int deleteBoardId(String userId, String root);
	
	//파일 첨부
	public int insertFile(DownloadBoard dto);
	public List<DownloadBoard> listFile(int num);
	public DownloadBoard readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
	
	
	
	//답글
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public List<Reply> listReplyAnswer(int answer);
	public int replyDataCount(Map<String, Object> map);
	public int replyCountAnswer(int answer);
	public int deleteReply(Map<String, Object> map);
	
	public int insertReplyLike(Reply dto);
	public Map<String, Object> replyCountLike(int replyNum);
	
	//전체 선택 삭제
	public int deleteList(Map<String, Object> map);
	public int deleteList(List<Integer> list);
}
