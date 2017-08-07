package com.jaegyu.shoppingmall.order;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class orderMapper {
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
	
	public static int cartInput(cartDTO cartdto){
		SqlSession session = sqlMapper.openSession();
		int num=session.insert("cartInput",cartdto);
		session.commit();
		session.close();
		return num;
	}
	
	public static List<cartDTO> cartList(String buyer){
		SqlSession session = sqlMapper.openSession();
		List<cartDTO> list=session.selectList("cartList",buyer);
		session.close();
		return list;
	}
	
	public static int isCart(String sql){
		SqlSession session = sqlMapper.openSession();
		java.util.HashMap map=new java.util.HashMap();
		map.put("sql",sql);
		int num = session.selectOne("isCart",map);
		return num;
	}
	
	public static int cartUpdate(String sql){
		SqlSession session = sqlMapper.openSession();
		java.util.HashMap map=new java.util.HashMap();
		map.put("sql",sql);
		int num=session.update("cartUpdate", map);
		session.commit();
		session.close();
		return num;
	}
	
	public static int orderInput(orderDTO dto){
		SqlSession session = sqlMapper.openSession();
		int num=session.insert("orderInput",dto);
		session.commit();
		session.close();
		return num;
	}
	
	public static int cartDelete(String sql){
		SqlSession session = sqlMapper.openSession();
		java.util.HashMap<String, String> map=new java.util.HashMap<String, String>();
		map.put("sql",sql);
		int num=session.update("cartDelete",map);
		session.commit();
		session.close();
		return num;
	}
	
	public static List<orderDTO> orderList(String buyer){
		SqlSession session = sqlMapper.openSession();
		List<orderDTO> list=session.selectList("orderList",buyer);
		session.close();
		return list;
	}
	
	
}
