package com.wooltari.mockTest.exam;

import java.util.List;
import java.util.Map;

public interface ExamService {
	public Exam readTest(int num); // 모의 테스트 리스트
	public List<Exam> listTest(Map<String, Object> map); // 모의테스트 리스트
}
