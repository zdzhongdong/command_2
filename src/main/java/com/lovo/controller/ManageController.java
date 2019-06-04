package com.lovo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovo.bean.ManageEntity;
import com.lovo.service.IManagerService;

@Controller
@RequestMapping("manage")
public class ManageController {
	
	@Autowired
	private IManagerService ms;
	
	@RequestMapping("findbyzyid.lovo")
	@ResponseBody
	public PageInfo<ManageEntity> findByZyId(Integer currpage,String zyId){
		PageHelper.startPage(currpage, 3, true);
		List<ManageEntity> list=ms.findManagerByZyId(zyId);
		PageInfo<ManageEntity> pi=new PageInfo<>(list);
		return pi;
	}

}
