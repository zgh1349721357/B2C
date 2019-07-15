package com.situ.crm.grant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.crm.grant.mapper.UserCrmMapper;
import com.situ.crm.grant.model.UserCrmModel;
import com.situ.util.FmtEmpty;
import com.situ.util.MD5;

@Service
public class UserCrmService {
	
	@Autowired
	private UserCrmMapper userCrmMapper;
	
	public String insertByCode(UserCrmModel model) {	
		if (selectModel(model) == null)
            return FmtEmpty.isEmpty(insert(model)) ? "2" : "0";
        return "1";
	}
	
	 public int insert(UserCrmModel model) {
		 model.setPassword(MD5.encode(model.getPassword()));
		 return userCrmMapper.insert(model);
	 }
	 
	 public UserCrmModel selectModel(UserCrmModel model) {
		 UserCrmModel um = new UserCrmModel();
		 um.setUsercode(model.getUsercode());
	     List<UserCrmModel> list = selectList(um);
	     return FmtEmpty.isEmpty(list) ? null : list.get(0);
	 }
	 
	 public List<UserCrmModel> selectList(UserCrmModel um){
		 return userCrmMapper.selectModel(um);
	 }
	 
	 public int selectCount(UserCrmModel model) {
		 return userCrmMapper.selectCount(model);
	 }


}
