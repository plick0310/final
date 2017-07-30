package com.wooltari.study.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	public void insertBoard(Board dto , String pathname) throws Exception;
	public List<Board> listBoard(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public void deleteBoard(Map<String, Object>map)throws Exception;
	public void insertPhoto(Map<String, Object>map)throws Exception;
	public List<String> readPhoto(Map<String, Object> map);
	public Board readBoard(Map<String, Object> map);
	
	public int insertLikeBoard(Map<String, Object>map);
	public int countLikeBoard(Map<String, Object>map);
	public Map<String, Object> checkLike(Map<String, Object> map);
	
	public void insertReplyBoard(Reply dto ) throws Exception;
	public void deleteReplyBoard(Map<String, Object>map) throws Exception;
	public List<Reply> listReply(Map<String, Object> map) ;
	public int countReplyBoard(Map<String, Object>map);

}
