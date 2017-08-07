package com.jaegyu.shoppingmall.goods;

import java.util.List;

import com.jaegyu.shoppingmall.goods.goodsDTO;

public interface goodsDAO {
	public List<goodsDTO> listGoods(int gk,int startNum,int endNum);
	public goodsDTO getGoods(int num);
	public int insertGoods(goodsDTO dto);
	public int deleteGoods(int num, String passwd);
	public int updateGoods(goodsDTO dto);
	public int getTotalGoods(int gk);
}
