package com.wooltari.studyMarketBoard;

import java.util.List;
import java.util.Map;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;


@Service("studyMarketBoard.StudyMarketBoard")
public class StudyMarketBoardServiceImpl implements StudyMarketBoardService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager FileManager;
		
	@Override
	public int insertBoard(StudyMarketBoard  dto, String pathname) {
		int result=0;
		
		try{
			int maxNum=dao.getIntValue("studyMarketBoard.maxNum");
			dto.setNum(maxNum+1);
			
			result=dao.insertData("studyMarketBoard.insertBoard", dto);
			
			//파일 업로드
			if(!dto.getUpload().isEmpty()){
				for(MultipartFile mf:dto.getUpload()){
					if(mf.isEmpty())
						continue;
				}
			
				
				
			}
			
			
		}catch(Exception e){
			
			System.out.println(e.toString());
		}
		
		
		return result;
	}

	@Override
	public List<StudyMarketBoardService> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StudyMarketBoard readBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public StudyMarketBoard preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyMarketBoard nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(StudyMarketBoardService dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int num, String saveFilename, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLikeBoard(StudyMarketBoard dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countLikeBoard(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoardId(String userId, String root) {
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
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReplyLike(Reply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> replyCountLike(int replyNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertFile(StudyMarketBoard dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StudyMarketBoard> listFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyMarketBoard readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReplyStar(Reply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(List<Integer> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
