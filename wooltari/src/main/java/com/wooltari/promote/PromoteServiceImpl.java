package com.wooltari.promote;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;

@Service("promote.serviceImpl")
public class PromoteServiceImpl implements PromoteService{
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private CommonDAO dao;
	
	//글추가
	@Override
	public int insertBoard(Promote dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null){
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImageFileName(newFilename);			
			}
			result=dao.insertData("promote.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//전체리스트
	@Override
	public List<Promote> listBoard(Map<String, Object> map) {
		List<Promote> list=null;
		
		try {
			list=dao.getListData("promote.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	//글개수
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.getIntValue("promote.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//글보기
	@Override
	public Promote readBoard(int num) {
		Promote dto=null;
		try {
			
			dto=dao.getReadData("promote.readBoard",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	//조회수증가
	@Override
	public int updateHitCount(int num) {
		int result=0;
		try {
			result=dao.updateData("promote.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateBoard(Promote dto) {
		int result=0;
		try {
			result=dao.updateData("promote.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteBoard(int num, String imageFileName, String pathname) {
		int result=0;
		try {
			if(imageFileName!=null)
				fileManager.doFileDelete(imageFileName, pathname);
			
			result=dao.deleteData("promote.deleteBoard",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertReply(PromoteReply dto) {
		int result=0;
		
		try {
			result=dao.insertData("promote.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<PromoteReply> listReply(Map<String, Object> map) {
		List<PromoteReply> list=null;
		
		try {
			list=dao.getListData("promote.readReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("promote.replyCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("promote.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteBoardId(String userId, String root) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	//가입 스터디 목록
	@Override
	public List<Promote> pushStudy(Map<String, Object> map) {
		List<Promote> list=null;
		try {
			list=dao.getListData("promote.pushStudy", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
