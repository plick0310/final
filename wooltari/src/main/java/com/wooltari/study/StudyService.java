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
	public void updateStudy(StudyInfo dto,String path) throws Exception;
	
	
	
	public void createStudyTable(long s_num) throws Exception;
	public void dropStudyTable(long s_num) throws Exception;
	
	public List<StudyInfo> listMyStudy(String userId); 
	public List<StudyInfo> list2MyStudy(String userId); 
	
	public StudyInfo readMyStudy(long s_num);
	public List<StudyCategory> readMyCategory(long s_num);
	public List<StudyLocal> readMyLocal(long s_num);
}
