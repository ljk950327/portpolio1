package com.jaegyu.shoppingmall.member;

import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jaegyu.shoppingmall.member.zipcode.zipcodeDTO;

public class memberMapper {
	private static SqlSessionFactory sqlMapper;
	static {
		try {
			String resource = "SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			// Fail fast.
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
		}
	}
	
	public static int insertMember(memberDTO dto){
		SqlSession session = sqlMapper.openSession();
		int res= session.insert("insertMember",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static List<memberDTO> checkMember(memberDTO dto){
		SqlSession session = sqlMapper.openSession();
		List<memberDTO> list=session.selectList("checkMember",dto);
		session.commit();
		session.close();
		return list;
	}
	
	public static String loginMember(String id){
		SqlSession session = sqlMapper.openSession();
		String passwd =session.selectOne("loginMember",id);
		session.commit();
		session.close();
		return passwd;
	}
	
	public static boolean confirmId(String id){

		SqlSession session = sqlMapper.openSession();
		boolean res=((String) session.selectOne("confirmId",id)).isEmpty();
		session.commit();
		session.close();
		return !res;
	}
	
	public static memberDTO getMember(String id){
		  SqlSession session = sqlMapper.openSession();
		  memberDTO dto = (memberDTO)session.selectOne("getMember", id);
		  return dto;
	  }
	
	public static int updateMember(memberDTO dto){
		 SqlSession session = sqlMapper.openSession();
		 int res = session.update("updateMember", dto);
		 session.commit();
		 session.close();
		 return res;
	  }
	public static int deleteMember(String id){
	     SqlSession session = sqlMapper.openSession();
		 int res = session.delete("deleteMember", id);
		 session.commit();
		 session.close();
		 return res;
	  }
	
	public static int isAdmin(String id){
		SqlSession session=sqlMapper.openSession();
		int res= session.selectOne("isAdmin",id);
		session.commit();
		session.close();
		return res;
	}
	
	public static List<zipcodeDTO> searchZipcode(String dong){
		SqlSession session=sqlMapper.openSession();
		List<zipcodeDTO> list=session.selectList("searchZipcode",dong);
		session.commit();
		session.close();
		return list;
	}
}
