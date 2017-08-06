package com.jaegyu.shoppingmall.goods;

import java.util.List;

import com.jaegyu.shoppingmall.goods.goodsMapper;

public class goodsDAOImpl implements goodsDAO {

	@Override
	public List<goodsDTO> listGoods(int gk) {
		return goodsMapper.listGoods(gk);
	}

	@Override
	public goodsDTO getGoods(int num) {
		
		return goodsMapper.getGoods(num);
	}

	@Override
	public int insertGoods(goodsDTO dto) {
		return goodsMapper.insertGoods(dto);
	}

	@Override
	public int deleteGoods(int num, String passwd) {
		return goodsMapper.deleteGoods(num);
	}

	@Override
	public int updateGoods(goodsDTO dto) {
		return goodsMapper.updateGoods(dto);
	}

	@Override
	public int getTotalGoods() {
		
		return goodsMapper.getTotalGoods();
	}
	
	
}
