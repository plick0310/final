package com.wooltari.message;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.wooltari.common.MyUtilBootstrap;
import com.wooltari.member.SessionInfo;

@Controller("message.messageController")
public class MessageController {
	@Autowired
	private MessageService service;
	@Autowired
	private MyUtilBootstrap myUtil;

	@RequestMapping(value="/message/send", method=RequestMethod.GET)
	public String memberChat(Message dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		try {
			dto.setSent_Id(info.getUserId());
			service.sendMessage(dto);
		} catch (Exception e) {
			
		}
		return "message/send";
	}
	
	@RequestMapping(value="/message/read", method=RequestMethod.GET)
	public String msgRead() throws Exception {
		return "message/";
	}
	
	@RequestMapping(value="/message/count", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> msgCount(HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		model.put("userId", info.getUserId());
		model.put("receive", "receive");
		int recv_Count = service.noreadCount(model);
		model.remove("receive");
		
		model.put("recv_Count", recv_Count);
		return model;
	}
	
	@RequestMapping(value="/message/list")
	public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="mode", defaultValue="all") String mode,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model, HttpServletRequest req , HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		
		int rows=15;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("mode", mode);
		map.put("searchValue", searchValue);
		dataCount = service.dataCount(map);
		
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
        List<Message> list = service.listMessage(map);
        
        // 리스트 번호
        int listNum, n = 0;
        Iterator<Message> it = list.iterator();
        while(it.hasNext()){
        	Message data = it.next();
        	listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        String query = "";
        //String listUrl = cp+"/message/list";
        String articleUrl = cp+"/message/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "mode=" +mode + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	//listUrl = cp+"/message/list?" + query;
        	articleUrl = cp+"/message/article?page=" + current_page + "&"+ query;
        }
        
        
        String paging = myUtil.pagingMethod(current_page, total_page, "messagePaging");
        System.out.println(mode);
        
        model.addAttribute("list", list);
        model.addAttribute("mode", mode);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);	
        
		return "message/list";
	}
}
