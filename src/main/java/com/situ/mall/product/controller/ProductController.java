package com.situ.mall.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.product.model.ProductModel;
import com.situ.mall.product.service.ProductService;
import com.situ.util.FmtEmpty;

@Controller
@RequestMapping("/prod")
public class ProductController {

	@Autowired
	private ProductService productService;

	@ResponseBody
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public String getList(ProductModel productModel) {
		String code = productModel.getCode();
		if (!FmtEmpty.isEmpty(code)) {
			code = "%" + code + "%";
		}
		String name = productModel.getName();
		if (!FmtEmpty.isEmpty(name)) {
			name = "%" + name + "%";
		}
		String categoryCode = productModel.getCategoryCode();
		if (!FmtEmpty.isEmpty(categoryCode)) {
			categoryCode = "%" + categoryCode + "%";
		}
		ProductModel model = new ProductModel(code, name, categoryCode);
		model.setPageOn(true);
		model.setPageIndex(productModel.getPageIndex());
		model.setPageLimit(productModel.getPageLimit());
		List<ProductModel> list = productService.selectList(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", productService.selectCount(model));
		return new JSONObject(map).toString();
	}

	@ResponseBody
	@RequestMapping("/add")
	public String add(ProductModel productModel) {
		return productService.insertByCode(productModel);
	}

	@ResponseBody
	@RequestMapping("/del")
	public String delete(ProductModel productModel) {
		return productService.delete(productModel);
	}

	@ResponseBody
	@RequestMapping("/upd")
	public String update(ProductModel productModel) {
		return productService.update(productModel);
	}

	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=UTF-8")
	public String getModel(ProductModel productModel) {
		String code = productModel.getCode();
		ProductModel model = productService.selectModel(new ProductModel(code));
		return model == null ? "" : new JSONObject(model).toString();
	}

}
