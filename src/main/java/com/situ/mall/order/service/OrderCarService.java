package com.situ.mall.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.order.mapper.OrderCarMapper;
import com.situ.mall.order.model.OrderCarModel;

@Service
public class OrderCarService {
	
	@Autowired
	private OrderCarMapper orderCarMapper;
	
	public int insert(OrderCarModel model) {
		return orderCarMapper.insert(model);
	}
	
	public int delete(OrderCarModel model) {
		return orderCarMapper.delete(model);
	}
	
	public int update (OrderCarModel model) {
		return orderCarMapper.update(model);
	}
	
	public List<OrderCarModel> selectAll(OrderCarModel model){
		return orderCarMapper.selectAll(model);
	}
	
	public int selectCount(OrderCarModel model) {
		return orderCarMapper.selectCount(model);
	}
	
	public List<OrderCarModel> selectByIds(String ids) {
		OrderCarModel model = new OrderCarModel();
		model.setSpCode(ids);
		return orderCarMapper.selectByIds(model);
	}

}
