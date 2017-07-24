package com.wooltari.study;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;

@Service("study.studyService")
public class StudyServiceImpl implements StudyService {

   @Autowired
   private CommonDAO dao;
   
   @Autowired
   private FileManager fileManager;
   
   @Override
   public List<StudyCategory> listBigCategory() {
      List<StudyCategory> list= new ArrayList<>();
      try {
         list=dao.getListData("study.listBigCategory");
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return list;
   }

   @Override
   public List<StudyCategory> listSmallCategory(int parent) {
      List<StudyCategory> list= new ArrayList<>();
      try {
         list=dao.getListData("study.listSmallCategory", parent);
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return list;
   }

   @Override
   public List<StudyCity> listBigCity() {
      List<StudyCity> list = new ArrayList<>();
      try {
         list =dao.getListData("study.listBigCity");
         
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return list;
   }

   @Override
   public List<StudyCity> listSmallCity(int parent) {
      List<StudyCity> list = new ArrayList<>();
      try {
         list =dao.getListData("study.listSmallCity",parent);
         
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return list;
   }

   @Override
   public long maxS_num() {
      long result=0;
      try {
         
         result=(Long)dao.getReadData("study.maxStudySeq");
         if(result<10000)
            result=10000;
      } catch (Exception e) {
         e.printStackTrace();
      }
      return result;
   }

   @Override
   public void insertStudy(StudyInfo dto,String path) throws Exception{
      
      try {

         long s_num=maxS_num()+1;
         
         dto.setS_num(s_num);
         
         
         if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
            // 파일 업로드
            String newFilename=fileManager.doFileUpload(dto.getUpload(), path);
            dto.setImageFileName(newFilename);
         }
         
         dao.insertData("study.insertStudy",dto);
         
      
         for(int i=0; i<dto.getChoiceCategory().size(); i++){
            dto.setCategory(dto.getChoiceCategory().get(i));
            dao.insertData("study.insertstudyCategory", dto);
         }
         
         for(int i=0; i<dto.getChoiceCity().size(); i++){
            dto.setCity(dto.getChoiceCity().get(i));
            dto.setPoint_x(dto.getPointx().get(i));
            dto.setPoint_y(dto.getPointy().get(i));
            dao.insertData("study.insertstudyCity", dto);
         }
         
         for(int i=0; i<dto.getTarget().size() ; i++){
            dto.setS_target(dto.getTarget().get(i));
            dao.insertData("study.insertstudyTarget", dto);
         }
         
         createStudyTable(s_num); //스터디게시판 동적생성
         
         
      } catch (Exception e) {
         System.out.println(e.toString());
         throw e;
      }
      
   }


   @Override
   public void updateStudy(StudyInfo dto,String path ) throws Exception {
		try {
			
			
			//이미지 수정
			
			// 업로드한 파일이 존재한 경우
				if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
					String newFilename = fileManager.doFileUpload(dto.getUpload(), path);
					
					if (newFilename != null) {
						// 이전 파일 지우기
						if(dto!=null && dto.getImageFileName()!=null) {
							fileManager.doFileDelete(dto.getImageFileName(), path);
						}
								
						dto.setImageFileName(newFilename);
					}			
				}else{
					dto.setImageFileName(dto.getImageFileName());//기존이미지 유지...
				}
				
	
			dao.deleteData("study.deletestudyCategory", dto.getS_num());
			dao.deleteData("study.deletestudyCity", dto.getS_num());
	        dao.deleteData("study.deletestudyTarget",dto.getS_num());
	        dao.updateData("study.updateStudy",dto);
	        
	        for(int i=0; i<dto.getChoiceCategory().size(); i++){
	            dto.setCategory(dto.getChoiceCategory().get(i));
	            dao.insertData("study.insertstudyCategory", dto);
	         }
	      
	        for(int i=0; i<dto.getChoiceCity().size(); i++){
	            dto.setCity(dto.getChoiceCity().get(i));
	            dto.setPoint_x(dto.getPointx().get(i));
	            dto.setPoint_y(dto.getPointy().get(i));
	            dao.insertData("study.insertstudyCity", dto);
	         }
	         
	         for(int i=0; i<dto.getTarget().size() ; i++){
	            dto.setS_target(dto.getTarget().get(i));
	            dao.insertData("study.insertstudyTarget", dto);
	         }
	        
	         
		}catch (Exception e) {
			throw e;
		}
	   
   }

   @Override
   public void createStudyTable(long s_num) throws Exception{
      try {
         
         dao.updateData("study.createStudyBoard", s_num);
         dao.updateData("study.createStudyPhoto", s_num);
         dao.updateData("study.StudyBoardReply", s_num);
         dao.updateData("study.StudyBoardLike", s_num);
         dao.updateData("study.createStudyCalendar", s_num);
         dao.updateData("study.StudyCalendarReply", s_num);
      
         
      } catch (Exception e) {
         throw e;
         
      }
   
   }
   
   @Override
   public void deleteStudy(long s_num)  throws Exception {
      try {
         dao.deleteData("study.dropStudyBoard", s_num);
         dao.deleteData("study.dropStudyPhoto", s_num);
         dao.deleteData("study.deletestudyCategory", s_num);
         dao.deleteData("study.deletestudyCity", s_num);
         dao.deleteData("study.deletestudyTarget", s_num);
         
      } catch (Exception e) {
        throw e;
      }
      
   }
   


   @Override
   public void dropStudyTable(long s_num) throws Exception {
      // TODO Auto-generated method stub
      
   }

   @Override
   public List<StudyInfo> listMyStudy(String userId) {
      List<StudyInfo> list = new ArrayList<>();
      try {
         list =dao.getListData("study.listMyStudy",userId);
         
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return list;
   }

   @Override
   public List<StudyInfo> list2MyStudy(String userId) {
         List<StudyInfo> list = new ArrayList<>();
         try {
            list =dao.getListData("study.listMyStudy2",userId);
            
         } catch (Exception e) {
            System.out.println(e.toString());
         }
         return list;
   }
   
   @Override
   public List<StudyInfo> list3MyStudy(String userId) {
         List<StudyInfo> list = new ArrayList<>();
         try {
            list =dao.getListData("study.listMyStudy3",userId);
            
         } catch (Exception e) {
            System.out.println(e.toString());
         }
         return list;
   }
   
   
   @Override
   public StudyInfo readMyStudy(long s_num) {
      StudyInfo dto = new StudyInfo();
      
      try {
         dto = dao.getReadData("study.readMyStudy", s_num);
         
         List<String> target = dao.getListData("study.readMyTarget",s_num);
         dto.setTarget(target);
         
      } catch (Exception e) {
    	  System.out.println(e.toString());
      }
      return dto;
   }

   @Override
   public List<StudyCategory> readMyCategory(long s_num) {
	   List<StudyCategory> listCategory = new ArrayList<>();
	   try {
		
		   listCategory = dao.getListData("study.readMyCategory", s_num);
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	   
	   return listCategory;
   }
	
	@Override
	public List<StudyLocal> readMyLocal(long s_num) {
		List<StudyLocal> listLocal = new ArrayList<>();
		try {
			listLocal = dao.getListData("study.readMyLocal", s_num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return listLocal;
	}
	
	

}