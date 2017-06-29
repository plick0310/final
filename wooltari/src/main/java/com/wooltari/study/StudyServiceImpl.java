package com.wooltari.study;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;

@Service("study.studyService")
public class StudyServiceImpl implements StudyService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<StudyCategory> listBigCategory() {
		List<StudyCategory> list= new ArrayList<>();
		try {
			list=dao.getListData("study.listBigCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<StudyCategory> listSmallCategory(int parent) {
		List<StudyCategory> list= new ArrayList<>();
		try {
			list=dao.getListData("study.listSmallCategory", parent);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<StudyCity> listBigCity() {
		List<StudyCity> list = new ArrayList<>();
		try {
			list =dao.getListData("study.listBigCity");
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<StudyCity> listSmallCity(int parent) {
		List<StudyCity> list = new ArrayList<>();
		try {
			list =dao.getListData("study.listSmallCity",parent);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
