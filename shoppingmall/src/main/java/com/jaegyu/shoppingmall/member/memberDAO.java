package com.jaegyu.shoppingmall.member;

import java.util.List;

public interface memberDAO {
	public boolean insertMember(memberDTO dto);
	public boolean checkMember(memberDTO dto);
	public boolean loginMember(String id,String passwd);
	public boolean confirmId(String id);
	public memberDTO getMember(String id);
	public void updateMember(memberDTO dto);
	public boolean deleteMember(String id, String passwd);
	public boolean isAdmin(String id);
	public List searchZipcode(String dong);
}
