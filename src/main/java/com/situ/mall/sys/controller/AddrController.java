package com.situ.mall.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.sys.model.AddrModel;
import com.situ.mall.sys.service.AddrService;

@Controller
@RequestMapping("/addr")
public class AddrController {

	@Autowired
	private AddrService addrService;

	@ResponseBody
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public String getList(AddrModel addrModel) {
		String code = addrModel.getUserCode();
		String name = addrModel.getName();
		AddrModel model = new AddrModel("%" + code + "%", "%" + name + "%");
		model.setPageOn(true);
		model.setPageIndex(addrModel.getPageIndex());
		model.setPageLimit(addrModel.getPageLimit());
		List<AddrModel> list = addrService.selectList(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", addrService.selectCount(model));
		return new JSONObject(map).toString();
	}

	@ResponseBody
	@RequestMapping("/add")
	public String add(AddrModel addrModel) {
		return addrService.insertByCode(addrModel);
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(AddrModel addrModel) {
		AddrModel model = addrService.selectModel(new AddrModel(addrModel.getId()));
		return addrService.delete(model);
	}
	
	@ResponseBody
	@RequestMapping("/upd")
	public String update(AddrModel addrModel) {
		return addrService.update(addrModel);
	}

	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=UTF-8")
	public String getAddr(AddrModel addrModel) {
		System.out.println("111111111111111111111" + addrModel.getId());
		AddrModel modelDB = addrService.selectModel(new AddrModel(addrModel.getId()));
		return modelDB == null ? "" : new JSONObject(modelDB).toString();
	}

}
