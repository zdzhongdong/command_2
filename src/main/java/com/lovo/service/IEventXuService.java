package com.lovo.service;

import java.util.List;

import com.lovo.bean.EventXuEntity;

public interface IEventXuService {
/**
 * 查询事件的续报(根据事件排序)
 * @param page 当前是第几页
 * @param eventid 事件主报编号
 * @return 事件续报集合
 */
	public List<EventXuEntity> findByEventId(String eventid);
	
	/**
	 * 添加续报
	 * @param eventxubean 续报对象
	 */
	public void addEventXu(EventXuEntity eventxubean);
}
