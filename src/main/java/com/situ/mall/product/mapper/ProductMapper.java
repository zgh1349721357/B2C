package com.situ.mall.product.mapper;

import java.util.List;

import com.situ.mall.product.model.ProductModel;

public interface ProductMapper {
	
	int insert(ProductModel model); // 添加数据
	
	int delete(ProductModel code); // 根据逻辑主键执行删除
	
	int deleteModel(ProductModel model); // 多条件执行删除
	
	int update(ProductModel model); // 根据逻辑主键修改数据
	
	int updateActive(ProductModel model); // 根据逻辑主键修改不为空的字段
	
	ProductModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<ProductModel> selectAll(ProductModel model); // 
	
	List<ProductModel> selectModel(ProductModel model); // 多条件查询数据库的某条记录
	
	int selectCount(ProductModel model); // 查询到的记录条数

}
