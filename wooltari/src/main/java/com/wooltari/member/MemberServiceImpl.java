package com.wooltari.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wooltari.common.FileManager;
import com.wooltari.common.dao.CommonDAO;


@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
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
	public void insertMember(Member dto, String path) throws Exception {
		try {
			//프로필 설정
			if(dto.getUserImgUpload()!=null && ! dto.getUserImgUpload().isEmpty()) {
				String newFilename=fileManager.doFileUpload(dto.getUserImgUpload(), path);
				dto.setUserImg(newFilename);
			}
			//회원 정보 저장
			dao.insertData("member.insertMember", dto);
			dao.insertData("member.insertMemberInfo", dto);
			//권한 저장
			dto.setAuth("ROLE_USER");
			dao.insertData("member.insertAuthority", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
	}

	@Override
	public void updateMember(Member dto, String path) throws Exception {
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
