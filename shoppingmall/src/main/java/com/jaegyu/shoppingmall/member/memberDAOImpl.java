package com.jaegyu.shoppingmall.member;

import java.util.List;

import com.jaegyu.shoppingmall.member.zipcode.zipcodeDTO;

public class memberDAOImpl implements memberDAO {

	@Override
	public boolean insertMember(memberDTO dto) {
		int num= memberMapper.insertMember(dto);
		if(num>0){
			return true;
		} else{
			return false;
		}
	}

	@Override
	public int checkMember(memberDTO dto) {
		int count=memberMapper.checkMember(dto);
		
		return count;
	}

		
	@Override
	public memberDTO loginMember(String id) {
		
		return memberMapper.loginMember(id);
	}

	@Override
	public String confirmId(String id) {
		return memberMapper.confirmId(id);

	}

	@Override
	public memberDTO getMember(String id) {
		 
		return memberMapper.getMember(id);
	}

	@Override
	public boolean updateMember(memberDTO dto) {
		 
		if(memberMapper.updateMember(dto)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean deleteMember(String id, String passwd) {
		
		if(loginMember(id).getPasswd().equals(passwd)){
			memberMapper.deleteMember(id);
			return true;
		} else{
			return false;
		}
		
		
	}

	@Override
	public boolean isAdmin(String id) {
		 int num=memberMapper.isAdmin(id);
		 if(num==1)return true;
		 else return false;
	}

	@Override
	public List<zipcodeDTO> searchZipcode(String dong) {
		 
		return memberMapper.searchZipcode(dong);
	}



}
