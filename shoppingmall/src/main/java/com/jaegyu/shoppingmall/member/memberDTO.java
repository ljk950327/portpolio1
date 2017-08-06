package com.jaegyu.shoppingmall.member;

public class memberDTO {
	private String id;
	private String passwd;
	private String name;
	private int ssn1;
	private int ssn2;
	private String email;
	private String ph1;
	private String ph2;
	private String ph3;
	private String zipcode;
	private String addr1;
	private String addr2;
	private int member_admin;
	private String member_join_date;
	public String getMember_join_date() {
		return member_join_date;
	}
	public void setMember_join_date(String member_join_date) {
		this.member_join_date = member_join_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSsn1() {
		return ssn1;
	}
	public void setSsn1(int ssn1) {
		this.ssn1 = ssn1;
	}
	public int getSsn2() {
		return ssn2;
	}
	public void setSsn2(int ssn2) {
		this.ssn2 = ssn2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPh1() {
		return ph1;
	}
	public void setPh1(String ph1) {
		this.ph1 = ph1;
	}
	public String getPh2() {
		return ph2;
	}
	public void setPh2(String ph2) {
		this.ph2 = ph2;
	}
	public String getPh3() {
		return ph3;
	}
	public void setPh3(String ph3) {
		this.ph3 = ph3;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(int member_admin) {
		this.member_admin = member_admin;
	}
}
