package com.wooltari.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("study.reviewController")
public class ReviewController {
	
	@RequestMapping("review/list")
	public String reviewList(){
		
		return ".study.review.list"; 
	}
}
