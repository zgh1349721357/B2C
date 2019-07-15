package com.situ.crm.grant.mapper;

import java.util.List;

import com.situ.crm.grant.model.UserCrmModel;

public interface UserCrmMapper {
	
	int insert(UserCrmModel model); // 添加数据
	
	int delete(UserCrmModel code); // 根据逻辑主键执行删除
	
	int deleteModel(UserCrmModel model); // 多条件执行删除
	
	int update(UserCrmModel model); // 根据逻辑主键修改数据
	
	int updateActive(UserCrmModel model); // 根据逻辑主键修改不为空的字段
	
	UserCrmModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<UserCrmModel> selectAll(UserCrmModel model); // 
	
	List<UserCrmModel> selectModel(UserCrmModel model); // 多条件查询数据库的某条记录
	
	int selectCount(UserCrmModel model); // 查询到的记录条数

}
