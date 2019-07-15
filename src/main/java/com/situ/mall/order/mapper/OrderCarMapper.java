package com.situ.mall.order.mapper;

import java.util.List;

import com.situ.mall.order.model.OrderCarModel;

public interface OrderCarMapper {
	
	int insert(OrderCarModel model); // 添加数据
	
	int delete(OrderCarModel code); // 根据id执行删除
	
	int deleteModel(OrderCarModel model); // 多条件执行删除
	
	int update(OrderCarModel model); // 根据id修改数据
	
	int updateActive(OrderCarModel model); // 根据逻辑主键修改不为空的字段
	
	OrderCarModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<OrderCarModel> selectAll(OrderCarModel model); 
	
	List<OrderCarModel> selectModel(OrderCarModel model); // 多条件查询数据库的某条记录
	
	int selectCount(OrderCarModel model); // 查询到的记录条数
	
	List<OrderCarModel> selectByIds(OrderCarModel model); 

}
