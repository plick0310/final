package com.wooltari.studywhere;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;

@Service("studywhere.StudyWhereImpl")
public class StudyWhereServiceImpl implements StudyWhereService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	@Override
	public int insertStudyWhere(StudyWhere dto, String pathname) {

		int result=0;

		try {
			if(!dto.getUpload().isEmpty()){//파일올리면
				String filename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImageFileName(filename);
			
			}
			
			result=dao.insertData("studywhere.insertStudyWhere", dto);
		} catch (Exception e) {

		}
		
		return result;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result=dao.getIntValue("studywhere.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<StudyWhere> listStudyWhere(Map<String, Object> map) {
		List<StudyWhere> list =null;
		
		try {
			list=dao.getListData("studywhere.listStudyWhere",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public StudyWhere readStudyWhere(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public StudyWhere preReadStudyWhere(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public StudyWhere nextReadStudyWhere(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updateStudyWhere(StudyWhere dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteStudyWhere(int num, String pathname, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertLikeStudyWhere(StudyWhere dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int countLikeStudyWhere(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertReply(Reply dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
