package com.situ.mall.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.sys.mapper.UserMapper;
import com.situ.mall.sys.model.UserModel;
import com.situ.util.FmtEmpty;
import com.situ.util.MD5;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public String insertByCode(UserModel model) {	
		if (selectModel(model) == null)
            return FmtEmpty.isEmpty(insert(model)) ? "2" : "0";
        return "1";
	}
	
	 public int insert(UserModel model) {
		 model.setPassword(MD5.encode(model.getPassword()));
		 return userMapper.insert(model);
	 }
	 
	 public String delete(UserModel model) {
		 if(userMapper.delete(model) == 1) {
			 return "1";
		 }
		 return "0";
	 }
	 
	 public String update(UserModel model) {
		 if(userMapper.updateActive(model) == 1) {
			 return "1";
		 }
		 return "0";
	 }
	
	 public UserModel selectModel(UserModel model) {
		 UserModel um = new UserModel();
		 um.setUsercode(model.getUsercode());
	     List<UserModel> list = selectList(um);
	     return FmtEmpty.isEmpty(list) ? null : list.get(0);
	 }
	 
	 public List<UserModel> selectList(UserModel um){
		 return userMapper.selectModel(um);
	 }
	 
	 public int selectCount(UserModel model) {
		 return userMapper.selectCount(model);
	 }

}
