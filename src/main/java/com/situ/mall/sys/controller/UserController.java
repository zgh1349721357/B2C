package com.situ.mall.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.sys.model.UserModel;
import com.situ.mall.sys.service.UserService;
import com.situ.util.MD5;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("/adminReg")
	public String adminReg(UserModel userModel, Model model) {
		userModel.setIsAdmin("true");
		model.addAttribute("user", userModel);
		return userService.insertByCode(userModel);
	}

	@ResponseBody
	@RequestMapping("/userReg")
	public String userReg(UserModel userModel, Model model) {
		userModel.setIsAdmin("false");
		model.addAttribute("user", userModel);
		return userService.insertByCode(userModel);
	}

	@ResponseBody
	@RequestMapping("/adminLogin")
	public String adminLogin(UserModel userModel, HttpServletRequest request) {
		String ecode = userModel.getUsercode();
		UserModel modelDB = userService.selectModel(new UserModel(ecode));
		if (modelDB == null) {
			return "1";
		}
		String pass = MD5.encode(userModel.getPassword());
		if (modelDB.getPassword().equals(pass)) {
			request.getSession().setAttribute("user", modelDB);
			return "0";
		} else {
			return "2";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8")
	public String getList(UserModel userModel) {
		String usercode = userModel.getUsercode();
		String username = userModel.getUsername();
		UserModel um = new UserModel("%" + usercode + "%", "%" + username + "%", null);
		um.setPageOn(true);
		um.setPageIndex(userModel.getPageIndex());
		um.setPageLimit(userModel.getPageLimit());
		List<UserModel> list = userService.selectList(um);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", userService.selectCount(um));
		return new JSONObject(map).toString();
	}

	//	用户管理界面的添加为添加管理员
	@ResponseBody
	@RequestMapping("/add")
	public String addUser(UserModel userModel, Model model) {
		userModel.setIsAdmin("true");
		return userService.insertByCode(userModel);
	}

	@ResponseBody
	@RequestMapping("/del")
	public String delUser(UserModel userModel, HttpServletRequest request) {
		String code = userModel.getUsercode();
		UserModel um = new UserModel(code);
		UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");
		if (code.equals(sessionUser.getUsercode())) {
			return "2";
		}
		return userService.delete(um);
	}

	@RequestMapping("/searchUser")
	@ResponseBody
	public String getUser(UserModel userModel) {
		String code = userModel.getUsercode();
		UserModel modelDB = userService.selectModel(new UserModel(code));
		return modelDB == null ? "" : new JSONObject(modelDB).toString();
	}

	@ResponseBody
	@RequestMapping("/upd")
	public String updUser(UserModel userModel) {
		String usercode = userModel.getUsercode();
		String pass = userModel.getPassword();
		UserModel um1 = new UserModel();
		um1.setUsercode(usercode);
		UserModel um2 = userService.selectModel(um1);
		if (um2.getPassword().equals(pass)) {
			userModel.setPassword(pass);
		} else {
			pass = MD5.encode(pass);
			userModel.setPassword(pass);
		}
		return userService.update(userModel);
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "login";
	}

	@ResponseBody
	@RequestMapping("/pasUser")
	public String pasUser(UserModel userModel) {
		String code = userModel.getUsercode();
		String pass = userModel.getPassword();
		pass = MD5.encode(pass);
		UserModel um = new UserModel(code, null, pass);
		return userService.update(um);
	}

}
