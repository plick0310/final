package com.wooltari.point;

import java.net.URLDecoder;
import java.util.HashMap;
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

import com.wooltari.common.MyUtilBootstrap;
import com.wooltari.member.MemberService;
import com.wooltari.member.SessionInfo;

@Controller("point.pointController")
public class PointController {
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private PointService pservice;
	
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping(value="/point/log", method=RequestMethod.GET)
	public String listLog(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="mode", defaultValue="all") String mode,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model, HttpServletRequest req , HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		
		
		int rows=15;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		System.out.println(searchValue);
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("mode", mode);
		map.put("searchValue", searchValue);
		dataCount = pservice.dataCount(map);
		
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
		
        // 쪽지 리스트
        List<Point> list = pservice.listLog(map);
        
        String paging = myUtil.pagingMethod(current_page, total_page, "paging");
        System.out.println("mode : " + mode + " / page : " + current_page + " / searchValue : " + searchValue);
        
        model.addAttribute("list", list);
        model.addAttribute("mode", mode);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);	
        
		return "member/point/log";
	}
	
	@RequestMapping(value="/point/pay", method=RequestMethod.GET)
	public String payPoint(){
		
		return "member/point/log";
	}
	
}
