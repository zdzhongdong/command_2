package com.lovo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lovo.bean.EventXuEntity;
import com.lovo.mapper.EventXuEntityMapper;
import com.lovo.service.IEventXuService;
@Service("eventXuService")
public class EventXuServiceImpl implements IEventXuService{
@Autowired
	private EventXuEntityMapper eventxu; 
	 
	@Override
	public List<EventXuEntity> findByEventId(String eventid) {
	
		return  eventxu.findByEventId(eventid);
	}

	@Override
	public void addEventXu(EventXuEntity eventxubean) {
		eventxu.insert(eventxubean);
	}

}
