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

	//메시지 전송 처리
	@RequestMapping(value="/message/send", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMessage(Message dto, HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state = "false";
		try {
			dto.setSent_Id(info.getUserId());
			service.sendMessage(dto);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		state = "true";
		model.put("state", state);
		return model;
	}
	
	//읽지 않은 메시지 개수 카운트 처리
	@RequestMapping(value="/message/count", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> dataCount(HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<>();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		model.put("userId", info.getUserId());
		model.put("receive", "receive");
		int recv_Count = service.noreadCount(model);
		model.remove("receive");
		
		model.put("recv_Count", recv_Count);
		return model;
	}
		
	//쪽지 보기,읽은 쪽지 처리
	@RequestMapping(value="/message/read")
	@ResponseBody
	public Map<String, Object> readMessage(@RequestParam int num, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		Message dto = null;
		try {
			dto = service.readMessage(num);
			if(dto.getRecv_Id().equals(info.getUserId()) && dto.getRead() == 0){
				service.updateReadMessage(num);
			}
		} catch (Exception e) {
			model.put("state", state);
		}
		state = "true";
		model.put("state", state);
		model.put("sent_Id", dto.getSent_Id());
		model.put("recv_Id", dto.getRecv_Id());
		model.put("content", dto.getContent());
		return model;
	}
	
	//받은 쪽지 읽은 쪽지 처리
	@RequestMapping(value="/message/msgread", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> readMessageList(@RequestParam(value="checkArray[]") List<Integer> list) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		try {
			service.readMessageList(list);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		state = "true";
		model.put("state", state);
		return model;
	}
	
	//받은 쪽지 보관함 이동 처리
	@RequestMapping(value="/message/msgkeep", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> keepMessageList(@RequestParam(value="checkArray[]") List<Integer> list) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		try {
			service.keepMessageList(list);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		state = "true";
		model.put("state", state);
		return model;
	}
	
	//받은 쪽지 휴지통 이동 처리
	@RequestMapping(value="/message/msgtrash", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> trashMessageList(@RequestParam(value="checkArray[]") List<Integer> list) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		try {
			service.trashMessageList(list);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		state = "true";
		model.put("state", state);
		return model;
	}
	
	//받은 쪽지함 이동 처리
	@RequestMapping(value="/message/msgreceive", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> receiveMessageList(@RequestParam(value="checkArray[]") List<Integer> list) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		try {
			service.receiveMessageList(list);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		state = "true";
		model.put("state", state);
		return model;
	}
	
	//받은 쪽지 휴지통 비우기 처리
	@RequestMapping(value="/message/msgdelete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMessageList(@RequestParam(value="checkArray[]") List<Integer> list) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		try {
			service.deleteMessageList(list);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		state = "true";
		model.put("state", state);
		return model;
	}
	
	//보낸 쪽지 삭제 처리
	@RequestMapping(value="/message/msgsenddelete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSendMessageList(@RequestParam(value="checkArray[]") List<Integer> list) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		try {
			service.deleteSendMessageList(list);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		state = "true";
		model.put("state", state);
		return model;
	}
	
	//쪽지 리스트 가져오기
	@RequestMapping(value="/message/list")
	public String listMessage(
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
		
		System.out.println(searchValue);
		
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
        
        
        String paging = myUtil.pagingMethod(current_page, total_page, "paging");
        System.out.println("mode : " + mode + " / page : " + current_page + " / searchValue : " + searchValue);
        
        model.addAttribute("list", list);
        model.addAttribute("mode", mode);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);	
        
		return "member/message/list";
	}
}
