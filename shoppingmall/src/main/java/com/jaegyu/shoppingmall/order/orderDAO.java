package com.jaegyu.shoppingmall.order;

import java.util.List;

public interface orderDAO {
	public void cartInput(cartDTO cartdto);
	public void cartDelete(String buyer,int num);
	public List<cartDTO> cartList(String buyer);
	public int orderDelete(int ordernum);
	public boolean isCart(String buyer,String goodsname);
	public void cartUpdate(String buyer, String goodsname, int qty); 
}
