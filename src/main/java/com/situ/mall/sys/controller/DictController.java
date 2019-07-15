package com.situ.mall.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.sys.model.DictModel;
import com.situ.mall.sys.service.DictService;
import com.situ.util.FmtEmpty;

@Controller
@RequestMapping("/dict")
public class DictController {

	@Autowired
	private DictService dictService;

	@ResponseBody
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public String getList(DictModel dictModel) {
		System.out.println(dictModel);
		String code = dictModel.getCode();
		if (!FmtEmpty.isEmpty(code)) {
			code = "%" + code + "%";
		}
		String name = dictModel.getName();
		if (!FmtEmpty.isEmpty(name)) {
			name = "%" + name + "%";
		}
		String parentCode = dictModel.getParentCode();
		if (!FmtEmpty.isEmpty(parentCode)) {
			parentCode = "%" + parentCode + "%";
		}
		String descr = dictModel.getDescr();
		if (!FmtEmpty.isEmpty(descr)) {
			descr = "%" + descr + "%";
		}
		DictModel dm = new DictModel(code, name, parentCode, descr);
		System.out.println(dm);
		dm.setPageOn(true);
		dm.setPageIndex(dictModel.getPageIndex());
		dm.setPageLimit(dictModel.getPageLimit());
		List<DictModel> list = dictService.selectList(dm);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", dictService.selectCount(dm));
//		System.out.println(list);
		return new JSONObject(map).toString();
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public String add(DictModel dictModel) {
		return dictService.insertByCode(dictModel);
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public String delete(DictModel dictModel) {
		return dictService.delete(dictModel);
	}
	
	@ResponseBody
	@RequestMapping("/upd")
	public String update(DictModel dictModel) {
		return dictService.update(dictModel);
	}
	
	@ResponseBody
	@RequestMapping(value = "/all", produces = "application/json;charset=UTF-8")
	public String getAll(DictModel dictModel) {
		dictModel.setOrderby("name");
		List<DictModel> list = dictService.selectList(dictModel);
		return new JSONArray(list).toString();		
	}
	
	@ResponseBody
	@RequestMapping(value = "/search", produces = "application/json;charset=UTF-8")
	public String getDict(DictModel dictModel) {
		String code = dictModel.getCode();
		DictModel modelDB = dictService.selectModel(new DictModel(code));
		return modelDB == null ? "" : new JSONObject(modelDB).toString();
	}


}
