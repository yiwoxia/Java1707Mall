package com.situ.mall.controller.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.User;
import com.situ.mall.service.front.ILoginService;

@Controller
@RequestMapping("login")
public class LodinController {

	@Autowired
	private ILoginService loginService;
	
	@RequestMapping("login.shtml")	
	private String login(){
		
		return "login";
	}
	@RequestMapping("loginIn.shtml")
	private String loginIn(User user, Model model,HttpServletRequest request){
		
		user = loginService.checkUser(user);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			System.out.println("111111111111111111111111"+user);
			return "redirect:/index.shtml";
		}else{
			
			return "redirect:/index.shtml";
		}
		
	}
	
	@RequestMapping("log.shtml")
	@ResponseBody
	public ServerResponse login(User user,HttpServletRequest request) {
		System.out.println(user);
		user = loginService.checkUser(user);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			System.out.println("111111111111111111111111"+user);
			return ServerResponse.createSuccess("登录成功");
		}else{
			
			return ServerResponse.createError("登录失败");
		}
	}
}
