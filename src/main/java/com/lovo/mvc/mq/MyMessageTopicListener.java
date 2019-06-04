package com.lovo.mvc.mq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;


public class MyMessageTopicListener implements MessageListener{

	@Override
	public void onMessage(Message msg) {
		 if (msg instanceof TextMessage) {
	            try {
	                TextMessage txtMsg = (TextMessage) msg;
	                String message = txtMsg.getText();
	               
	                System.out.println("订阅发布收到结果===" + message);
	            } catch (JMSException e) {
	                throw new RuntimeException(e);
	            }
	        } else {
	            throw new IllegalArgumentException("Message must be of type TextMessage");
	        }
	}

}
