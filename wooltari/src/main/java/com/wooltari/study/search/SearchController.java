package com.wooltari.study.search;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import com.wooltari.study.StudyCategory;
import com.wooltari.study.StudyInfo;
import com.wooltari.study.StudyLocal;
import com.wooltari.study.StudyService;

@Controller("study.search.SearchController")
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private MyUtilBootstrap myUtil;

	@RequestMapping(value="/study/search", method=RequestMethod.GET)
	public String search(
			@RequestParam(value="bigCategory", defaultValue="0") int bigCategory,
			@RequestParam(value="smallCategory", defaultValue="0") int smallCategory,
			Model model, HttpServletRequest req , HttpSession session
			)throws Exception {
		
		List<StudyCategory> listBigCategory=studyService.listBigCategory();
		
		model.addAttribute("listBigCategory", listBigCategory);
		model.addAttribute("bigCategory", bigCategory);
		model.addAttribute("smallCategory", smallCategory);
		return ".studysearch.search";
	}
	
	@RequestMapping(value="/study/map", method=RequestMethod.GET)
	public String map(Model model, HttpSession session)throws Exception {
		return "studysearch/map";
	}
	
	@RequestMapping(value="/study/list")
	public String list(
				@RequestParam(value="bigCategory", defaultValue="0") int bigCategory,
				@RequestParam(value="smallCategory", defaultValue="0") int smallCategory,
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="recruit", defaultValue="0") int recruit,
				@RequestParam(value="sort", defaultValue="0") int sort,
				@RequestParam(value="target", defaultValue="") String target,
				@RequestParam(value="choiceCity", defaultValue="") String choiceCity,
				@RequestParam(value="gender", defaultValue="") String gender,
				@RequestParam(value="searchValue", defaultValue="") String searchValue, 
				Model model, HttpServletRequest req , HttpSession session
			) throws Exception{
		System.out.println("bigCategory:"+bigCategory+"/smallCategory"+smallCategory);
		String cp = req.getContextPath();
		
		int rows=12;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		System.out.println(searchValue);
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bigCategory", bigCategory);
		map.put("smallCategory", smallCategory);
		map.put("sort", sort);
		map.put("recruit", recruit);
		map.put("target", target);
		map.put("choiceCity", choiceCity);
		map.put("gender", gender);
		map.put("searchValue", searchValue);
		dataCount = searchService.dataCount(map);
		
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
		
        // 스터디 리스트
        List<StudyInfo> list = searchService.listSearch(map);
        //스터디별로 카테고리,지역 리스트 가져오기
        Iterator<StudyInfo> it = list.iterator();
        while(it.hasNext()){
        	StudyInfo data = it.next();
        	List<StudyCategory> categoryList = studyService.readMyCategory(data.getS_num());
        	List<StudyLocal> localList= studyService.readMyLocal(data.getS_num());
        	data.setListCategory(categoryList);
        	data.setListLocal(localList);
        }
        String query = "";
        String articleUrl = cp+"/study/search?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "recruit=" + recruit + "&gender=" + gender + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	articleUrl = cp+"/study/search?page=" + current_page + "&"+ query;
        }
        
        
        
        String paging = myUtil.pagingMethod(current_page, total_page, "paging");
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);	
        
		return "studysearch/list";
	}
	
	@RequestMapping(value="/study/getmarker")
	@ResponseBody
	public Map<String, Object> readMessageList(@RequestParam(value="s_num") int s_num) throws Exception {
		Map<String, Object> model = new HashMap<>();
		String state = "false";
		List<StudyLocal> localList = new ArrayList<>();
		try {
			localList= studyService.readMyLocal(s_num);
		} catch (Exception e) {
			model.put("state", state);
			return model;
		}
		String city = localList.get(0).getCity();
		String pointx = localList.get(0).getPointx();
		String pointy = localList.get(0).getPointy();
		
		state = "true";
		model.put("state", state);
		model.put("city", city);
		model.put("pointx", pointx);
		model.put("pointy", pointy);
		
		return model;
	}
	
}
