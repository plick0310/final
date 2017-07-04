package com.wooltari.mockTest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;


@Controller("community.mockTest.mockTestController")
public class MockTestController {

	@Autowired
	private MockTestService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("/mockTest/main")
	public String main(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 5; // 한 화면에 보여주는 게시물 수
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		
		dataCount = service.dataCount(map); // 카운트는 최대 5까지 설정.
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		// 시험정보 
		List<MockTest> examinfoList = service.readExamList(map);
		// 글 리스트
		List<MockTest> examwishList = service.examwishList(map);
		
		
		//리스트 번호
		Date endDate = new Date();
		long gap;
		int wishlistNum, n = 0;
		Iterator<MockTest> it = examwishList.iterator();
		while(it.hasNext()) {
			MockTest data = (MockTest)it.next();
			wishlistNum = dataCount - (start + n - 1);
			data.setWishlistNum(wishlistNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate = formatter.parse(data.getExamwishDate());
			
			gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000); // 날짜차이 (일)
			data.setGap(gap);
			
			data.setExamwishDate(data.getExamwishDate().substring(0, 5));
			
			n++;
		}
		model.addAttribute("examinfoList", examinfoList);
		model.addAttribute("examwishList", examwishList);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount",dataCount);
		
		return ".community.mockTest.main";
	}
}
