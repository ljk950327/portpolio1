package com.jaegyu.shoppingmall.goods;

public class goodsDTO {
	private int num;
	private String goodsName;
	private String price;
	private String content;
	private String imgsrc;
	private String gk; //hat과 accessory구별
	
	public String getGk() {
		return gk;
	}
	public void setGk(String gk) {
		this.gk = gk;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
}
