package com.situ.mall.sys.mapper;

import java.util.List;

import com.situ.mall.sys.model.UserModel;

public interface UserMapper {
	
	int insert(UserModel model); // 添加数据
	
	int delete(UserModel code); // 根据逻辑主键执行删除
	
	int deleteModel(UserModel model); // 多条件执行删除
	
	int update(UserModel model); // 根据逻辑主键修改数据
	
	int updateActive(UserModel model); // 根据逻辑主键修改不为空的字段
	
	UserModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<UserModel> selectAll(UserModel model); // 
	
	List<UserModel> selectModel(UserModel model); // 多条件查询数据库的某条记录
	
	int selectCount(UserModel model); // 查询到的记录条数

}
