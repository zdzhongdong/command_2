package com.lovo.mvc.mq;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Session;

import org.apache.activemq.Message;
import org.apache.activemq.command.ActiveMQQueue;
import org.apache.activemq.command.ActiveMQTopic;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;
@Service("amqSenderService3")
public class AMQSenderServiceImpl3 implements AmqSenderService{
	  private static final Logger logger = Logger.getLogger(AMQSenderServiceImpl3.class);

	    @Autowired
	    private JmsTemplate jmsTemplate;

	    //目的地队列的明证，我们要向这个队列发送消息
	    @Resource(name="sendToThree2")
	    private ActiveMQQueue destinationQueue;
         @Autowired
         private ActiveMQTopic destinationTopic;
	    //向特定的队列发送消息
	    @Override
	    public void sendMsgQueue(String msg) {
	       
	        try {
	            logger.info("将要向队列{}发送的消息msg:{}"+destinationQueue+ msg);
	            jmsTemplate.send(destinationQueue, new MessageCreator() {
	                @Override
	                public Message createMessage(Session session) throws JMSException {
	                    return (Message) session.createTextMessage(msg);
	                }
	            });

	        } catch (Exception ex) {
	            logger.error("向队列{}发送消息失败，消息为：{}"+destinationQueue+ msg);
	        }

	    }
		@Override
		public void sendMsgTopic(String msg) {
			try {
	            logger.info("将要向订阅{}发送的消息msg:{}"+destinationTopic+ msg);
	            jmsTemplate.send(destinationTopic, new MessageCreator() {
	                @Override
	                public Message createMessage(Session session) throws JMSException {
	                    return (Message) session.createTextMessage(msg);
	                }
	            });

	        } catch (Exception ex) {
	            logger.error("向队列{}发送消息失败，消息为：{}"+destinationQueue+ msg);
	        }
			
		}
}
