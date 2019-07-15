package com.situ.mall.order.model;

import com.situ.util.Pager;

public class OrderModel extends Pager {

	private Integer	id;			//	id
	private String	code;		//	编号
	private String	userCode;	//	用户主键
	private String	time;		//	时间
	private String	addrId;		//	收获地址
	private String	status;		//	状态（已发货或未发货）
	
	private String purl;
	private String pcost;

	public String getPcost() {
		return pcost;
	}

	public void setPcost(String pcost) {
		this.pcost = pcost;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPurl() {
		return purl;
	}

	public void setPurl(String purl) {
		this.purl = purl;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddrId() {
		return addrId;
	}

	public void setAddrId(String addrId) {
		this.addrId = addrId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", code=" + code + ", userCode=" + userCode + ", time=" + time + ", addrId="
				+ addrId + ", status=" + status + ", purl=" + purl + ", pcost=" + pcost + "]";
	}

	public OrderModel(String code, String userCode) {
		super();
		this.code = code;
		this.userCode = userCode;
	}

	public OrderModel(String code) {
		super();
		this.code = code;
	}

	public OrderModel() {
		
	}
}
