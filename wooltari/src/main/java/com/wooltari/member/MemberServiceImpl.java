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
			
			byte [] name = dto.getUserName().trim().getBytes();
			if(name.length >= 12){
				dto.setUserName(new String(name, 0, 12));
				System.out.println(dto.getUserName());
			}
			
			//프로필 사진 설정
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
	public int outMember(String userId) {
		int result=0;
		try {
			result=dao.deleteData("member.outMember", userId);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public void updateMember(Member dto, String path) throws Exception {
		try {
			
			//바이트 단위로 자름
			byte [] name = dto.getUserName().trim().getBytes();
			if(name.length >= 12){
				dto.setUserName(new String(name, 0, 12));
				System.out.println(dto.getUserName());
			}
			
			byte [] introduce = dto.getIntroduce().trim().getBytes();
			if(introduce.length >= 100){
				dto.setIntroduce(new String(introduce, 0, 100));
				System.out.println(dto.getIntroduce());
			}
			
			//프로필 사진 설정
			if(dto.getUserImgUpload()!=null && ! dto.getUserImgUpload().isEmpty()) {
				//기존 프로필 사진이 있으면 서버에서 삭제
				if(dto.getUserImg()!=null && ! dto.getUserImg().isEmpty()) {
					fileManager.doFileDelete(dto.getUserImg(), path);
				}
				String newFilename=fileManager.doFileUpload(dto.getUserImgUpload(), path);
				dto.setUserImg(newFilename);
			}
			//회원 정보 저장
			dao.updateData("member.updateMember", dto);
			dao.updateData("member.updateMemberInfo", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
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
