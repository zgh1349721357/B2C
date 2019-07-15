package com.situ.mall.order.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.crm.grant.model.UserCrmModel;
import com.situ.mall.order.model.OrderCarModel;
import com.situ.mall.order.model.OrderModel;
import com.situ.mall.order.service.OrderService;
import com.situ.util.FmtEmpty;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;

	@ResponseBody
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public String getList(OrderModel orderModel) {
		String code = orderModel.getCode();
		if (!FmtEmpty.isEmpty(code)) {
			code = "%" + code + "%";
		}
		String userCode = orderModel.getUserCode();
		if (!FmtEmpty.isEmpty(userCode)) {
			userCode = "%" + userCode + "%";
		}
		OrderModel model = new OrderModel(code, userCode);
		model.setPageIndex(orderModel.getPageIndex());
		model.setPageLimit(orderModel.getPageLimit());
		model.setPageOn(true);
		List<OrderModel> list = orderService.selectList(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", orderService.selectCount(model));
		return new JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public String insert(OrderModel orderModel) {
		return orderService.insertByCode(orderModel);
	}

	@ResponseBody
	@RequestMapping("/del")
	public String delete(OrderModel orderModel) {
		return orderService.delete(orderModel);
	}

	@ResponseBody
	@RequestMapping("/upd")
	public String update(OrderModel orderModel) {
		return orderService.update(orderModel);
	}

	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=UTF-8")
	public String getOrder(OrderModel orderModel) {
		String code = orderModel.getCode();
		OrderModel modelDB = orderService.selectModel(new OrderModel(code));
		return modelDB == null ? "" : new JSONObject(modelDB).toString();
	}
	
	@ResponseBody
	@RequestMapping("/insert")
	public String insertModel(OrderModel orderModel) {
		String str = new SimpleDateFormat("yyMMddHHmm").format(new Date()); 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=df.format(new Date()).toString();
		int a=(int)(Math.random()*1000000);
		String orderCode = "order" + str + a;
		orderModel.setCode(orderCode);
		orderModel.setTime(time);
		int count = orderService.insert(orderModel);
		Map<String,Object> map=new HashMap<>();
		map.put("count", count);
		map.put("code", orderCode);
		return new JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=UTF-8")
	public String getList1(OrderModel orderModel, HttpSession session) {
		Object obj = session.getAttribute("userCrm");
		if (obj == null) {
			return "2";
		}
//		OrderModel model = new OrderModel();
//		model.setUserCode(((UserCrmModel) obj).getUsercode());
		String userCode = orderModel.getUserCode();
		OrderModel model = new OrderModel();
		model.setUserCode(userCode);
		model.setPageIndex(orderModel.getPageIndex());
		model.setPageLimit(orderModel.getPageLimit());
		model.setPageOn(true);
		List<OrderModel> list = orderService.selectList(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return new JSONObject(map).toString();
	}

}
