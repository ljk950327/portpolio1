package com.jaegyu.shoppingmall.goods;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jaegyu.shoppingmall.goods.goodsDTO;

public class goodsMapper {
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
	
	public static List<goodsDTO> listGoods(int gk) {
		SqlSession session = sqlMapper.openSession();
		List<goodsDTO> list = session.selectList("listGoods",gk);
		session.close();
		return list;
	}
	
	public static goodsDTO getGoods(int num) {
		SqlSession session = sqlMapper.openSession();
		goodsDTO goodsDTO = session.selectOne("getGoods", num);
		session.close();
		return goodsDTO;
	}
	
	public static int insertGoods(goodsDTO dto) {
		SqlSession session = sqlMapper.openSession();

		int res = session.insert("insertGoods", dto);
		session.commit();
		session.close();
		return res;
	}
	
	public static int deleteGoods(int num) {
		SqlSession session=sqlMapper.openSession();
		int res=session.update("deleteGoods",num);
		session.commit();
		session.close();
		return res;
	}
	
	public static int updateGoods(goodsDTO dto){
		SqlSession session=sqlMapper.openSession();
		int res=session.update("updateGoods",dto);
		session.commit();
		session.close();
		return res;
	}
}
