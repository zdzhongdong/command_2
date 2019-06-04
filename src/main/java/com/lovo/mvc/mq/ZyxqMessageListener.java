package com.lovo.mvc.mq;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.lovo.bean.EventEntity;
import com.lovo.bean.EventXuEntity;
import com.lovo.bean.ManageEntity;
import com.lovo.mvc.websocket.MyWebSocketHandler;
import com.lovo.service.IEventService;
import com.lovo.service.IEventXuService;
import com.lovo.service.IManagerService;
import com.lovo.service.ManageShowService;

public class ZyxqMessageListener implements MessageListener {
@Autowired
 private ManageShowService mshowService;
@Autowired
 private IManagerService imService;

	public void onMessage(Message msg) {
        if (msg instanceof TextMessage) {
            try {
                TextMessage txtMsg = (TextMessage) msg;
                String message = txtMsg.getText();
//                message="资源ID:5,调度表ID:1,负责人:zs,负责人电话:41564,派出时间:2018-02-02,资源list:资源1.资源2.资源3";
           
//                message="资源ID:5,返回时间:2019-05-05,资源1:张三,资源2:李四,资源3:王五";
              List<String> listarr=new ArrayList<>();
//              资源ID:3,调度表ID:3,负责人:翁但,负责人电话:12345678900,派出时间:2019-01-23 13:03:29,资源list:翁但.12.川A1213S.川C1213S
               String[] arraylist=message.split(",");
               for (int j=0;j<arraylist.length;j++) {
            	   String [] kv=arraylist[j].split(":");
            	   System.out.println(kv[0]+"--"+kv[1]);
            	   listarr.add(kv[1]);
			}
               List<ManageEntity> manlist=imService.findManagerByZyId(listarr.get(0));
               if(manlist.size()==0) {
//            	   王五.川SXXXX1.川ZX1234.川CB1256   李四.川ZX1234.川SXXXX1.川CB1256
             Integer ddId=Integer.parseInt(listarr.get(1));
               mshowService.updateManageShow(ddId, listarr.get(2), listarr.get(3));
               String zy=listarr.get(5).substring(0, (listarr.get(5).length()));
              String [] zyname=zy.split("[.]");
              ManageEntity me=new ManageEntity();
              for (String name : zyname) {
            	  me.setfZyxqid(null);
            	  me.setfZyname(name);
            	  me.setfZystuse("未回");
            	  me.setfTimeout(listarr.get(4));
				  me.setFkZyid(listarr.get(1));
				  me.setfTimeback(null);
				  imService.addManager(me);
			}
               listarr.clear();
               
               }else {
            	
            			  String[] zynames= listarr.get(2).split("[.]");
            	   for (String zyname : zynames) {
            		 imService.updateManager(listarr.get(0), zyname, listarr.get(1), "已回");
				}
            	   listarr.clear();
               }      
               
               System.out.println(message);
               if( MyWebSocketHandler.session!=null) {
            	   
            	   try {
            		   MyWebSocketHandler.session.sendMessage(new org.springframework.web.socket.TextMessage("消息来了"));
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
	public static void main(String[] args) {
		
	}
	
}
