package com.lovo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.lovo.bean.PublicEntity;
import com.lovo.service.IPublicService;
import com.lovo.service.impl.PublicServiceImpl;

@RestController
@RequestMapping("publi")
public class PublicController {
	@Autowired
	private IPublicService  ps;
	@RequestMapping("findall.lovo")
	@ResponseBody
	public List<PublicEntity> findAll(){
		List<PublicEntity> list=null;
		list=ps.findAll();
		return list;
		
	}
	@RequestMapping("delpublic.lovo")
	public ModelAndView delPublic(Integer id) {
		ps.delPublic(id);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../jsp/dd-publicshow.jsp");
		mv.setView(rv);
		return mv;
		
	}
	@RequestMapping("findbyidpublic.lovo")
	@ResponseBody
	public PublicEntity findById(Integer id,HttpServletRequest rq) {
		PublicEntity pe=ps.findById(id);
//		rq.getSession().setAttribute("pe", pe);
//		ModelAndView mv=new ModelAndView();
//		RedirectView rv=new RedirectView("../jsp/dd-publicshow.jsp");
//		mv.setView(rv);
		return pe;
		
	}
	@RequestMapping("updatepublic.lovo")
	public ModelAndView updatePublic(Integer id,Integer key) {
		ps.updatePublic(id, key);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../jsp/dd-publicshow.jsp");
		mv.setView(rv);
		return mv;
		
	}
	@RequestMapping("addpublic.lovo")
	public ModelAndView addPublic(PublicEntity pe) {
		pe.setPkId(null);
		ps.addPublic(pe);
		ModelAndView mv=new ModelAndView();
		RedirectView rv=new RedirectView("../jsp/dd-publicshow.jsp");
		mv.setView(rv);
		return mv;
		
	}

}
