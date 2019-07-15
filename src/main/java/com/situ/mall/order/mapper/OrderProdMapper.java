package com.situ.mall.order.mapper;

import java.util.List;

import com.situ.mall.order.model.OrderProdModel;

public interface OrderProdMapper {
	
	int insert(OrderProdModel model); // 添加数据
	
	int delete(OrderProdModel code); // 根据id执行删除
	
	int deleteModel(OrderProdModel model); // 多条件执行删除
	
	int update(OrderProdModel model); // 根据id修改数据
	
	int updateActive(OrderProdModel model); // 根据逻辑主键修改不为空的字段
	
	OrderProdModel selectId(Object code); // 根据订单编号查询数据
	
	List<OrderProdModel> selectAll(OrderProdModel model); 
	
	List<OrderProdModel> selectModel(OrderProdModel model); // 多条件查询数据库的某条记录
	
	int selectCount(OrderProdModel model); // 查询到的记录条数


}
