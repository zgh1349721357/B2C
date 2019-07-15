package com.situ.mall.order.model;

import com.situ.util.Pager;

//	订单商品表
public class OrderProdModel extends Pager {

	private Integer	id;			//	id
	private String	orderCode;	//	订单主键
	private String	spCode;		//	商品主键
	private String	count;		//	数量
	private String	price;		//	价格
	
	//	虚拟字段
	private String 	spname;       //	商品名称

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSpname() {
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getSpCode() {
		return spCode;
	}

	public void setSpCode(String spCode) {
		this.spCode = spCode;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderProdModel [id=" + id + ", orderCode=" + orderCode + ", spCode=" + spCode + ", count=" + count
				+ ", price=" + price + ", spname=" + spname + "]";
	}

	public OrderProdModel(String orderCode) {
		super();
		this.orderCode = orderCode;
	}
	
	public OrderProdModel() {
		
	}

}
