package com.wooltari.studyMarketBoard;

import java.util.List;
import java.util.Map;

public interface StudyMarketBoardService {
	
	public int insertBoard(StudyMarketBoard dto, String pathname);
	public List<StudyMarketBoardService> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public StudyMarketBoard readBoard(int num);
	public int updateHitCount(int num);
	public StudyMarketBoard preReadBoard(Map<String, Object> map);
	public StudyMarketBoard nextReadBoard(Map<String, Object> map);
	public int updateBoard(StudyMarketBoardService dto, String pathname);
	public int deleteBoard(int num, String saveFilename, String pathname);
	
	public int insertLikeBoard(StudyMarketBoard dto);
	public int countLikeBoard(int num);
	
	//회원 탈퇴시 글 삭제
	public int deleteBoardId(String userId, String root);
	
	//파일 첨부
	public int insertFile(StudyMarketBoard dto);
	public List<StudyMarketBoard> listFile(int num);
	public StudyMarketBoard readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
	
	//답글
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public List<Reply> listReplyAnswer(int answer);
	public int replyDataCount(Map<String, Object> map);
	public int replyCountAnswer(int answer);
	public int deleteReply(Map<String, Object> map);
	
	//답글 별
	public int insertReplyStar(Reply dto);
	public int insertReplyLike(Reply dto);
	public Map<String, Object> replyCountLike(int replyNum);
	
	//전체 선택 삭제
	public int deleteList(Map<String, Object>map);
	public int deleteList(List<Integer> list);
}
