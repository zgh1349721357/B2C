package com.situ.mall.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.product.mapper.ProductPicMapper;
import com.situ.mall.product.model.ProductPicModel;
import com.situ.mall.sys.model.DictModel;
import com.situ.util.FmtEmpty;

@Service
public class ProductPicService {
	
	@Autowired
	private ProductPicMapper productPicMapper;
	
	public String insertByCode(ProductPicModel model) {
		if (selectModel(model) == null)
			return FmtEmpty.isEmpty(insert(model)) ? "2" : "0";
		return "1";
	}
	
	public int insert(ProductPicModel model) {
		return productPicMapper.insert(model);
	}
	
	public int deleteModel(ProductPicModel model) {
		
		return productPicMapper.deleteModel(model);
	}

	public int updateActive(ProductPicModel model) {
		
		return productPicMapper.updateActive(model);
	}
	
	public ProductPicModel selectModel(ProductPicModel model) {
		ProductPicModel dm = new ProductPicModel();
		dm.setCode(model.getCode());
		List<ProductPicModel> list = selectList(dm);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<ProductPicModel> selectList(ProductPicModel um) {
		return productPicMapper.selectModel(um);
	}

	public int selectCount(ProductPicModel model) {
		return productPicMapper.selectCount(model);
	}
}
