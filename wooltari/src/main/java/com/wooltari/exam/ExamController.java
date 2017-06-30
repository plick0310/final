package com.wooltari.exam;

import org.springframework.beans.factory.annotation.Autowired;
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
	      ja.add("['정보처리기사', 10]");
	      ja.add("['정보처리산업기사', 8]");
	      ja.add("['JLPT N1', 6]");
	      ja.add("['한국사 검정 능력시험', 3]");
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
		      ob.put("name", "백분율");
		      
		      JSONArray ja=new JSONArray();
		      ja.add("['정보처리기사', 80]");
		      ja.add("['정보처리산업기사', 60]");
		      ja.add("['JLPT N1', 20]");
		      ja.add("['한국사 검정 능력시험', 15]");
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
		      ob.put("name", "백분율");
		      
		      JSONArray ja=new JSONArray();
		      ja.add("['한국사 검정 능력시험', 70]");
		      ja.add("['정보처리산업기사', 50]");
		      ja.add("['JLPT N1', 40]");
		      ja.add("['정보처리기사', 10]");
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
