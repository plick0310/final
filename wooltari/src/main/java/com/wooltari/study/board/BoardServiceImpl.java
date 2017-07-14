package com.wooltari.study.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;

@Service("study.board.BoardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertBoard(Board dto , String pathname) throws Exception {
		
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("tableName",dto.getTableName());
			int maxNum=dao.getIntValue("studyBoard.maxNum", map);
			dto.setNum(maxNum+1);
			
			if(dto.getUpload2()!=null && ! dto.getUpload2().isEmpty()) {
				// 파일 업로드
				String newFilename=fileManager.doFileUpload(dto.getUpload2(), pathname);
				dto.setImageFileName(newFilename);
			}
		
			dao.insertData("studyBoard.insertBoard", dto);
			
			
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list= null;
		try {
			list=dao.getListData("studyBoard.listBoard",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
 
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result= dao.getIntValue("studyBoard.dataCount",map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("studyBoard.deleteBoard", map);
			//파일삭제
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int insertLikeBoard(Map<String, Object> map) {
		int result=0;
		try {
			result= dao.insertData("studyBoard.insertLikeBoard",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int countLikeBoard(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.getIntValue("studyBoard.countLikeBoard",map);
		} catch (Exception e) {
			
		}
		
		return result;
	}
	
	//좋아요...?
	@Override
	public Map<String, Object> checkLike(Map<String, Object> map) {
		Map<String, Object> map2 = new HashMap<>() ;
		try {
			map2 = dao.callSelectListProcedureMap("studyBoard.checkLike", map);
		} catch (Exception e) {
			
		}
		return map2;
	}

	@Override
	public void insertReplyBoard(Reply dto) throws Exception {
		try {
			
			Map<String, Object> map = new HashMap<>();
			map.put("tableName", dto.getTableName());
			int maxNum = dao.getIntValue("studyBoard.maxReplyNum",map);
			dto.setReNum(maxNum+1);
			
			
			dao.insertData("studyBoard.insertReply", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteReplyBoard(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("studyBoard.deleteReply", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list= null;
		try {
			list=dao.getListData("studyBoard.listReply",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int countReplyBoard(Map<String, Object> map) {
		int result=0;
		try {
			result= dao.getIntValue("studyBoard.replyCount",map);
		} catch (Exception e) {
			
		}
		
		return result;
	}



}
