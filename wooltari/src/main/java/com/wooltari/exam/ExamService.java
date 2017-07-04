package com.wooltari.exam;

import java.util.List;
import java.util.Map;

public interface ExamService {
	public int insertExamwishList(Exam dto); // 응시할 시험 리스트 추가
	public List<Exam> ExamwishList(Map<String, Object> map); // 응시할 시험 리스트 목록
	public int deleteExamwishList(Map<String, Object> map); // 응시할 시험 리스트 삭제
	
}
