package com.lovo.service;

import java.util.List;

import com.lovo.bean.ManageShowEntity;

public interface IManagerShowService {
/**
 * 根据调度资源id连表查询调度详情集合
 * @param ManagerId 事件id
 */
	public List<ManageShowEntity> findByItem(String ManagerId);
	/**
	 * 添加资源调度详情
	 * @param mse
	 */
	public void addManageShow(ManageShowEntity mse);
	
	public ManageShowEntity findbytime(String date,String type);
}
