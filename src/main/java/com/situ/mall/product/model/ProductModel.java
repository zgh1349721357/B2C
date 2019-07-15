package com.situ.mall.product.model;

import com.situ.util.Pager;

public class ProductModel extends Pager {

	private Integer	id;				// id
	private String	code;			// 编号
	private String	name;			// 名称
	private String	price;			// 单价
	private String	descr;			// 描述
	private String	count;			// 库存量
	private String	status;			// 状态
	private String	categoryCode;	// 商品分类主键
	
	private String	code1;			// 下拉框关联时所用虚拟字段
	private String  url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCode1() {
		return code1;
	}

	public void setCode1(String code1) {
		this.code1 = code1;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}


	@Override
	public String toString() {
		return "ProductModel [id=" + id + ", code=" + code + ", name=" + name + ", price=" + price + ", descr=" + descr
				+ ", count=" + count + ", status=" + status + ", categoryCode=" + categoryCode + ", code1=" + code1
				+ ", url=" + url + "]";
	}

	public ProductModel(String code, String name) {
		super();
		this.code = code;
		this.name = name;
	}

	public ProductModel() {

	}

	public ProductModel(String code) {
		super();
		this.code = code;
	}

	public ProductModel(String code, String name, String categoryCode) {
		super();
		this.code = code;
		this.name = name;
		this.categoryCode = categoryCode;
	}

}
