package com.wooltari.mockTest.test;

import java.util.List;
import java.util.Map;

public interface TestService {
	public Test readTest(int num); // 모의 테스트 리스트
	public List<Test> listTest(Map<String, Object> map); // 모의테스트 리스트
}
