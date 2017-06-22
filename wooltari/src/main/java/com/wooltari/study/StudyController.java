package com.wooltari.study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("study.studyController")
public class StudyController {

	@RequestMapping(value="/study/created")
	public String StudyCratedForm() throws Exception{
		
		return "/study/manage/bandcreated";
	}
}
