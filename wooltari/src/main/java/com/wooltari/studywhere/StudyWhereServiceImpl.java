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
		StudyWhere dto = null;
		
		try {
			dto=dao.getReadData("studywhere.readStudyWhere",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public int updateHitCount(int num) {
		int result=0;
		try {
			result=dao.updateData("studywhere.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public StudyWhere preReadStudyWhere(Map<String, Object> map) {
		StudyWhere dto = null;
		try {
			dto=dao.getReadData("studywhere.preReadStudyWhere",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public StudyWhere nextReadStudyWhere(Map<String, Object> map) {
		StudyWhere dto=null;
		try {
			dto=dao.getReadData("studywhere.nextReadStudyWhere",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public int updateStudyWhere(StudyWhere dto, String pathname) {
		int result = 0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				/*String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);*/
				
				/*if(newFilename != null) {
					if(dto.getSaveFilename().length()!=0&&dto.getSaveFilename()!=null) {
						fileManager.doFileDelete(dto.getSaveFilename(), pathname);
					}
					dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
				}*/
			}
			dao.updateData("studywhere.updateStudyWhere", dto);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int deleteStudyWhere(int num, String pathname, String userId) {
int result= 0;
		
		try {
			StudyWhere dto = readStudyWhere(num);
			if(dto!=null) {
				if(! dto.getUserId().equals(userId)&&!userId.equals("admin")) {
					return result;
				}
				if(dto.getImageFileName()!=null&&dto.getImageFileName().length()!=0) {
					fileManager.doFileDelete(dto.getImageFileName(), pathname);
				}
			}
			dao.deleteData("studywhere.deleteStudyWhere", num);
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public int insertLikeStudyWhere(StudyWhere dto) {
int result = 0;
		
		try {
			result=dao.insertData("studywhere.insertLikeStudyWhere", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int countLikeStudyWhere(int num) {
int result = 0;
		
		try {
			result=dao.getIntValue("studywhere.countLikeStudyWhere", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int insertReply(Reply dto) {
int result=0;
		
		try {
			result=dao.insertData("studywhere.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Reply> listReply(Map<String, Object> map) {
List<Reply> list = null;
		
		try {
			list=dao.getListData("studywhere.listReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int replyDataCount(Map<String, Object> map) {
	int result=0;
		
		try {
			result=dao.getIntValue("studywhere.replyDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int deleteReply(Map<String, Object> map) {
int result=0;
		
		try {
			result=dao.deleteData("studywhere.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	

	
}
