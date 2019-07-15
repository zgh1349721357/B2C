package com.situ.mall.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.product.mapper.ProductMapper;
import com.situ.mall.product.model.ProductModel;
import com.situ.util.FmtEmpty;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;

	public String insertByCode(ProductModel model) {
		if (selectModel(model) == null)
			return FmtEmpty.isEmpty(insert(model)) ? "2" : "0";
		return "1";
	}

	public int insert(ProductModel model) {
		return productMapper.insert(model);
	}

	public String delete(ProductModel model) {
		if (productMapper.delete(model) == 1) {
			return "1";
		}
		return "0";
	}

	public String update(ProductModel model) {
		if (productMapper.updateActive(model) == 1) {
			return "1";
		}
		return "0";
	}

	public ProductModel selectModel(ProductModel model) {
		ProductModel pm = new ProductModel();
		pm.setCode(model.getCode());
		List<ProductModel> list = selectList(pm);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<ProductModel> selectList(ProductModel pm) {
		return productMapper.selectModel(pm);
	}

	public int selectCount(ProductModel model) {
		return productMapper.selectCount(model);
	}

}
