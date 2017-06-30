package com.wooltari.exam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("community.exam.communityController")
public class ExamController {
	
	@RequestMapping(value="/community/exam/list")
	public String list() {

		return ".community.exam.list";
	}
	
	@RequestMapping(value="/community/exam/examFiles")
	public String examFiles() {

		return "/community/exam/examFiles";
	}
	
	   @RequestMapping(value="/exam/firstChart", produces="application/json; charset=utf-8")
	   @ResponseBody
	   public String firstChart() throws Exception {
	      JSONArray arr=new JSONArray();
	      
	      JSONObject ob=new JSONObject();
	      ob.put("name", "응시 수");
	      
	      JSONArray ja=new JSONArray();
	      ja.add("['합격', 10]");
	      ja.add("['불합격', 2]");
	      ob.put("data", ja);
	      
	      arr.add(ob);
	      
	      System.out.println(arr.toString());
	      
	      return arr.toString();
	   }
	   
	   @RequestMapping(value="/exam/secondChart", produces="application/json; charset=utf-8")
	   @ResponseBody
	   public String secondChart() throws Exception {
	      JSONArray arr=new JSONArray();
	      
	      JSONObject ob=new JSONObject();
	      ob.put("name", "접속자");
	      
	      JSONArray ja=new JSONArray();
	      ja.add("['07-10시', 10]");
	      ja.add("['10-13시', 30]");
	      ja.add("['13-16시', 33]");
	      ja.add("['16-19시', 20]");
	      ja.add("['기타', 10]");
	      ob.put("data", ja);
	      
	      arr.add(ob);
	      
	      System.out.println(arr.toString());
	      
	      return arr.toString();
	   }
	   
	   @RequestMapping(value="/exam/lastChart", produces="application/json; charset=utf-8")
	   @ResponseBody
	   public String lastChart() throws Exception {
	      JSONArray arr=new JSONArray();
	      
	      JSONObject ob=new JSONObject();
	      ob.put("name", "접속자");
	      
	      JSONArray ja=new JSONArray();
	      ja.add("['07-10시', 10]");
	      ja.add("['10-13시', 30]");
	      ja.add("['13-16시', 33]");
	      ja.add("['16-19시', 20]");
	      ja.add("['기타', 10]");
	      ob.put("data", ja);
	      
	      arr.add(ob);
	      
	      System.out.println(arr.toString());
	      
	      return arr.toString();
	   }
	
/*	@RequestMapping(value="/community/report/created")
	public String article() {

		return ".help.report.created";
	}
	
	@RequestMapping(value="/community/report/article")
	public String created() {

		return ".help.report.article";
	}*/
}
