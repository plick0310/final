package com.wooltari.study.team;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.wooltari.common.dao.CommonDAO;


@Service("study.team.TeamService")
public class TeamServiceImpl implements TeamService{


	@Autowired
	private CommonDAO dao;
	
	@Override
	public void joinStudy(Team dto) throws Exception {
		try {
			dao.insertData("studyTeam.insertTeam", dto);
			
		} catch (Exception e) {
			throw e;
		}
	}

}
