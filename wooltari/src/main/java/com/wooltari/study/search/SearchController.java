package com.wooltari.study.search;

import java.net.URLDecoder;
import java.net.URLEncoder;
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
import com.wooltari.member.SessionInfo;
import com.wooltari.study.StudyCategory;
import com.wooltari.study.StudyCity;
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
	public String search(Model model, HttpSession session)throws Exception {
		return ".studysearch.search";
	}
	
	@RequestMapping(value="/study/map", method=RequestMethod.GET)
	public String map(Model model, HttpSession session)throws Exception {
		return "studysearch/map";
	}
	
	@RequestMapping(value="/study/list")
	public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(value="recruit", defaultValue="0") int recruit,
				@RequestParam(value="choiceCity", defaultValue="0") int choiceCity,
				@RequestParam(value="gender", defaultValue="") String gender,
				@RequestParam(value="searchValue", defaultValue="") String searchValue,
				Model model, HttpServletRequest req , HttpSession session
			) throws Exception{
		System.out.println("넘어온 쿼리 : page:"+current_page+"/recruit:"+recruit+"/choiceCity:"+choiceCity+"/gender:"+gender+"/searchValue:"+searchValue);
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		
		int rows=3;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		System.out.println(searchValue);
		
		//전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("userId", info.getUserId());
		map.put("recruit", recruit);
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
		
        // 쪽지 리스트
        List<StudySearch> list = searchService.listSearch(map);
        
        String query = "";
        String articleUrl = cp+"/study/search?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "recruit=" + recruit + "&gender=" + gender + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	articleUrl = cp+"/study/search?page=" + current_page + "&"+ query;
        }
        
        
        String paging = myUtil.pagingMethod(current_page, total_page, "paging");
        System.out.println("recruit : " + recruit + " / page : " + current_page + " / searchValue : " + searchValue);
        List<StudyCategory> listBigCategory=studyService.listBigCategory();
		List<StudyCity> listBigCity = studyService.listBigCity();
		
		model.addAttribute("listBigCategory", listBigCategory);
		model.addAttribute("listBigCity",listBigCity);
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);	
        
		return "studysearch/list";
	}
}
