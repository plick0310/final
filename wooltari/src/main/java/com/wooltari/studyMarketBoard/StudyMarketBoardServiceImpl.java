package com.wooltari.studyMarketBoard;

import java.util.List;
import java.util.Map;

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
	private FileManager fileManager;
		
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
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null){
						String originalFilename=mf.getOriginalFilename();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						
						insertFile(dto);
					}					
				}				
			}
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.getIntValue("studyMarketBoard.dataCount",map);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<StudyMarketBoard> listBoard(Map<String, Object> map) {
		List<StudyMarketBoard> list=null;
		try{
			list=dao.getListData("studyMarketBoard.listBoard", map);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}


	@Override
	public StudyMarketBoard readBoard(int num) {
		StudyMarketBoard dto=null;
		try{
			dto=dao.getReadData("studyMarketBoard.readBoard",num);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		try{
			result=dao.updateData("studyMarketBoard.updateHitCount", num);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public StudyMarketBoard preReadBoard(Map<String, Object> map) {
		StudyMarketBoard dto=null;
		try{
			dto=dao.getReadData("studyMarketBoard.preReadBoard",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public StudyMarketBoard nextReadBoard(Map<String, Object> map) {
		StudyMarketBoard dto=null;
		try{
			dto=dao.getReadData("studyMarketBoard.nextReadBoard",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateBoard(StudyMarketBoard dto, String pathname) {
		int result=0;
		
		try{
			result=dao.updateData("studyMarketBoard.updateBoard", dto);
			
			if(!dto.getUpload().isEmpty()){
				for(MultipartFile mf:dto.getUpload()){
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename !=null){
						String originalFilename=mf.getOriginalFilename();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						
						insertFile(dto);
					}
				}
			}
			
		}catch(Exception e){
			System.out.println(e.toString());
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
			dao.deleteData("studyMarketBoard.deleteBoard", num);
			result=1;
		}catch(Exception e){
		}
		return result;
	}
	
	//파일.................................................
	@Override
	public int insertFile(StudyMarketBoard dto) {
		int result=0;
		try{
			result=dao.insertData("studyMarketBoard.insertFile", dto);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<StudyMarketBoard> listFile(int num) {
		List<StudyMarketBoard> listFile=null;
		
		try{
			listFile=dao.getListData("studyMarketBoard.listFile", num);			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return listFile;
	}
	
	@Override
	public StudyMarketBoard readFile(int fileNum) {
		StudyMarketBoard dto=null;
		
		try{
			dto=dao.getReadData("studyMarketBoard.readFile", fileNum);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public int deleteFile(Map<String, Object> map) {
		int result =0;
		
		try{
			result= dao.deleteData("studyMarketBoard.deleteFile", map);
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		
		return result;
	}

	//좋아요......................................................
	@Override
	public int insertLikeBoard(StudyMarketBoard dto) {
		int result=0;
		
		try{
			result=dao.insertData("studyMarketBoard.insertLikeBoard", dto);
		}catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public int countLikeBoard(int num) {
		int result=0;
		try{
			result=dao.getIntValue("studyMarketBoard.countLikeBoard",num);
		}catch(Exception e){
			
		}
		
		return result;
	}

	
	//리플라이......................................................
	@Override
	public int insertReply(Reply dto) {
		int result=0;
		try{
			result=dao.insertData("studyMarketBoard.insertReply", dto);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try{
			list=dao.getListData("studyMarketBoard.listReply",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.getIntValue("studyMarketBoard.replyDataCount",map);
		}catch(Exception e){
		}
		return result;
	}
	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try{
			result=dao.deleteData("studyMarketBoard.deleteReply", map);
		}catch(Exception e){
			
		}
		return result;
	}
	

	
	//.............................................
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

	
	// 회원이 탈퇴한 경우 게시물 삭제.
	// 좋아요/싫어요, 댓글은 ON DELETE CASCADE 옵션으로 자동 삭제	
	@Override
	public int deleteBoardId(String userId, String root) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int replyCountAnswer(int answer) {
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
	public List<StudyMarketBoard> bestStudyMarket(Map<String, Object> map) {
		List<StudyMarketBoard> list= null;
		
		try{
			list=dao.getListData("studyMarketBoard.bestStudyMarket",map);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}
}
