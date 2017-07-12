package com.wooltari.study.team;

import java.util.List;

public interface TeamService {
	
	public void joinStudy(Team dto ) throws Exception;
	
	public int waitCount(Long s_num);
	public List<Team> listWait(Long s_num);
	
	public int teamCount(Long s_num);
	public List<Team> listTeam(Long s_num);
	
	
}
