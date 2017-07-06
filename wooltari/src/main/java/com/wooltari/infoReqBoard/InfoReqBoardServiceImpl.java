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
		InfoReqBoard dto=null;		
		try{			
			dto=dao.getReadData("infoReqBoard.readBoard", num);			
		}catch(Exception e){
			System.out.println(e.toString());
		}		
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;		
		try{			
			result=dao.updateData("infoReqBoard.updateHitCount", num);
		}catch(Exception e){
			System.out.println(e.toString());
		}		
		return result;
	}

	@Override
	public InfoReqBoard preReadBoard(Map<String, Object> map) {
		InfoReqBoard dto=null;
		
		try{
			dto=dao.getReadData("infoReqBoard.preReadBoard", map);
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return dto;
	}

	@Override
	public InfoReqBoard nextReadBoard(Map<String, Object> map) {
		InfoReqBoard dto=null;
		
		try{
			dto=dao.getReadData("infoReqBoard.nextReadBoard", map);
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return dto;
	}


	@Override
	public int updateBoard(InfoReqBoard dto, String pathname) {
		int result=0;
		
		try{
			result=dao.updateData("infoReqBoard.updateBoard", dto);
			
			if(! dto.getUpload().isEmpty()){
				for(MultipartFile mf: dto.getUpload()){
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename != null){
						String originalFilename=mf.getOriginalFilename();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						
						insertFile(dto);						
					}
				}
			}			
		}catch(Exception e){ 			
		}		
		return result;
	}

	@Override
	public int deleteBoard(int num, String saveFilename, String pathname) {
		int result=0;
		
		try{
			if(saveFilename !=null){
				fileManager.doFileDelete(saveFilename, pathname);
				
			}
			dao.deleteData("infoReqBoard.deleteBoard", num);
			result=1;
			
		}catch(Exception e){
			
		}
		return result;
	}

	
	
	//좋아요
	@Override
	public int insertLikeBoard(InfoReqBoard dto) {
		int result=0;
		
		try{
			result=dao.insertData("infoReqBoard.insertLikeBoard", dto);			
		}catch(Exception e){			
		}		
		return result;
	}

	@Override
	public int countLikeBoard(int num) {
		int result=0;		
		try{
			result=dao.getIntValue("infoReqBoard.countLikeBoard", num);
		}catch(Exception e){			
		}		
		return result;
	}
	
	// 회원이 탈퇴한 경우 게시물 삭제.
	// 좋아요/싫어요, 댓글은 ON DELETE CASCADE 옵션으로 자동 삭제	
	@Override
	public int deleteBoardId(String userId, String root) {
		return 0;
	}

	
	//리플라이

	@Override
	public int insertReply(Reply dto) {
		int result=0;		
		try{			
			result=dao.insertData("infoReqBoard.insertReply", dto);
		}catch(Exception e){
			System.out.println(e.toString());
		}		
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try{
			list=dao.getListData("infoReqBoard.listReply", map);
		}catch(Exception e){
			System.out.println(e.toString());
		}		
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try{
			result=dao.getIntValue("infoReqBoard.replyDataCount", map);			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("infoReqBoard.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	
	
	//리플라이 관련 미기능 
	@Override
	public List<Reply> listReplyAnswer(int answer) {
		return null;
	}


	@Override
	public int replyCountAnswer(int answer) {
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

	//파일
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
		List<InfoReqBoard> listFile=null;
		
		try{
			listFile=dao.getListData("infoReqBoard.listFile", num);			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return listFile;
	}

	@Override
	public InfoReqBoard readFile(int fileNum) {
		InfoReqBoard dto=null;
		
		try{
			dto=dao.getReadData("infoReqBoard.readFile", fileNum);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result =0;
		
		try{
			result= dao.deleteData("infoReqBoard.deleteFile", map);
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return result;
	}
/*
	@Override
	public int deleteList(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("infoReqBoard.deleteList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}*/

	@Override
	public int deleteList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteList(List<Integer> list) {
		int result=0;
		
		try{
			result=dao.deleteData("infoReqBoard.deleteList", list);
		}catch(Exception e){			
		}
		
		return result;
	}

}
