package com.wooltari.study.team;

import java.util.List;
import java.util.Map;

public interface TeamService {
	
	public void joinStudy(Team dto,String path ) throws Exception;
	
	public int waitCount(Long s_num);
	public List<Team> listWait(Long s_num);
	
	public int teamCount(Long s_num);
	public List<Team> listTeam(Long s_num);
	
	public void updateTeam (Map<String, Object> map) throws Exception;
}
