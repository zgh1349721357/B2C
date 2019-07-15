package com.situ.crm.grant.model;

import com.situ.util.Pager;

public class UserCrmModel extends Pager {
	
	private Integer	id;			//	id
	private String	usercode;	//	账号
	private String	password;	//	密码
	private String	username;	//	用户名
	private String	isAdmin;	//	是否为管理员
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "UserCrmModel [id=" + id + ", usercode=" + usercode + ", password=" + password + ", username=" + username
				+ ", isAdmin=" + isAdmin + "]";
	}
	public UserCrmModel(String usercode) {
		super();
		this.usercode = usercode;
	}
	
	public UserCrmModel() {
		
	}

}
