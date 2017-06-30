package com.wooltari.infoReqBoard;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.FileManager;
import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;



@Controller("infoReqBoard.InfoReqBoardController")
public class InfoReqBoardController {	
	
	@Autowired
	private InfoReqBoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager FileManager;
		
		@RequestMapping(value="/download/infoReqBoard/list")
		public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model,
				HttpServletRequest req				
				) throws Exception {
			String cp= req.getContextPath();
			
			
			int rows=10;
			int total_page=0;
			int dataCount=0;
			
			if(req.getMethod().equalsIgnoreCase("GET")){
				searchValue = URLDecoder.decode(searchValue,"utf-8");
			}
			
			//전체 페이지수
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			
			dataCount=service.dataCount(map);
			if(dataCount != 0)
				total_page= myUtil.pageCount(rows, dataCount);
			
			//다른 사람이 자료를 삭제하여 전체 페이지 수가 변화 된 경우
			if(total_page<current_page)
				current_page=total_page;			
			
						
			//리스트에 출력할 데이터를 가져오기
			int start=(current_page-1)*rows+1;
			int end=current_page*rows;
			map.put("start", start);
			map.put("end", end);
			
			//글 리스트
			List<InfoReqBoard> list= service.listBoard(map);			
			
			//리스트의 번호
			Date endDate= new Date();
			long gap;
			int listNum, n=0;
			Iterator<InfoReqBoard> it=list.iterator();
			while(it.hasNext()){
				InfoReqBoard data=(InfoReqBoard)it.next();
				listNum = dataCount - (start + n -1);
				data.setListNum(listNum);
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
				Date beginDate= formatter.parse(data.getCreated());
				
			    // 날짜차이(일)
	            //gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60* 1000);
	            //data.setGap(gap);
	
	            //날짜차이(시간)
	            gap=(endDate.getTime() - beginDate.getTime())/(60*60*1000);
	            data.setGap(gap);
	            
	            data.setCreated(data.getCreated().substring(0,10));
	            
	            n++;			
			}
			
			String query = "";
			String listUrl = cp + "/download/infoReqBoard/list";
			String articleUrl= cp + "/download/infoReqBoard/article?page="+current_page;
			if(searchValue.length() !=0){
				query = "searchKey="+searchKey + 
						"&searchValue=" + URLEncoder.encode(searchValue, "utf-8");				
			}
			
			if(query.length()!=0){
				listUrl= cp +"/download/infoReqBoard/list?" + query;
				articleUrl = cp + "/download/infoReqBoard/article?page="+ current_page+"&"+query;
			}
			
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);	
			
			return ".download.infoReqBoard.list";
		}
		
		@RequestMapping(value="/download/infoReqBoard/article", method=RequestMethod.GET)
		public String article(@RequestParam(value="num") int num, @RequestParam(value="page") String page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="searchValue") String searchValue,
				Model model
		) throws Exception {
			searchValue= URLDecoder.decode(searchValue,"utf-8");
			service.updateHitCount(num);
			
			InfoReqBoard dto= service.readBoard(num);
			if(dto==null)
				return "redirect:/download/infoReqBoard/list?page="+page;
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			//이전글, 다음글
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			map.put("num", num);
			
			InfoReqBoard preReadDto = service.preReadBoard(map);
			InfoReqBoard nextReadDto = service.nextReadBoard(map);
			
			//파일
			List<InfoReqBoard> listFile= service.listFile(num);
			
			String query="page="+page;
			if(searchValue.length()!=0){
				query += "&searchKey"+searchKey+
						"&searchValue="+URLEncoder.encode(searchValue,"utf-8");				
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("preReadDto", preReadDto);
			model.addAttribute("nextReadDto", nextReadDto);
			model.addAttribute("listFile", listFile);
			
			model.addAttribute("page", page);
			model.addAttribute("query", query);
			
			return ".download.infoReqBoard.article";
		}
	
		@RequestMapping(value="/download/infoReqBoard/created", method=RequestMethod.GET)
		public String createdForm(Model model, HttpSession session)throws Exception {
			model.addAttribute("mode","created");			

			return ".download.infoReqBoard.created";
		}
		
		@RequestMapping(value="/download/infoReqBoard/created", method=RequestMethod.POST)
		public String createdSubmit(InfoReqBoard dto,	HttpSession session) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"infoReqBoard";
			
			dto.setUserId(info.getUserId());			
			service.insertBoard(dto, pathname);
			
			return "redirect:/download/infoReqBoard/list";
		}
		@RequestMapping(value="/download/infoReqBoard/update", method=RequestMethod.GET)
		public String updateForm(@RequestParam int num, @RequestParam String page,
				Model model, HttpSession session) throws Exception {
			
			return ".download.infoReqBoard.created";
	}
		@RequestMapping(value="/download/infoReqBoard/update", method=RequestMethod.POST)
		public String udpateSubmit(InfoReqBoard dto, @RequestParam String page,
				HttpSession session) throws Exception {

			return "redirect:/download/list?page="+page;
		}
}
