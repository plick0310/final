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

	@Override
	public long maxS_num() {
		long result=0;
		try {
			
			result=(Long)dao.getReadData("study.maxStudySeq");
			if(result<10000)
				result=10000;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertStudy(StudyInfo dto) throws Exception{
		
		try {

			long s_num=maxS_num()+1;
			
			dto.setS_num(s_num);
			
			dao.insertData("study.insertStudy",dto);
			
			for(int i=0; i<dto.getChoiceCategory().size(); i++){
				dto.setCategory(dto.getChoiceCategory().get(i));
				dao.insertData("study.insertstudyCategory", dto);
			}
			
			for(int i=0; i<dto.getChoiceCity().size(); i++){
				dto.setCity(dto.getChoiceCity().get(i));
				dao.insertData("study.insertstudyCity", dto);
			}
			
			for(int i=0; i<dto.getTarget().length ; i++){
				dto.setS_target(dto.getTarget()[i]);
				dao.insertData("study.insertstudyTarget", dto);
			}
			//createStudyTable(s_num); //스터디게시판 동적생성

		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		
	}

	@Override
	public void deleteStudy(long s_num)  throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createStudyTable(long s_num) throws Exception {
		
		
		try {
			
			dao.updateData("study.createStudyBoard", s_num);
			dao.updateData("study.createStudyPhoto", s_num);
			dao.updateData("study.StudyBoardReply", s_num);
			dao.updateData("study.StudyBoardLike", s_num);
			dao.updateData("study.createStudyCalendar", s_num);
			dao.updateData("study.StudyCalendarReply", s_num);
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
	}

	@Override
	public void dropStudyTable(long s_num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
