package com.wooltari.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;
import com.wooltari.review.Review;
import com.wooltari.review.ReviewReply;
import com.wooltari.review.ReviewService;

@Service("study.reviewService")
public class ReviewImpl implements ReviewService{
	@Autowired
	private FileManager fileManager;
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertBoard(Review dto, String pathname) {
		int result=0;
		try {
			if(dto.getUpload()!=null){
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setImageFileName(newFilename);			
			}
			result=dao.insertData("review.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Review> listBoard(Map<String, Object> map) {
		List<Review> list=null;
		
		try {
			list=dao.getListData("review.listBoard",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount() {
		int result=0;
		
		try {
			result=dao.getIntValue("review.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Review readBoard(int num) {
		Review dto=null;
		try {
			dto=dao.getReadData("review.readBoard",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		try {
			result=dao.updateData("review.updateHitCount",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateBoard(Review dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int num, String imageFileName, String pathname) {
		int result=0;
		try {
			if(imageFileName!=null)
				fileManager.doFileDelete(imageFileName, pathname);
			
			result=dao.deleteData("review.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public int insertReply(ReviewReply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewReply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*평균별점*/
	@Override
	public int insertStar(Review dto) {
		int result=0;
		try {
			result=dao.insertData("review.insertStar", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int readStar(int num) {
		int result=0;
		
		try {
			result=dao.getIntValue("review.readStar",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int manyStar(int num) {
		int result=0;
		
		try {
			result=dao.getIntValue("review.manyStar",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
