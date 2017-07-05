package com.wooltari.study.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	public void insertBoard(Board dto , String pathname) throws Exception;
	public List<Board> listBoard(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public void deleteBoard(Map<String, Object>map)throws Exception;
}
