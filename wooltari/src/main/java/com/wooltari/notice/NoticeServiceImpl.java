package com.wooltari.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	//삽입
	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result=0;
		
		try{
			int maxNum=dao.getIntValue("notice.maxNum");
			dto.setNum(maxNum+1);//setNum으로 dto에 저장한다.
			
			result= dao.insertData("notice.insertNotice", dto);//dao에 insertData함수를 부른다.
			
			//파일 업로드
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
	//데이타 카운트
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try{
			result=dao.getIntValue("notice.dataCount", map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//리스트
	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		try{
			list=dao.getListData("notice.listNotice",map);
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list=null;
		try{
			list=dao.getListData("notice.listNoticeTop");
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public Notice readNotice(int num) {
		Notice dto=null;
		
		try{
			dto=dao.getReadData("notice.readNotice",num);
		}catch (Exception e) {
			System.out.println(e.toString());
		}		
		
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto=null;
		
		try{
			dto=dao.getReadData("notice.preReadNotice",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto=null;
		try{
			dto=dao.getReadData("notice.nextReadNotice",map);
		}catch(Exception e){
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result=0;
		
		try{
			result=dao.updateData("notice.updateNotice", dto);
			
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
	public int deleteNotice(int num, String saveFilename, String pathname) {
		int result=0;
		
		try{
			if(saveFilename !=null){
				fileManager.doFileDelete(saveFilename, pathname);
			}
			dao.deleteData("notice.deleteNotice", num);
			result=1;
		}catch(Exception e){
		}
		return result;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		
		
		return result;
	}

	@Override
	public int insertFile(Notice dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> listFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteList(List<Integer> list) {
		int result=0;
		
		try{
			result=dao.deleteData("notice.deleteList", list);
		}catch(Exception e){			
		}
		
		return result;
	}

	
}
