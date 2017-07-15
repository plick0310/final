package com.wooltari.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int insertNotice(Notice dto, String pathname);
	
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	public Notice readNotice(int num);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	public int updateNotice(Notice dto, String pathname);
	public int deleteNotice(int num, String saveFilename, String pathname);
	
	//좋아요
	public int updateHitCount(int num);
	
	//파일
	public int insertFile(Notice dto);
	public List<Notice> listFile(int num);
	public Notice readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
	
	//전체 선택 삭제
	 public int deleteList(List<Integer> list);

}
