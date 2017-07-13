package com.wooltari.study.team;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;


@Service("study.team.TeamService")
public class TeamServiceImpl implements TeamService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void joinStudy(Team dto , String path) throws Exception {
		try {
			
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {// 파일 업로드
				
				String newFilename=fileManager.doFileUpload(dto.getUpload(), path);
				dto.setImageFileName(newFilename);
				
			}
			
			
			dao.insertData("studyTeam.insertTeam", dto);
			
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int waitCount(Long s_num) {
		int result=0;
		try {
			result = dao.getIntValue("studyTeam.waitCount", s_num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Team> listWait(Long s_num) {
		List<Team> list = null;
		try {
			list = dao.getListData("studyTeam.waitList",s_num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int teamCount(Long s_num) {
		int result=0;
		try {
			result = dao.getIntValue("studyTeam.teamCount", s_num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Team> listTeam(Long s_num) {
		List<Team> list = null;
		try {
			list = dao.getListData("studyTeam.teamList",s_num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public void updateTeam(Map<String, Object> map) throws Exception {
		
		try {
			dao.updateData("studyTeam.updateAdmit", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

}
