package com.wooltari.member;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {

	@Override
	public Member readMember(String userId) {
		
		return null;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
	}

	@Override
	public void updateMember(Member dto) throws Exception {
	}

	@Override
	public int updateLastLogin(String userId) {
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		return 0;
	}

	@Override
	public int insertAuthority(Member dto) {
		return 0;
	}

	@Override
	public int updateAuthority(Member dto) {
		return 0;
	}

	@Override
	public List<Member> listAuthority(String userId) {
		return null;
	}
}
