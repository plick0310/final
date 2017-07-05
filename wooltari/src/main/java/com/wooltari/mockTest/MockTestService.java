package com.wooltari.mockTest;

import java.util.List;
import java.util.Map;

public interface MockTestService {
	public int insertExamwishList(MockTest dto); // 응시할 시험 리스트 추가
	public List<MockTest> examwishList(Map<String, Object> map); // 응시할 시험리스트 목록
	public int deleteExamwishList(Map<String, Object> map); // 응시할 시험리스트 삭제
	public List<MockTest> readExamList(Map<String, Object> map); // 응시할 시험리스트 내 시험정보
	public int dataCount(Map<String, Object> map); // 데이터 개수

}
