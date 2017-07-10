package com.wooltari.mockTest;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.member.SessionInfo;


@Controller("community.mockTest.mockTestController")
public class MockTestController {

	@Autowired
	private MockTestService service;
	
	@RequestMapping("/mockTest/main")
	public String main(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		int rows = 5; // 한 화면에 보여주는 게시물 수
		int dataCount;
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
		
		dataCount = service.dataCount(map); // 카운트는 최대 5까지 설정.
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		// 시험정보 
		List<MockTest> examinfoList = service.readExamList(map);
		// 글 리스트
		List<MockTest> examwishList = service.examwishList(map);
		// 글작성/수정 여부 확인
		List<MockTest> examcheckMode = service.readcheckMode(map);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date a = new Date();
		
		//리스트 번호
		String bD = formatter.format(a);
		
		Date beginDate = formatter.parse(bD);
		
		long gap;
		// 글번호 만들기
		int wishlistNum = 0;
		int n = 1;
		Iterator<MockTest> it = examwishList.iterator();
		while(it.hasNext()) {
			MockTest data = (MockTest)it.next();
			wishlistNum = n;
			data.setWishlistNum(wishlistNum);
			
			Date endDate = formatter.parse(data.getExamwishDate());
			
			gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000); // 날짜차이 (일)
			data.setGap((int) gap);
			
			data.setExamwishDate(data.getExamwishDate().substring(0, 10));
			data.setDday(data.getGap());
			
			n++;
		}
		model.addAttribute("examcheckMode", examcheckMode);
		model.addAttribute("examinfoList", examinfoList);
		model.addAttribute("examwishList", examwishList);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount",dataCount);
		
		return ".community.mockTest.main";
	}
	
	@RequestMapping(value="/mockTest/deleteList")
	public String deleteList(
			String [] nums
			) throws Exception {
		
		List<String> list = Arrays.asList(nums);
		service.deleteExamwishList(list);
		
		return "redirect:/mockTest/main";
	}
	
	@RequestMapping(value="/mockTest/createdList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdList (
			@RequestParam String Name,
			@RequestParam String Date,
			HttpSession session
			) throws Exception {
		
		System.out.println("여기 들어왔을까요---------------------------");
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		String userId=info.getUserId();
		
		Map<String, Object> map =new HashMap<>();
		map.put("userId", userId);
		map.put("examinfoName", Name);
		map.put("examwishDate", Date);
		
		service.insertExamwishList(map);
		
		MockTest dto = new MockTest();
		System.out.println("checkMode 랍니다-----------------------------------------"+dto.getCheckMode());
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/mockTest/updateList", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateList(
			@RequestParam String Name,
			@RequestParam String Date,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		String userId = info.getUserId();
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("examinfoName", Name);
		map.put("examwishDate", Date);
		
		service.updateExamwishLIST(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
}
