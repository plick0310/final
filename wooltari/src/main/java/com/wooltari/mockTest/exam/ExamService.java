package com.wooltari.mockTest.exam;

import java.util.List;
import java.util.Map;

public interface ExamService {
	public Exam readExam(int num); // 모의 테스트 리스트
	public List<Exam> listExam(Map<String, Object> map); // 모의테스트 리스트
	public int dataCount(Map<String, Object> map); // 데이터 수
	
}
