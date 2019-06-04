package com.lovo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.lovo.bean.EventEntity;
import com.lovo.bean.ManageShowEntity;
import com.lovo.mvc.mq.AmqSenderService;
import com.lovo.service.IEventService;
import com.lovo.service.IManagerShowService;

@Controller
@RequestMapping("manage")
public class ManageShowController {
@Autowired
	private IManagerShowService ms;
@Autowired
private IEventService es;
@Resource(name="amqSenderService2")
private AmqSenderService mq; 
@Resource(name="amqSenderService3")
private AmqSenderService mq2;
@RequestMapping("/addshow.lovo")
@ResponseBody
public String yi(String name,String num,String car,String thingnum,String type) {
	 EventEntity ee =es.findById(thingnum);
	 es.updateEvent(thingnum, "正在处理");
	 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d =new Date();
		String date=format.format(d);
	if ("医院".equals(type)) {
		
		ManageShowEntity manage = new ManageShowEntity(null, thingnum, "1", name, ee.getfAdress(), Integer.parseInt(num), Integer.parseInt(car), null, date, null, null, "未处理", type);	
     ms.addManageShow(manage);
     ManageShowEntity ds= ms.findbytime(date,type);
     Gson g = new Gson();
     String event=g.toJson(ee);
     String[] b= event.split("[}]");
     String l = b[0];
     l=l+",\"peoplenum\":\""+num+"\",\"carnum\":\""+car+"\",\"diaoduid\":\""+ds.getPkTid()+"\"}";
     mq2.sendMsgQueue(l);
	}
	else {
		ManageShowEntity manage = new ManageShowEntity(null, thingnum, "2", name, ee.getfAdress(), Integer.parseInt(num), Integer.parseInt(car), null, date, null, null, "未处理", type);	
	     ms.addManageShow(manage);
	     ManageShowEntity ds= ms.findbytime(date,type);
	     Gson g = new Gson();
	     String event=g.toJson(ee);
	     String[] b= event.split("[}]");
	     String l = b[0];
	     l=l+",\"peoplenum\":\""+num+"\",\"carnum\":\""+car+"\",\"diaoduid\":\""+ds.getPkTid()+"\"}";
	     mq.sendMsgQueue(l);
	}
	return "{'zhangsan':'zhangsan'}";
}


@RequestMapping("/findziyuannum.lovo")
@ResponseBody
public List<ManageShowEntity> zy(String manageid) {
	return ms.findByItem(manageid);
}

}
