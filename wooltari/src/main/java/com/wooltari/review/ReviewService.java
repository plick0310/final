package com.wooltari.review;

import java.util.List;
import java.util.Map;

import com.wooltari.review.Review;
import com.wooltari.review.ReviewReply;

public interface ReviewService {
	
	public int insertBoard(Review dto, String pathname);
	public List<Review> listBoard(Map<String, Object> map);
	public int dataCount();
	public Review readBoard(int num);
	public int updateHitCount(int num);
	public int updateBoard(Review dto, String pathname);
	public int deleteBoard(int num, String imageFileName, String pathname);
	
	public int insertStar(Review dto);
	public int readStar(int num);
	public int manyStar(int num);
	
	public int insertReply(ReviewReply dto);
	public List<ReviewReply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	public List<Review> pushStudy(Map<String, Object>map);
}
