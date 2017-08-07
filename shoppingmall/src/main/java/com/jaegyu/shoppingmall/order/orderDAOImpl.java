package com.jaegyu.shoppingmall.order;

import java.util.List;

public class orderDAOImpl implements orderDAO {

	@Override
	public void cartInput(cartDTO dto) {
		orderMapper.cartInput(dto);
	}

	@Override
	public List<cartDTO> cartList(String buyer) {
		return orderMapper.cartList(buyer);
	}

	@Override
	public void cartDelete(String buyer,int num) {
		String sql="delete from cart where buyer='"+buyer+"' and num="+num;
		orderMapper.cartDelete(sql);
	}

	@Override
	public boolean isCart(String buyer, String goodsname) {
		String sql="select count(*) from cart where buyer='"+buyer+"' and goodsname='"+goodsname+"'";
		if(orderMapper.isCart(sql)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void cartUpdate(String buyer, String goodsname,int qty) {
		String sql="update cart set qty=qty+"+qty+" where buyer='"+buyer+"' and goodsname='"+goodsname+"'";
		orderMapper.cartUpdate(sql);
	}

	@Override
	public int orderDelete(int ordernum) {
		// TODO Auto-generated method stub
		return 0;
	}

}
