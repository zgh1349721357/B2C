package com.situ.mall.sys.model;

import com.situ.util.Pager;

//	商品分类
public class DictModel extends Pager {
	
	private Integer id; // id
	private String code; // 类型编号
	private String name; // 类型名称	
	private String parentCode; // 上级code
	private String descr; // 描述
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

	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	@Override
	public String toString() {
		return "DictModel [id=" + id + ", code=" + code + ", name=" + name + ", descr=" + descr + ", parentCode="
				+ parentCode + "]";
	}
	public DictModel(String code, String name, String parentCode, String descr) {
		super();
		this.code = code;
		this.name = name;
		this.parentCode = parentCode;
		this.descr = descr;
	}
	
	public DictModel() {
		
	}
	public DictModel(String code) {
		super();
		this.code = code;
	}
	
}
