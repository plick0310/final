package com.wooltari.mockTest.challengeList;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.primitives.Ints;
import com.wooltari.common.MyUtil;
import com.wooltari.member.SessionInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("community.mockTest.challengeListController")
public class ChallengeListController {
	
	@Autowired
	private ChallengeListService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/mockTest/challengeList")
	public String callengeList(
			@RequestParam(value="pageNo",defaultValue="1") int current_page
			,HttpServletRequest req
			,Model model
			,HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		int rows = 100; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
			
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("userId", info.getUserId());
			
			dataCount = service.dataCount(map);
			if(dataCount != 0) {
				total_page = myUtil.pageCount(rows, dataCount);
			}
			if(total_page < current_page) {
				current_page = total_page;
			}
			
			int start = (current_page - 1) * rows + 1;
			int end = current_page * rows;
			map.put("start", start);
			map.put("end", end);
			
			List<ChallengeList> challengeList = service.challengeList(map);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			Date beginDate = new Date();
			
			long gap;
			int challNum = 0;
			int n = 1;
			Iterator<ChallengeList> it = challengeList.iterator();
			
			while(it.hasNext()) {
				ChallengeList data = (ChallengeList)it.next();
				challNum = n;
				data.setChallNum(challNum);
				
				Date endDate = formatter.parse(data.getExamdate());
				
				gap = (endDate.getTime() - beginDate.getTime()) /(60*60*1000);
				data.setExamdate(data.getExamdate().substring(0,10));
				
				n++;
			}
			String paging2 = myUtil.paging(current_page, total_page);
			
			model.addAttribute("challengeList", challengeList);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("paging2", paging2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "community/mockTest/challengeList";
	}
	
	@RequestMapping(value="/hchart/line1", produces="application/json; charset=utf-8")
	@ResponseBody
	public String line1(
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("examinfoName", "정보처리기사");
		
		List<ChallengeList> highChartList = service.highChartList(map);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		
		long gap;
		int[] resultArray= new int[highChartList.size()];
		String[] dateArray= new String[highChartList.size()];
		int n=highChartList.size()-1;
		if(n > -1) {
			Iterator<ChallengeList> it = highChartList.iterator();
			while(it.hasNext()) {
				ChallengeList data = (ChallengeList)it.next();
				
				data.setExamdate(data.getExamdate().substring(0, 10));
				resultArray[n] = data.getResult();
				n--;
			}
		}
		
    /*
        // highchart 에 출력하는 데이터 형식. 값은 숫자이어야함
           [{name:'이름', data:[값]}]

      [{
            name: '서울',
            data: [-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6]
        }, {
            name: '제주',
            data: [7.4,7.3,10.4,15.1,18.8,22.0,25.6,26.4,23.2,19.2,15.2,10.0]
      }]		
     */
		
		JSONArray arr=new JSONArray();
		JSONObject ob;
		
		
		
		ob=new JSONObject();
		ob.put("name", "정보처리기사");
		ob.put("data", Arrays.toString(resultArray));
		arr.add(ob);
		
/*		ob=new JSONObject();
		ob.put("name", "JLPT N3");
		ob.put("data", new double[]{});
		arr.add(ob);
		
		ob=new JSONObject();
		ob.put("name", "한국사능력검정시험 1급");
		ob.put("data", new double[]{});
		arr.add(ob); 
	*/
		JSONObject job=new JSONObject();
		job.put("year", "2017");
		job.put("series", arr);
		
		return job.toString();
	}
}
