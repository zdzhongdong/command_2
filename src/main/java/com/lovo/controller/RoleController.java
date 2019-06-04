package com.lovo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.lovo.bean.RoleEntity;
import com.lovo.bean.UserBean;
import com.lovo.bean.UserRoleEntity;
import com.lovo.service.IRoleService;
import com.lovo.service.IUserRoleService;
import com.lovo.service.IUserService;



@Controller
public class RoleController {

	@Autowired
	private IRoleService roleService;
	@Autowired
	private IUserService userService ;
	@Autowired
    private IUserRoleService userRoleService;
	/**
	 * 根据用户id查询用户拥有的权限
	 * @return
	 */
	@RequestMapping("findListRole.lovo")
	public ModelAndView findListRole(int id){
	     UserBean user=userService.getUserByUserId(id);
		ModelAndView mv=new ModelAndView("role");
		//获得角色集合
		List<RoleEntity> listRole=roleService.getListRole(id);
		//获取不拥有的角色集合
		List<RoleEntity> notRole=roleService.getNotRole(id);
		//把结果放入模型
		mv.addObject("listRole", listRole);
		mv.addObject("user", user);
		mv.addObject("notRole", notRole);
		
		return mv;
	}
	
	@RequestMapping("addRole.lovo")
	public ModelAndView addRole(UserRoleEntity ur,HttpServletRequest rq) {
		userRoleService.addRoleByUserid(ur);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("findListRole.lovo?id="+ur.getUserid());
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("delRole.lovo")
	public ModelAndView delRole(UserRoleEntity ur,HttpServletRequest rq) {
		userRoleService.delRoleByUserid(ur.getUserid(),ur.getRoleid());
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("findListRole.lovo?id="+ur.getUserid());
		mv.setView(rv);
		return mv;
		
	}

	
	
	
	
	
}
