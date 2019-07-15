package com.situ.mall.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.order.mapper.OrderProdMapper;
import com.situ.mall.order.model.OrderProdModel;
import com.situ.util.FmtEmpty;

@Service
public class OrderProdService {
	
	@Autowired
	private OrderProdMapper orderProdMapper;
	
	public int insert(OrderProdModel model) {
		return orderProdMapper.insert(model);
	}
	
	public OrderProdModel selectModel(OrderProdModel model) {
		OrderProdModel pm = new OrderProdModel();
		pm.setOrderCode(model.getOrderCode());
		List<OrderProdModel> list = selectList(pm);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<OrderProdModel> selectList(OrderProdModel pm) {
		return orderProdMapper.selectModel(pm);
	}

	public int selectCount(OrderProdModel model) {
		return orderProdMapper.selectCount(model);
	}

}
