package com.situ.mall.product.model;

import com.situ.util.Pager;

public class ProductPicModel extends Pager {

	private Integer	id;		//	id
	private String	code;	//	商品主键
	private String	url;	//	名称url
	private String	type;	// 	图片类型

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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ProductPicModel [id=" + id + ", code=" + code + ", url=" + url + ", type=" + type + "]";
	}

	public ProductPicModel(String code, String url, String type) {
		super();
		this.code = code;
		this.url = url;
		this.type = type;
	}

	public ProductPicModel() {
		
	}
}
