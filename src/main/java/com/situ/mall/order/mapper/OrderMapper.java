package com.situ.mall.order.mapper;

import java.util.List;

import com.situ.mall.order.model.OrderModel;

public interface OrderMapper {
	
	int insert(OrderModel model); // 添加数据
	
	int delete(OrderModel code); // 根据逻辑主键执行删除
	
	int deleteModel(OrderModel model); // 多条件执行删除
	
	int update(OrderModel model); // 根据逻辑主键修改数据
	
	int updateActive(OrderModel model); // 根据逻辑主键修改不为空的字段
	
	OrderModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<OrderModel> selectAll(OrderModel model); // 
	
	List<OrderModel> selectModel(OrderModel model); // 多条件查询数据库的某条记录
	
	int selectCount(OrderModel model); // 查询到的记录条数

}
