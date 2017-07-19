package com.wooltari.mockExam;

import java.util.List;
import java.util.Map;

public interface MockExamService {
	public List<MockExam> examList(Map<String, Object> map); // 문제 리스트
	public List<MockExam> scoring(Map<String, Object> map); // 채점
}
