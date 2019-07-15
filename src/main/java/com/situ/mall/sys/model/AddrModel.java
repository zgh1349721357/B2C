package com.situ.mall.sys.model;

import com.situ.util.Pager;

// 收货地址表
public class AddrModel extends Pager {

	private Integer	id;			// id
	private String	userCode;	// 用户主键
	private String	name;		// 收件人
	private String	tel;		// 电话
	private String	province;	// 省份
	private String	city;		// 市
	private String	district;	// 区
	private String	address;	// 详细地址
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "AddrModel [id=" + id + ", userCode=" + userCode + ", name=" + name + ", tel=" + tel + ", province="
				+ province + ", city=" + city + ", district=" + district + ", address=" + address + "]";
	}
	public AddrModel(String userCode, String name) {
		super();
		this.userCode = userCode;
		this.name = name;
	}
	
	public AddrModel(Integer id) {
		super();
		this.id = id;
	}
	public AddrModel() {
		
	}
	
}
