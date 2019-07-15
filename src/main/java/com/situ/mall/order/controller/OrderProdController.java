package com.situ.mall.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.order.model.OrderProdModel;
import com.situ.mall.order.service.OrderProdService;
import com.situ.util.FmtEmpty;

@Controller
@RequestMapping("/orderprod")
public class OrderProdController {
	
	@Autowired
	private OrderProdService orderProdService;
	
	@ResponseBody
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public String getList(OrderProdModel orderProdModel) {
		String orderCode=orderProdModel.getOrderCode();
		OrderProdModel model = new OrderProdModel(orderCode);
		model.setPageIndex(orderProdModel.getPageIndex());
		model.setPageLimit(orderProdModel.getPageLimit());
		List<OrderProdModel> list = orderProdService.selectList(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count",  orderProdService.selectCount(model));
		return new JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=UTF-8")
	public String getList1(OrderProdModel orderProdModel) {
		String orderCode = orderProdModel.getOrderCode();
		if(!FmtEmpty.isEmpty(orderCode)) {
			orderCode = "%" + orderCode + "%";
		}
		OrderProdModel model = new OrderProdModel(orderCode);
		model.setPageIndex(orderProdModel.getPageIndex());
		model.setPageLimit(orderProdModel.getPageLimit());
		List<OrderProdModel> list = orderProdService.selectList(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count",  orderProdService.selectCount(model));
		return new JSONObject(map).toString();	
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public String add(OrderProdModel orderProdModel) {
		System.out.println("+++++++++++++++++++++++++"+orderProdModel.getOrderCode());
		return orderProdService.insert(orderProdModel) + "";
	}

}
