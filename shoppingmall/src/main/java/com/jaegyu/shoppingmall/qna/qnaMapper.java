package com.jaegyu.shoppingmall.qna;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class qnaMapper {
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
	
	public static List<qnaDTO> listqna() {
		SqlSession session = sqlMapper.openSession();
		List<qnaDTO> list = session.selectList("listqna");
		session.close();
		return list;
	}
	
	public static qnaDTO getqna(int num) {
		SqlSession session = sqlMapper.openSession();
		qnaDTO qnaDTO = session.selectOne("getqna", num);
		session.close();
		return qnaDTO;
	}
	
	public static int insertqna(qnaDTO dto) {
		SqlSession session = sqlMapper.openSession();

		int res = session.insert("insertqna", dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static void readCountPlus(int num) {

		SqlSession session=sqlMapper.openSession();
		session.update("readCountPlus",num);
		session.commit();
		session.close();
		
	}
	
	public static int deleteqna(int num) {
		SqlSession session=sqlMapper.openSession();
		int res=session.update("deleteqna",num);
		session.commit();
		session.close();
		return res;
	}
	
	public static int updateqna(qnaDTO dto){
		SqlSession session=sqlMapper.openSession();
		int res=session.update("updateqna",dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static void restepCount(String sql){
		SqlSession session=sqlMapper.openSession();
		java.util.HashMap map=new java.util.HashMap();
		map.put("sql",sql);
		session.update("restepCount",map);
		session.commit();
		session.close();
	}
	
	



}
