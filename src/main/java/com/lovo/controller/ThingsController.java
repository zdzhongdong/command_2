package com.lovo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovo.bean.ManageShowEntity;
import com.lovo.service.ManageShowService;
import com.lovo.service.impl.ManagerShowServiceImpl;

@Controller
@RequestMapping("things")
public class ThingsController {
	@Autowired
	private ManageShowService ms;
	
	@RequestMapping("managershow.lovo")
	@ResponseBody
	public PageInfo<ManageShowEntity> findAllManageshow(Integer currpage,String zyType,String thingsId){
		if("".equals(zyType)) {
			zyType=null;
		}
		PageHelper.startPage(currpage,3,true);
		List<ManageShowEntity> list=ms.findAllManageshow(zyType,thingsId);
		PageInfo<ManageShowEntity> pi=new PageInfo<ManageShowEntity>(list);
		return pi;	
	}

}
