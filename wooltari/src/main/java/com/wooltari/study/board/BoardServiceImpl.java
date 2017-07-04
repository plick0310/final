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
			
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
				// 파일 업로드
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
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
		// TODO Auto-generated method stub
		
	}



}
