package com.wooltari.mockTest.examFiles;

import java.util.List;
import java.util.Map;

import com.wooltari.mockTest.exam.Exam;

public interface ExamFilesService {
	public ExamFiles readExamFiles(int num);
	public List<ExamFiles> examReady(Map<String, Object>map); // 모의 리스트 메인 리스트
	public List<ExamFiles> examList(Map<String, Object>map); // 모의 테스트 내용 리스트
	public int dataCount(Map<String, Object>map);
	public List<ExamFiles> listExamfiles(Map<String, Object> map);
	
}
