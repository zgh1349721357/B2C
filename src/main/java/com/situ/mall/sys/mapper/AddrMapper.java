package com.situ.mall.sys.mapper;

import java.util.List;

import com.situ.mall.sys.model.AddrModel;


public interface AddrMapper {
	
	int insert(AddrModel model); // 添加数据
	
	int delete(AddrModel id); // 根据id执行删除
	
	int deleteModel(AddrModel model); // 多条件执行删除
	
	int update(AddrModel model); // 根据id修改数据
	
	int updateActive(AddrModel model); // 根据id修改不为空的字段
	
	AddrModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<AddrModel> selectAll(AddrModel model);
	
	List<AddrModel> selectModel(AddrModel model); // 多条件查询数据库的某条记录
	
	int selectCount(AddrModel model); // 查询到的记录条数

}
