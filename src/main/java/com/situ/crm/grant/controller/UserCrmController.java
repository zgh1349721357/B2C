package com.situ.crm.grant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.crm.grant.model.UserCrmModel;
import com.situ.crm.grant.service.UserCrmService;
import com.situ.mall.sys.model.UserModel;
import com.situ.util.MD5;

@Controller
@RequestMapping("/crm")
public class UserCrmController {
	
	@Autowired
	private UserCrmService userCrmService;
	
	private boolean isOkAuthCode(HttpServletRequest request) {
		Object authCode = request.getSession().getAttribute("authCode");
		String code = request.getParameter("authCode");
		return authCode.toString().equals(code);
	}
	
	@ResponseBody
	@RequestMapping("/userReg")
	public String userReg(UserCrmModel userCrmModel, Model model, HttpServletRequest request) {
		if (!isOkAuthCode(request)) {
			return "3";
		}
		userCrmModel.setIsAdmin("false");
		model.addAttribute("user", userCrmModel);
		return userCrmService.insertByCode(userCrmModel);
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String login(UserCrmModel userCrmModel, HttpServletRequest request) {
		if (!isOkAuthCode(request)) {
			return "3";
		}
		String ecode = userCrmModel.getUsercode();
		UserCrmModel modelDB = userCrmService.selectModel(new UserCrmModel(ecode));
		if (modelDB == null) {
			return "1";
		}
		String pass = MD5.encode(userCrmModel.getPassword());
		if (modelDB.getPassword().equals(pass)) {
			request.getSession().setAttribute("userCrm", modelDB);
			return "0";
		} else {
			return "2";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("userCrm");
		return "forward:/front/page/login.jsp";
	}
	
//	@ResponseBody
//	@RequestMapping("/search")
//	public String search(UserCrmModel userCrmModel) {
//		String code = userCrmModel.getUsercode();
//		UserCrmModel model = new UserCrmModel(code);
//		
//	}

}
