package com.situ.mall.sys.mapper;

import java.util.List;

import com.situ.mall.sys.model.DictModel;

public interface DictMapper {
	
	int insert(DictModel model); // 添加数据
	
	int delete(DictModel code); // 根据逻辑主键执行删除
	
	int deleteModel(DictModel model); // 多条件执行删除
	
	int update(DictModel model); // 根据逻辑主键修改数据
	
	int updateActive(DictModel model); // 根据逻辑主键修改不为空的字段
	
	DictModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<DictModel> selectAll(DictModel model); 
	
	List<DictModel> selectModel(DictModel model); // 多条件查询数据库的某条记录
	
	int selectCount(DictModel model); // 查询到的记录条数

}
