package com.lovo.service;

import java.sql.Date;
import java.util.List;

import com.lovo.bean.EventEntity;
//事件接口
public interface IEventService {
/**
 * 根据条件展示事件 默认展示状态未处理事件 按时间排序
 * @param page 当前是第几页
 * @param status 事件状态
 * @return 事件集合
 */
	
	public List<EventEntity> findByMain(String status);
/**
 * 根据事件id查询事件详情信息(同时查询该事件续报集合)
 * @param eventid
 * @return 事件对象
 */
	public EventEntity findById(String eventid);
	/**
	 * 根据条件模糊查询 按时间排序
	 * @param page 当前页数
	 * @param eventid 事件编号
	 * @param type 类型
	 * @param openDate 开始事件
	 * @param endDate 结束时间
	 * @param status 事件状态
	 */
	public List<EventEntity> findByItem(String eventid,String type,String openDate,String endDate,String status); 
	
	/**
	 * 添加事件并刷新展示表格
	 * @param entity 事件对象
	 */
	public void addEvent(EventEntity entity);
	/**
	 * 更改事件状态
	 * @param eventId 事件编号
	 * @param status 状态
	 */
	public void updateEvent(String eventId,String status);
}
