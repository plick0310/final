package com.wooltari.infoReqBoard;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
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
import com.wooltari.member.SessionInfo;



@Controller("infoReqBoard.InfoReqBoardController")
public class InfoReqBoardController {	
	
	@Autowired
	private InfoReqBoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
		
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
			
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("list", list);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("paging", paging);	
			
			return ".download.infoReqBoard.list";
		}
		
		@RequestMapping(value="/download/infoReqBoard/article")
		public String article(
				@RequestParam(value="num") int num,
				@RequestParam(value="page") String page,
				@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
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
			
			//좋아요.
			int countLikeBoard=service.countLikeBoard(num);
			
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
			model.addAttribute("countLikeBoard", countLikeBoard);
			
			return ".download.infoReqBoard.article";
		}
	
		@RequestMapping(value="/download/infoReqBoard/update", method=RequestMethod.GET)
		public String updateForm(
				@RequestParam(value="num") int num,
				@RequestParam(value="page") String page,
				Model model,
				HttpSession session) throws Exception {
			
			InfoReqBoard dto=(InfoReqBoard)service.readBoard(num);
			if(dto==null){
				return "redirect:/download/infoReqBoard/list?page="+page;
			}
				
			List<InfoReqBoard> listFile=service.listFile(num);
			//model은 jsp로 넘기겠다.
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			model.addAttribute("dto", dto);
			model.addAttribute("listFile", listFile);			
						
			return ".download.infoReqBoard.created";
	}
		@RequestMapping(value="/download/infoReqBoard/update")
		public String udpateSubmit(
				InfoReqBoard dto,
				@RequestParam String page,
				HttpSession session) throws Exception {
			
			String root=session.getServletContext().getRealPath("/");
			String pathname= root + File.separator +"uploads" + File.separator +"infoReqBoard";
			
			service.updateBoard(dto, pathname);
			
			return "redirect:/download/infoReqBoard/list?page="+page;
		}
		
		
		@RequestMapping(value="/download/infoReqBoard/delete")
		public String delete(
				@RequestParam int num,
				@RequestParam String page,
				HttpSession session)throws Exception{
			String root=session.getServletContext().getRealPath("/");
			String pathname= root+ File.separator + "uploads" + File.separator + "infoReqBoard";
			
			InfoReqBoard dto= service.readBoard(num);
			if(dto==null){
				return "redirect:/download/infoReqBoard/list?page="+page;
			}			
			
			service.deleteBoard(num, dto.getSaveFilename(), pathname);
						
			return "redirect:/download/infoReqBoard/list?page="+page;
			
		}
		/*
		@RequestMapping(value="/download/infoReqBoar/deleteList")
		@ResponseBody
		public Map<String, Object> deleteList(
				@RequestParam int num,
				@RequestParam String page,
				HttpSession session)throws Exception{
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String root=session.getServletContext().getRealPath("/");
			String pathname= root+ File.separator + "uploads" + File.separator + "infoReqBoard";
			
			String state="true";
			if(info==null){
				state="loginFail";
			}else{				
				InfoReqBoard dto= service.deleteList(map);
				if(dto==null)
					state="flase";				
			}			
			//map은 제이슨으로 보낼때, hashmap은 키 : 밸류
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);			
			
			return "redirect:/download/infoReqBoard/list";
		}
		*/
		//체크 박스로 삭제.............................................
		@RequestMapping(value="/download/infoReqBoard/deleteList")
		public String deleteList(
				Integer[] chk,
				@RequestParam String page
				)throws Exception{
			List<Integer> list=Arrays.asList(chk);
			//Arrays.asList:Arrays 클래스 배열을 List에 담아서 반환한다.
			service.deleteList(list);		
			return "redirect:/download/infoReqBoard/list?page="+page;
		}
		
		
		//수정 화면에서 파일 삭제
		@RequestMapping(value="/download/infoReqBoard/deleteFile", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> deleteFile(
				@RequestParam int fileNum,
				HttpServletResponse resp,
				HttpSession session) throws Exception {			
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "infoReqBoard";		
			
			InfoReqBoard dto= service.readFile(fileNum);
			
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
		//아티클에서 파일 다운 로드
		@RequestMapping(value="/download/infoReqBoard/download")
		public void download(
				@RequestParam int fileNum,
				HttpServletRequest req,
				HttpServletResponse resp,								
				HttpSession session
				) throws Exception{
			
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "infoReqBoard";
			InfoReqBoard dto= service.readFile(fileNum);
			
			boolean b = false;
			
			System.out.println("pathname");
			
			if(dto!=null){
				String saveFilename = dto.getSaveFilename();
				String originalFilename = dto.getOriginalFilename();
				
				b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
			}
			if (!b) {
				try {
					resp.setContentType("text/html; charset=utf-8");
					PrintWriter out = resp.getWriter();
					out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
				} catch (Exception e) {
				}
				
			}
		}
		//게시물 공감 추가...............................................
		@RequestMapping(value="/download/infoReqBoard/insertLikeBoard")
		@ResponseBody
		public Map<String, Object> insertLikeBoard(
				InfoReqBoard dto, HttpSession session) throws Exception{
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String state="true";
			
			if(info==null){
				state="loginFail";
			}else{
				dto.setUserId(info.getUserId());
				int result=service.insertLikeBoard(dto);
				if(result==0) state="false";
			}
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);	
			return model;
		}
		//게시물 공감 개수
		@RequestMapping(value="/download/infoReqBoard/countLikeBoard")
		@ResponseBody
		public Map<String, Object> countLikeBoard(
				@RequestParam(value="num") int num) throws Exception {
			
			String state="true";
			int countLikeBoard=service.countLikeBoard(num);
			
			 Map<String, Object> model = new HashMap<>();
	   	  	 model.put("state", state);
	   	     model.put("countLikeBoard", countLikeBoard);
	   	     
			//작업 결과를 json으로 전송
			return model;
		}
		
		//댓글 처리....................................
		//댓글 및 리플별 답글 추가
		@RequestMapping(value="/download/infoReqBoard/createdReply")
		@ResponseBody
		public Map<String, Object> cretaedReply(
				Reply dto,
				HttpSession session) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			String state="true";
			if(info==null){
				state="loginFail";
			}else{
				dto.setUserId(info.getUserId());
				int result=service.insertReply(dto);
				if(result==0)
					state="false";				
			}
			
			//작업 결과를 json으로 전송
			Map<String, Object> model= new HashMap<>();
			model.put("state", state);
			return model;
		}
		//댓글 및 댓글별 답글 삭제
		@RequestMapping(value="/download/infoReqBoard/deleteReply")
		@ResponseBody
		public Map<String, Object> deleteReply(
				@RequestParam int replyNum,
				@RequestParam String mode,							
				HttpSession session)throws Exception{
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			String state="true";
			if(info==null){
				state="loginFail";
			}else{
			Map<String, Object> map=new HashMap<>();
			map.put("mode",mode);
			map.put("replyNum", replyNum);
			map.put("userId", info.getUserId());
			
			 // 댓글삭제
			int result=service.deleteReply(map);

			if(result==0)
				state="false";
			
			}
			Map<String, Object> model=new HashMap<>();
			model.put("state", state);
			return model;
		}
		
		//댓글 리스트
		@RequestMapping(value="/download/infoReqBoard/listReply")
		public String listReply(
				@RequestParam(value="num") int num,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				Model model
				)throws Exception{
			int rows=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("num", num);
			
			dataCount=service.replyDataCount(map);
			total_page=myUtil.pageCount(rows, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
			//리스트에 출력할 데이터
			int start=(current_page-1)*rows+1;
			int end=current_page*rows;
			map.put("start", start);
			map.put("end", end);
			List<Reply> listReply= service.listReply(map);
			
			// 엔터를 <br>
			Iterator<Reply> it=listReply.iterator();
			int listNum, n=0;
			while(it.hasNext()) {
				Reply dto=it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				n++;
			}
			
			// 페이징처리(인수2개 짜리 js로 처리)
			String paging=myUtil.paging(current_page, total_page);
			
			// jsp로 넘길 데이터
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
		return "download/infoReqBoard/listReply";	
		}
}
	