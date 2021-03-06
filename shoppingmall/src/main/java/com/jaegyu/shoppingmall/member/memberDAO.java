package com.jaegyu.shoppingmall.member;

import java.util.List;

public interface memberDAO {
	public boolean insertMember(memberDTO dto);
	public int checkMember(memberDTO dto);
	public memberDTO loginMember(String id);
	public String confirmId(String id);
	public memberDTO getMember(String id);
	public boolean updateMember(memberDTO dto);
	public boolean deleteMember(String id, String passwd);
	public boolean isAdmin(String id);
	public List searchZipcode(String dong);
}
