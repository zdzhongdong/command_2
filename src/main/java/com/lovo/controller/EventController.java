package com.lovo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.lovo.bean.EventEntity;
import com.lovo.bean.UserBean;
import com.lovo.mvc.mq.AMQSenderServiceImpl;
import com.lovo.mvc.mq.AmqSenderService;
import com.lovo.service.IEventService;

@Controller()
@RequestMapping("event")
public class EventController {
@Autowired
	   IEventService  eventservice;
@Resource(name="amqSenderService")
 private AmqSenderService ass;

@RequestMapping("/eventmain.lovo")
@ResponseBody
public  PageInfo<EventEntity> main(String page,String status,String eventid,String type,String opentime,String endtime) {
	
	Integer pages;
	pages=Integer.parseInt(page);
	PageHelper.startPage(pages,5);
	List<EventEntity> evenList=eventservice.findByItem(eventid, type, opentime, endtime, status);
	PageInfo<EventEntity> pageinfo = new PageInfo<EventEntity>(evenList);


	return pageinfo;
}
@RequestMapping("/event.lovo")
@ResponseBody
public EventEntity event(String thingnum) {
	EventEntity event=eventservice.findById(thingnum);
	return event;
}

@RequestMapping("/update.lovo")
public ModelAndView update(String eventid,String status) {

	ModelAndView mv = new ModelAndView();
    eventservice.updateEvent(eventid, status);
    
    ass.sendMsgQueue("Thingnum:"+eventid);
//	mv.setView(new RedirectView("/Command_2/jsp/main.jsp"));
   
	return mv;
}

}
