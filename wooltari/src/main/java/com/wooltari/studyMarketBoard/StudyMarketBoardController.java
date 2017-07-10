package com.wooltari.studyMarketBoard;

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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wooltari.common.FileManager;
import com.wooltari.common.MyUtil;
import com.wooltari.infoReqBoard.InfoReqBoard;
import com.wooltari.member.SessionInfo;


@Controller("studyMarketBoard.StudyMarketBoardController")
public class StudyMarketBoardController {	
		
	@Autowired
	private StudyMarketBoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
		//삽입
		@RequestMapping(value="/studyMarket/studyMarketBoard/created", method=RequestMethod.GET)
		public String createdForm(Model model,HttpSession session) throws Exception {
			model.addAttribute("mode","created");
			
			return ".studyMarket.studyMarketBoard.created";
		}
		
		@RequestMapping(value="/studyMarket/studyMarketBoard/created" ,  method=RequestMethod.POST)
		public String createdSubmit(StudyMarketBoard dto, HttpSession session) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			String root = session.getServletContext().getRealPath("/");
			String pathname=root+File.separator+"uploads"+File.separator+"studyMarketBoard";
			
			dto.setUserId(info.getUserId());
			service.insertBoard(dto, pathname);			
			
			return "redirect:/studyMarket/studyMarketBoard/list";
		}
		
		//리스트
		@RequestMapping(value="/studyMarket/studyMarketBoard/list")
		public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model,
				HttpServletRequest req				
				) throws Exception {
			String cp= req.getContextPath();
			
			int rows=5;
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
			List<StudyMarketBoard> list=service.listBoard(map);
			
			//리스트의 번호
			
			Date endDate= new Date();
			long gap;
			int listNum, n=0;
			Iterator<StudyMarketBoard> it=list.iterator();
			while(it.hasNext()){
				StudyMarketBoard data=(StudyMarketBoard)it.next();
				listNum=dataCount - (start + n - 1);
				data.setListNum(listNum);
				
				SimpleDateFormat formatter= new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
				Date beginDate= formatter.parse(data.getCreated());
				
				// 날짜차이(일)
	            //gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60* 1000);
	            //data.setGap(gap);
				
				//날짜 차이(일)
				gap=(endDate.getTime()-beginDate.getTime())/(60*60*1000);
				data.setGap(gap);
				
				data.setCreated(data.getCreated().substring(0,10));
				
				n++;				
			}
			
			String query="";
			String listUrl= cp+"/studyMarket/studyMarketBoard/list";
			String articleUrl = cp+"/studyMarket/studyMarketBoard/article?page="+current_page;
			if(searchValue.length()!=0){
				query="searchKey="+searchKey+
						"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
			}
			if(query.length()!=0){
				listUrl=cp+"/studyMarket/studyMarketBoard/list" + query;
				articleUrl=cp+"/studyMarket/studyMarketBoard/article?page="+current_page+"&"+query;
			}
			
			String paging=myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("list", list);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("paging", paging);	
			
			return ".studyMarket.studyMarketBoard.list";
		}
	
		//아티클
		@RequestMapping(value="/studyMarket/studyMarketBoard/article")
		public String article(
				@RequestParam(value="num") int num,
				@RequestParam(value="page") String page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model) throws Exception {
				
			searchValue= URLDecoder.decode(searchValue,"utf-8");
			service.updateHitCount(num);
			
			StudyMarketBoard dto= service.readBoard(num);
			if(dto==null)
				return "redirect:/studyMarket/studyMarketBoard/list?page="+page;
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			//이전글 다음글
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);
			map.put("num", num);
			
			StudyMarketBoard preReadDto = service.preReadBoard(map);
			StudyMarketBoard nextReadDto = service.nextReadBoard(map);
			
			//파일
			List<StudyMarketBoard> listFile= service.listFile(num);
			
			//좋아요.
			//int countLikeBoard=service.countLikeBoard(num);
			
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
			//model.addAttribute("countLikeBoard", countLikeBoard);
			
			return ".studyMarket.studyMarketBoard.article";
		}
		@RequestMapping(value="/studyMarket/studyMarketBoard/update", method=RequestMethod.GET)
		public String updateForm(
				@RequestParam(value="num") int num,
				@RequestParam(value="page") String page,
				Model model,
				HttpSession session)throws  Exception{
			
			StudyMarketBoard dto=(StudyMarketBoard)service.readBoard(num);
			if(dto==null){
				return "redirect:/studyMarket/studyMarketBoard/list?page="+page;
			}
			
			List<StudyMarketBoard> listFile=service.listFile(num);
			
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			model.addAttribute("dto", dto);
			model.addAttribute("listFile", listFile);
			
			return ".studyMarket.studyMarketBoard.created";
		}
		
		@RequestMapping(value="/studyMarket/studyMarketBoard/update")
		public String updateSubmit(
				StudyMarketBoard dto,
				@RequestParam String page,
				HttpSession session) throws Exception {
			
			String root=session.getServletContext().getRealPath("/");
			String pathname= root + File.separator +"uploads" + File.separator +"studyMarketBoard";
			
			service.updateBoard(dto, pathname);
			
			return "redirect:/studyMarket/studyMarketBoard/list?page="+page;
		}
		@RequestMapping(value="/studyMarket/studyMarketBoard/delete")
		public String delete(
				@RequestParam int num,
				@RequestParam String page,
				HttpSession session)throws Exception{
			String root=session.getServletContext().getRealPath("/");
			String pathname= root+ File.separator + "uploads" + File.separator + "studyMarketBoard";
			
			StudyMarketBoard dto=service.readBoard(num);
			if(dto==null){
				return "redirect:/studyMarket/studyMarketBoard/list?page="+page;
			}
			
			service.deleteBoard(num, dto.getSaveFilename(), pathname);
			
			return "redirect:/studyMarket/studyMarketBoard/list?page="+page;
	}
		//수정화면에서 파일 삭제
		@RequestMapping(value="/studyMarket/studyMarketBoard/deleteFile")
		@ResponseBody
		public Map<String, Object> deleteFile(
				@RequestParam int fileNum,
				HttpServletResponse resp,
				HttpSession session) throws Exception {			
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "studyMarketBoard";		
			
			StudyMarketBoard dto= service.readFile(fileNum);
			
			if(dto != null) {
				fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			}	
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("field", "fileNum");
				map.put("num", fileNum);
				service.deleteFile(map);
				
				// 작업 결과를 json으로 전송
				Map<String, Object> model = new HashMap<>(); 
				model.put("state", "true");
			
			return model;
		}
}