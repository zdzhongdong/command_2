package com.lovo.mvc.mq;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.lovo.bean.EventEntity;
import com.lovo.bean.EventXuEntity;
import com.lovo.mvc.websocket.MyWebSocketHandler;
import com.lovo.service.IEventService;
import com.lovo.service.IEventXuService;

public class MyMessageListener implements MessageListener {
@Autowired
 private IEventService eventservice;
@Autowired
private IEventXuService eventxu;
	public void onMessage(Message msg) {
        if (msg instanceof TextMessage) {
            try {
                TextMessage txtMsg = (TextMessage) msg;
                String message = txtMsg.getText();
               
                ObjectMapper op = new ObjectMapper();
                Gson g = new Gson();
                EventEntity event= g.fromJson(message, EventEntity.class);
         
                if ("1".equals(event.getfStatus())) {
					event.setfStatus("待处理");
					
					
					   eventservice.addEvent(event);
					   try {
						   Gson gb = new Gson();
						  String eventt= gb.toJson(event);
						MyWebSocketHandler.session.sendMessage(new org.springframework.web.socket.TextMessage(eventt));
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
                if (message.contains("fContinueTime")) {
                	String mess =message.replaceAll("fContinueDate", "fContinuetime");
                	System.out.println(mess);
                	EventXuEntity xu=  g.fromJson(mess, EventXuEntity.class);
                	System.out.println(xu.getfContinuetime());
                   
                	xu.setFkThingnum(event.getfThingnum());
                	xu.setfAdress(event.getfAdress());
                	xu.setFkType(event.getFkType());
                	eventxu.addEventXu(xu);
                	try {
						MyWebSocketHandler.session.sendMessage(new org.springframework.web.socket.TextMessage("收到续报信息"));
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
                
             
                System.out.println("点对点收到结果===" + message);
            } catch (JMSException e) {
                throw new RuntimeException(e);
            }
        } else {
            throw new IllegalArgumentException("Message must be of type TextMessage");
        }
    }

}
