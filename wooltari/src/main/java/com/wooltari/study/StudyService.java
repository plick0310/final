package com.wooltari.study;

import java.util.List;


public interface StudyService {
	public List<StudyCategory> listBigCategory();
	public List<StudyCategory> listSmallCategory(int parent);
}