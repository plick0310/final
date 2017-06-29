package com.wooltari.infoReqBoard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;


@Service("infoReqBoard.InfoReqBoardService")
public class InfoReqBoardServiceImpl implements InfoReqBoardService {
	@Autowired
	private CommonDAO  dao;
	@Autowired
	private FileManager fileManager;	

	@Override
	public int insertBoard(InfoReqBoard dto, String pathname) {
		int result=0;
		
		try{
			//새 글번호 생성
			int maxNum=dao.getIntValue("infoReqBoard.maxNum");
			dto.setNum(maxNum+1);
			
			result=dao.insertData("infoReqBoard.insertBoard", dto);
			
			//파일 업로드
			if(!dto.getUpload().isEmpty()){
				for(MultipartFile mf:dto.getUpload()){
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null){
						String originalFilename=mf.getOriginalFilename();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						
						insertFile(dto);
					}					
				}				
			}
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<InfoReqBoard> listBoard(Map<String, Object> map) {
		List<InfoReqBoard> list=null;
		
		try{
			list=dao.getListData("infoReqBoard.listBoard", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.getIntValue("infoReqBoard.dataCount", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public InfoReqBoard readBoard(int num) {
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		return 0;
	}

	@Override
	public InfoReqBoard preReadBoard(Map<String, Object> map) {
		return null;
	}

	@Override
	public InfoReqBoard nextReadBoard(Map<String, Object> map) {
		return null;
	}

	@Override
	public int updateBoard(InfoReqBoard dto, String pathname) {
		return 0;
	}

	@Override
	public int deleteBoard(int num, String saveFilename, String pathname) {
		return 0;
	}

	@Override
	public int insertLikeBoard(InfoReqBoard dto) {
		return 0;
	}

	@Override
	public int countLikeBoard(int num) {
		return 0;
	}

	@Override
	public int deleteBoardId(String userId, String root) {
		return 0;
	}

	@Override
	public int insertReply(Reply dto) {
		return 0;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		return null;
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		return 0;
	}

	@Override
	public int replyCountAnswer(int answer) {
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		return 0;
	}

	@Override
	public int insertReplyLike(Reply dto) {
		return 0;
	}

	@Override
	public Map<String, Object> replyCountLike(int replyNum) {
		return null;
	}

	@Override
	public int insertFile(InfoReqBoard dto) {
		int result=0;
		try{
			result=dao.insertData("infoReqBoard.insertFile", dto);
			
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return result;
	}

	@Override
	public List<InfoReqBoard> listFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InfoReqBoard readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
