package com.lovo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.lovo.bean.UserBean;
import com.lovo.service.IUserService;
import com.lovo.service.impl.UserServiceImpl;
@Controller
public class UserController {
	@Autowired
    private IUserService userService;

	
	@RequestMapping("user.lovo")
	public String getuserli(HttpServletRequest rq) {
	   List<UserBean> userli= userService.getListUser();
	    rq.setAttribute("userli", userli);
		return "user1";
	}
	@RequestMapping("login.lovo")
	public ModelAndView login(String loginUsername,String loginPassword,HttpServletRequest req) {
	ModelAndView mv = new ModelAndView();
		UserBean ub =	userService.login(loginUsername, loginPassword);
		System.out.println("--------------------"+ub);
	if (ub!=null) {
		mv.setView(new RedirectView("jsp/main.jsp"));
	    req.getSession().setAttribute("user", ub);
		
		return mv;
	}
	mv.setView(new RedirectView("jsp/login.jsp"));
	return mv;
	}


	
}
