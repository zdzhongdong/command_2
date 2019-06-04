package com.lovo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lovo.bean.ModelEntity;
import com.lovo.service.IModelService;


@Controller
@RequestMapping("model")
public class ModelController {
	@Autowired
	private IModelService ms;
	@RequestMapping("addmodel.lovo")
	public ModelAndView addModel(ModelEntity me) {
		me.setFkMbid(null);
		ms.savaModel(me);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../jsp/dd-modelshow.jsp");
		mv.setView(rv);
		return mv;
		
	}
	@RequestMapping("showmodel.lovo")
	@ResponseBody
	public PageInfo<ModelEntity> showModel(Integer currpage,String type){
		if("".equals(type)) {
			type=null;
		}
		PageHelper.startPage(currpage, 3, true);
		List<ModelEntity> list=null;
		list=ms.findByMBType(type);
		PageInfo<ModelEntity> pi=new PageInfo<>(list);
		
		return pi;
		
	}
	@RequestMapping("delmodel.lovo")
	public ModelAndView delmodel(String id) {
		Integer ID=Integer.parseInt(id);
		ms.delModel(ID);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../jsp/dd-modelshow.jsp");
		mv.setView(rv);
		return mv;
		
	}
	
	@RequestMapping("findmodel.lovo")
	public ModelAndView findModel(Integer id,HttpServletRequest rq) {
		ModelEntity md=ms.findModelById(id);
		rq.getSession().setAttribute("md", md);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../jsp/dd-modelupdate.jsp");
	
		mv.setView(rv);
		return mv;
		
	}
	@RequestMapping("updatemodel.lovo")
	public ModelAndView updateModel(Integer id,Integer docNum,Integer ambNum,Integer firNum,Integer inferNum) {
		ms.updateModel(id, docNum, ambNum, firNum, inferNum);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../jsp/dd-modelshow.jsp");
		mv.setView(rv);
		return mv;
		
	}
	@RequestMapping("findModelByTypeAndRank.lovo")
	@ResponseBody
	public List<ModelEntity> findModelByTypeAndRank(String type,String rank) {
	
		List<ModelEntity> list=ms.findByTypeAndRank(type, rank);
		
		return list;
	}
	
	

}
