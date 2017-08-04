package com.jaegyu.shoppingmall.member.zipcode;

public class zipcodeDTO {
	private int zip_id;
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String ri;
	private String bunji;
	public int getZip_id() {
		return zip_id;
	}
	public void setZip_id(int zip_id) {
		this.zip_id = zip_id;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getRi() {
		return ri;
	}
	public void setRi(String ri) {
		this.ri = ri;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	@Override
	public String toString() {
		return zipcode+","+sido+" "+gugun+" "+dong+" "+ri+" "+bunji ;
	}
	
	
}
