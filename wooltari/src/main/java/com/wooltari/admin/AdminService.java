package com.wooltari.admin;

import java.util.List;
import java.util.Map;

import com.wooltari.member.Member;

public interface AdminService {
	public List<Member> listBoard(Map<String, Object> map);
	public int updateBoard(Member dto);
	public int dataCount(Map<String, Object> map);
}
