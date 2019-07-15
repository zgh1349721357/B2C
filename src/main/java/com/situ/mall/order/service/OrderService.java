package com.situ.mall.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.order.mapper.OrderMapper;
import com.situ.mall.order.model.OrderModel;
import com.situ.util.FmtEmpty;

@Service
public class OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	public String insertByCode(OrderModel model) {
		if (selectModel(model) == null)
			return FmtEmpty.isEmpty(insert(model)) ? "2" : "0";
		return "1";
	}

	public int insert(OrderModel model) {
		return orderMapper.insert(model);
	}

	public String delete(OrderModel model) {
		if (orderMapper.delete(model) == 1) {
			return "1";
		}
		return "0";
	}

	public String update(OrderModel model) {
		if (orderMapper.updateActive(model) == 1) {
			return "1";
		}
		return "0";
	}

	public OrderModel selectModel(OrderModel model) {
		OrderModel pm = new OrderModel();
		pm.setCode(model.getCode());
		List<OrderModel> list = selectList(pm);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<OrderModel> selectList(OrderModel pm) {
		return orderMapper.selectModel(pm);
	}

	public int selectCount(OrderModel model) {
		return orderMapper.selectCount(model);
	}

}
