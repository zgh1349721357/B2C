package com.situ.mall.order.model;

import com.situ.util.Pager;

//	购物车
public class OrderCarModel extends Pager {

	private Integer	id;			//	id
	private String	userCode;	//	用户主键
	private String	spCode;		//	商品主键
	private Integer	count;		//	数量
	
	//	虚拟字段
	private String pcost; 		//	商品单价
	private String purl;  		//	商品图片
	private String pname; 		//	商品名称

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

	public String getSpCode() {
		return spCode;
	}

	public void setSpCode(String spCode) {
		this.spCode = spCode;
	}

	public String getPcost() {
		return pcost;
	}

	public void setPcost(String pcost) {
		this.pcost = pcost;
	}

	public String getPurl() {
		return purl;
	}

	public void setPurl(String purl) {
		this.purl = purl;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "OrderCarModel [id=" + id + ", userCode=" + userCode + ", spCode=" + spCode + ", count=" + count
				+ ", pcost=" + pcost + ", purl=" + purl + ", pname=" + pname + "]";
	}

}
