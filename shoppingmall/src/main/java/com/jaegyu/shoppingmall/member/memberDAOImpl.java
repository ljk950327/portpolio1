package com.jaegyu.shoppingmall.member;

import java.util.List;

import com.jaegyu.shoppingmall.member.zipcode.zipcodeDTO;

public class memberDAOImpl implements memberDAO {

	@Override
	public boolean insertMember(memberDTO dto) {
		int num=memberMapper.insertMember(dto);
		if(num>0) return true;
		else return false;
	}

	@Override
	public boolean checkMember(memberDTO dto) {
		 
		List<memberDTO> list= memberMapper.checkMember(dto);
		if(list==null) return true;
		else return false;
	}

		
	@Override
	public boolean loginMember(String id, String passwd) {
		if(passwd.equals(memberMapper.loginMember(id))) return true;
		else return false;
		
	}

	@Override
	public boolean confirmId(String id) {
		return memberMapper.confirmId(id);

	}

	@Override
	public memberDTO getMember(String id) {
		 
		return memberMapper.getMember(id);
	}

	@Override
	public void updateMember(memberDTO dto) {
		 
		memberMapper.updateMember(dto);
	}

	@Override
	public boolean deleteMember(String id, String passwd) {
		
		if(loginMember(id,passwd)){
			memberMapper.deleteMember(id);
			return true;
		} else{
			return false;
		}
		
		
	}

	@Override
	public boolean isAdmin(String id) {
		 int num=memberMapper.isAdmin(id);
		 if(num>0)return true;
		 else return false;
	}

	@Override
	public List<zipcodeDTO> searchZipcode(String dong) {
		 
		return memberMapper.searchZipcode(dong);
	}



}
