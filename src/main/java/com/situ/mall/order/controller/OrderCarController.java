package com.situ.mall.order.controller;

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
import com.situ.mall.order.service.OrderCarService;
import com.situ.util.FmtEmpty;

@Controller
@RequestMapping("/car")
public class OrderCarController {

	@Autowired
	private OrderCarService orderCarService;

	@ResponseBody
	@RequestMapping("/add")
	public String add(OrderCarModel orderCarModel, HttpSession session) {
		Object obj = session.getAttribute("userCrm");
		if (obj == null) {
			return "2";
		}
		OrderCarModel model = new OrderCarModel();
		model.setUserCode(((UserCrmModel) obj).getUsercode());
		model.setSpCode(orderCarModel.getSpCode());
		List<OrderCarModel> list = orderCarService.selectAll(model);
		if (FmtEmpty.isEmpty(list)) {
			model.setCount(1);
			return orderCarService.insert(model) + "";
		} else {
			model = list.get(0);
			model.setCount(model.getCount() + 1);
			return orderCarService.update(model) + "";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/getListAll", produces = "application/json;charset=UTF-8")
	public String getListAll(OrderCarModel orderCarModel, HttpSession session) {
		Object obj = session.getAttribute("userCrm");
		if (obj == null) {
			return "2";
		}
		OrderCarModel model = new OrderCarModel();
		model.setUserCode(((UserCrmModel) obj).getUsercode());
		List<OrderCarModel> list = orderCarService.selectAll(model);
		Map<String, Object> map = new HashMap();
		map.put("list", list);
		map.put("count", orderCarService.selectCount(model));
		return new JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/getList", produces = "application/json;charset=UTF-8")
	public String getList(OrderCarModel orderCarModel,String ids, HttpSession session) {
		System.out.println(ids);
		Object obj = session.getAttribute("userCrm");
		if (obj == null) {
			return "2";
		}
		Map<String, Object> map = new HashMap();
		List<OrderCarModel> list = orderCarService.selectByIds(ids);		
		map.put("list", list);
		return new JSONObject(map).toString();
	}

	@ResponseBody
	@RequestMapping("/del")
	public String delete(OrderCarModel orderCarModel) {
		OrderCarModel model = new OrderCarModel();
		model.setId(orderCarModel.getId());
		return orderCarService.delete(model) + "";
	}
	
	//	当在界面改变数量时数据库相应得字段也随之改变
	@ResponseBody
	@RequestMapping("/updSum")
	public String update(OrderCarModel orderCarModel) {
		return orderCarService.update(orderCarModel) + "";
	}

}
