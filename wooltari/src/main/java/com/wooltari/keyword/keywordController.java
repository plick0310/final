package com.wooltari.keyword;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wooltari.common.MyUtil;

@Controller("study.keywordController")
public class keywordController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private keywordService service;
	
	//3개만 출력
	@RequestMapping("/keyword/search")
	public String UnionList(
			@RequestParam String keyword
			,Model model
			)throws Exception{
		
		int start=1;
		int end=3;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		int studyCount=service.studyCount(map);
		int promoteCount=service.PromoteCount(map);
		int studyMarketCount=service.StudyMarketBoardCount(map);
		int studyWhereCount=service.StudyWhereCount(map);
		int downloadCount=service.DownloadBoardCount(map);
		int reviewCount=service.ReviewCount(map);
		int usedShopCount=service.UsedShopCount(map);
		
		
		map.put("start", start);
		map.put("end", end);
		
		List<StudyInfo> list= service.studyList(map);
		List<Promote> promoteList=service.PromoteList(map);
		List<StudyMarketBoard> marketList=service.StudyMarketBoardList(map);
		List<StudyWhere> whereList=service.StudyWhereList(map);
		List<DownloadBoard> downloadList=service.DownloadBoardList(map);
		List<Review> reviewList=service.ReviewList(map);
		
		map.put("start", '1');
		map.put("end", '4');
		
		List<UsedShop> usedShopList=service.UsedShopList(map);
		
		Iterator<StudyWhere> ite = whereList.iterator();
		int bestlistNum, b=0;
		while(ite.hasNext()) {
			StudyWhere dto = ite.next();
			bestlistNum=b+1;
			dto.setBestlistNum(bestlistNum);
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			String content = dto.getContent();
			Matcher match = pattern.matcher(content);	
			String imgTag = null;
			if(match.find()){
			    imgTag = match.group(1);
			}
			dto.setContent(imgTag);
			b++;
			
		}
		
		int point =0;
		int listNum, n=0;
		Iterator<UsedShop> it = usedShopList.iterator();
		while(it.hasNext()) {
			UsedShop dto = it.next();
			listNum=usedShopCount-(start+n-1);
			dto.setListNum(listNum);
			
			point = dto.getPrice() /10;
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			String content = dto.getContent();
			
			Matcher match = pattern.matcher(content);
			String imgTag = null;
			if(match.find()){
			    imgTag = match.group(1);
			}
			dto.setContent(imgTag);
			dto.setPointprice(point);
			n++;
			
			
		}
		
		
		model.addAttribute("keyword",keyword);
		
		model.addAttribute("list",list);
		model.addAttribute("studyCount",studyCount);
		model.addAttribute("marketList", marketList);
		model.addAttribute("whereList", whereList);
		model.addAttribute("downloadList", downloadList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("usedShopList", usedShopList);
		
		model.addAttribute("promoteList",promoteList);
		model.addAttribute("promoteCount",promoteCount);
		model.addAttribute("studyMarketCount", studyMarketCount);
		model.addAttribute("studyWhereCount", studyWhereCount);
		model.addAttribute("downloadCount", downloadCount);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("usedShopCount", usedShopCount);
		
		model.addAttribute("keyword", keyword);
		
	
	
		return ".keywordSearch.union";
	}
	
	//스터디 전체
	@RequestMapping("/keyword/studySearch")
	public String StudyList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
	
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page;
		int studyCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		studyCount=service.studyCount(map);
		total_page=myUtil.pageCount(rows, studyCount);
		
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<StudyInfo>list=service.allStudyList(map);
		
		int listNum,n=0;
		Iterator<StudyInfo> it=list.iterator();
		while(it.hasNext()){
			StudyInfo dto=(StudyInfo)it.next();
			listNum=studyCount-(start+n-1);
			dto.setListNum(listNum);
			
			n++;
		}
		
		String listUrl=cp+"/keyword/studySearch?keyword="+keyword;
		
		String paging=myUtil.paging(currentPage, total_page,listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("studyCount", studyCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", currentPage);
		model.addAttribute("keyword", keyword);
		
		return ".keywordSearch.allStudy";
	}
	
	//홍보전체
	@RequestMapping("/keyword/promoteSearch")
	public String promoteList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount=service.PromoteCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
	
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Promote>list=service.allPromoteList(map);
		
		int listNum,n=0;
		Iterator<Promote> it=list.iterator();
		while(it.hasNext()){
			Promote dto=(Promote)it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			
			n++;
		}
		
		String listUrl=cp+"/keyword/promoteSearch?keyword="+keyword;
		
		String paging=myUtil.paging(currentPage, total_page,listUrl);
		

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", currentPage);
		model.addAttribute("keyword", keyword);
		
		return ".keywordSearch.allPromote";
	}
	
	//리뷰전체
	@RequestMapping("/keyword/reviewSearch")
	public String reviewList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
		
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount=service.ReviewCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
	
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Review>list=service.allReviewList(map);
		
		int listNum,n=0;
		Iterator<Review> it=list.iterator();
		while(it.hasNext()){
			Review dto=(Review)it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			
			n++;
		}
		
		String listUrl=cp+"/keyword/reviewSearch?keyword="+keyword;
		
		String paging=myUtil.paging(currentPage, total_page,listUrl);
		

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", currentPage);
		model.addAttribute("keyword", keyword);
		
		return ".keywordSearch.allReview";
	}
	
	//마켓전체
	@RequestMapping("/keyword/marketSearch")
	public String marketList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount=service.StudyMarketBoardCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
	
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<StudyMarketBoard>list=service.allStudyMarketBoardList(map);
		
		int listNum,n=0;
		Iterator<StudyMarketBoard> it=list.iterator();
		while(it.hasNext()){
			StudyMarketBoard dto=(StudyMarketBoard)it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			
			n++;
		}
		
		String listUrl=cp+"/keyword/marketSearch?keyword="+keyword;
		
		String paging=myUtil.paging(currentPage, total_page,listUrl);
		

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", currentPage);
		model.addAttribute("keyword", keyword);
		
		return ".keywordSearch.allMarket";
	}
	
	//어디서하지전체
	@RequestMapping("/keyword/whereSearch")
	public String whereList(
			@RequestParam String keyword
			,@RequestParam(value="page",defaultValue="1")int currentPage
			,Model model
			,HttpServletRequest req
			)throws Exception{
		String cp=req.getContextPath();
		
		int rows=10;
		int total_page;
		int dataCount;
		
		Map<String, Object> map=new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount=service.StudyWhereCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		
	
		if(currentPage>total_page)
			currentPage=total_page;
		
		int start=(currentPage-1)*rows+1;
		int end=currentPage*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<StudyWhere>list=service.allStudyWhereList(map);
		
		int listNum,n=0;
	
		Iterator<StudyWhere> ite = list.iterator();

		while(ite.hasNext()) {
			StudyWhere dto = ite.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			String content = dto.getContent();
			Matcher match = pattern.matcher(content);	
			String imgTag = null;
			if(match.find()){
			    imgTag = match.group(1);
			}
			dto.setContent(imgTag);
			n++;
			
		}
		
		
		String listUrl=cp+"/keyword/whereSearch?keyword="+keyword;
		
		String paging=myUtil.paging(currentPage, total_page,listUrl);
		

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", currentPage);
		model.addAttribute("keyword", keyword);
		
		return ".keywordSearch.allWhere";
	}
	
	//다운로드전체
		@RequestMapping("/keyword/downloadSearch")
		public String downloadList(
				@RequestParam String keyword
				,@RequestParam(value="page",defaultValue="1")int currentPage
				,Model model
				,HttpServletRequest req
				)throws Exception{
			String cp=req.getContextPath();
			
			int rows=10;
			int total_page;
			int dataCount;
			
			Map<String, Object> map=new HashMap<>();
			map.put("keyword", keyword);
			
			dataCount=service.DownloadBoardCount(map);
			total_page=myUtil.pageCount(rows, dataCount);
			
		
			if(currentPage>total_page)
				currentPage=total_page;
			
			int start=(currentPage-1)*rows+1;
			int end=currentPage*rows;
			
			map.put("start", start);
			map.put("end", end);
			
			List<DownloadBoard>list=service.allDownloadBoardList(map);
			
			int listNum,n=0;
			Iterator<DownloadBoard> it=list.iterator();
			while(it.hasNext()){
				DownloadBoard dto=(DownloadBoard)it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				
				n++;
			}
			
			String listUrl=cp+"/keyword/downloadSearch?keyword="+keyword;
			
			String paging=myUtil.paging(currentPage, total_page,listUrl);
			

			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("page", currentPage);
			model.addAttribute("keyword", keyword);
			
			return ".keywordSearch.allDownload";
		}
}
