package com.lovo.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lovo.bean.EventEntity;
import com.lovo.mapper.EventEntityMapper;
import com.lovo.service.IEventService;
@Service("eventService")
public class EventServiceImpl implements IEventService{
 @Autowired
	private EventEntityMapper  eem;
	@Override
	public List<EventEntity> findByMain(String status) {
		
		return null;
	}

	@Override
	public EventEntity findById(String eventid) {
		EventEntity e=eem.findById(eventid);
	
		return e;
	}

	@Override
	public List<EventEntity> findByItem(String eventid, String type, String openDate, String endDate, String status) {
		 Map<String, String> map=new HashMap<String, String>();
		 map.put("type", type);
		 map.put("thingNum", eventid);
		 map.put("status", status);
		 map.put("opentime", openDate);
		 map.put("endtime", endDate);
		return eem.findByItem(map);
	}

	@Override
	public void addEvent(EventEntity entity) {
    eem.insert(entity);
		
	}

	@Override
	public void updateEvent(String eventId, String status) {
		eem.updateEvent(eventId, status);
		
	}

}
