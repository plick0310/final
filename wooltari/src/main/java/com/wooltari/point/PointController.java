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
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.common.MyUtilBootstrap;
import com.wooltari.member.Member;
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
	
	@RequestMapping(value="/point/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePoint(
			@RequestParam(value="value") int value,
			@RequestParam(value="info") String info,
			HttpSession session
			){
		SessionInfo sessionInfo=(SessionInfo)session.getAttribute("member");
		Member member = mservice.readMember(sessionInfo.getUserId());
		Map<String, Object> ajax = new HashMap<String, Object>();
		
		//포인트가 감소되는 작업일때 회원의 포인트 검사(감소가 가능한지)
		if(value < 0 && member.getPoint() < value){
			//보유 포인트보다 감소될 포인트가 작으면 "false" 리턴
			ajax.put("state", "false");
			return ajax;
		}
		//보유 포인트가 감소될 포인트보다 크면 실행
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("userId", sessionInfo.getUserId()); //포인트를 적용시킬 유저 아이디
			map.put("value", value); //추가 or 감소시킬 포인트양 (양수는 그냥 적으면되고 감소는 마이너스 붙임)
			map.put("info", info); //포인트 적용되는 이유(ex:글 작성,댓글 작성 등등..)
			pservice.insertLog(map); //서비스에서 insertLog를 호출하면 memberPoint 테이블에 로그가 insert 되면서 회원의 포인트가 적용 됨
		} catch (Exception e) {
			e.printStackTrace(); //포인트 적용 실패시 예외를 받는 곳(트랜잭션 처리함)
			ajax.put("state", "false");
			return ajax;
		}
		ajax.put("state", "true");
		return ajax;
	}
	@RequestMapping(value="/point/pay", method=RequestMethod.GET)
	public String payPoint(){
		
		return "member/point/log";
	}
	
}