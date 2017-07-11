package com.wooltari.mockTest;

import java.util.List;
import java.util.Map;

public interface MockTestService {
	// 응시할 시험리스트
	public int insertExamwishList(Map<String, Object> map); // 응시할 시험 리스트 추가
	public int updateExamwishLIST(Map<String, Object> map); // 응시할 시험리스트 수정
	public List<MockTest> examwishList(Map<String, Object> map); // 응시할 시험리스트 목록
	public List<MockTest> readExamList(Map<String, Object> map); // 응시할 시험리스트 내 시험정보
	public int dataCount(Map<String, Object> map); // 데이터 개수
	public int deleteExamwishList(List<String>list); // 응시할 시험리스트 전체삭제
	
	// 시험
	public List<MockTest> examTestList(Map<String, Object> map); // 모의 시험목록
	public List<MockTest> examTestArticle(Map<String, Object> map); // 모의 시험 내용
	
}
