package com.wooltari.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.dao.CommonDAO;


@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Member readMember(String userId) {
		Member dto=null;
		try {
			dto=dao.getReadData("member.readMember", userId);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
	}

	@Override
	public void updateMember(Member dto) throws Exception {
	}

	@Override
	public int updateLastLogin(String userId) {
		int result=0;
		try {
			result=dao.updateData("member.updateLastLogin", userId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteMember(String userId) {
		return 0;
	}

	@Override
	public int insertAuthority(Member member) {
		int result=0;
		try {
			result=dao.insertData("member.insertAuthority", member);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateAuthority(Member dto) {
		int result=0;
		try {
			result=dao.updateData("member.updateAuthority", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listAuthority(String userId) {
		return null;
	}
}
