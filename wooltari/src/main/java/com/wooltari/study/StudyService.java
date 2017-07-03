package com.wooltari.study;

import java.util.List;


public interface StudyService {
	public List<StudyCategory> listBigCategory();
	public List<StudyCategory> listSmallCategory(int parent);
	
	public List<StudyCity> listBigCity();
	public List<StudyCity> listSmallCity(int parent);
	
	public long maxS_num();
	public void insertStudy(StudyInfo dto, String path) throws Exception;
	public void deleteStudy(long s_num) throws Exception;
	
	public int createStudyTable(long s_num);
	public void dropStudyTable(long s_num) throws Exception;
	
	public List<StudyInfo> listMyStudy(String userId); 
	
}
