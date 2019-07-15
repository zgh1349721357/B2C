package com.situ.mall.product.mapper;

import java.util.List;

import com.situ.mall.product.model.ProductPicModel;


public interface ProductPicMapper {
	
	int insert(ProductPicModel model); // 添加数据
	
	int delete(ProductPicModel code); // 根据逻辑主键执行删除
	
	int deleteModel(ProductPicModel model); // 多条件执行删除
	
	int update(ProductPicModel model); // 根据逻辑主键修改数据
	
	int updateActive(ProductPicModel model); // 根据逻辑主键修改不为空的字段
	
	ProductPicModel selectId(Object code); // 根据逻辑主键查询数据
	
	List<ProductPicModel> selectAll(ProductPicModel model); 
	
	List<ProductPicModel> selectModel(ProductPicModel model); // 多条件查询数据库的某条记录
	
	int selectCount(ProductPicModel model); // 查询到的记录条数

}
