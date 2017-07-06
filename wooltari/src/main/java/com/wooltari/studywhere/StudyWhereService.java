package com.wooltari.studywhere;

import java.util.List;
import java.util.Map;

public interface StudyWhereService {
	public int insertStudyWhere(StudyWhere dto, String pathname);
	public int dataCount(Map<String, Object>map);
	public List<StudyWhere> listStudyWhere(Map<String, Object>map);
	public List<StudyWhere> bestStudyWhere(Map<String, Object>map);
	public StudyWhere readStudyWhere(int num);

	public int updateHitCount(int num);
	public StudyWhere preReadStudyWhere(Map<String, Object>map);
	public StudyWhere nextReadStudyWhere(Map<String, Object>map);
	public int updateStudyWhere(StudyWhere dto,String pathname);
	public int deleteStudyWhere(int num,String pathname, String userId);
	
	public int insertLikeStudyWhere(StudyWhere dto);
	public int countLikeStudyWhere(int num);
	
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
}
