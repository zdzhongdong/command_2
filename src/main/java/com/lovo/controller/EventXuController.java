package com.lovo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lovo.bean.EventXuEntity;
import com.lovo.service.IEventXuService;

@Controller()
@RequestMapping("xu")
public class EventXuController {
@Autowired
	private IEventXuService eventXu;
@RequestMapping("/eventxu.lovo")
@ResponseBody
public List<EventXuEntity> findEventXu(String eventid) {
	List<EventXuEntity> list= eventXu.findByEventId(eventid);
	for (EventXuEntity eventXuEntity : list) {
		System.out.println(eventXuEntity);
	}

	return list;
}
	
	
}
