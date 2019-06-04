package com.lovo.service;

import java.util.List;

import com.lovo.bean.ManageEntity;

public interface IManagerService {

	/**
	 * 添加调度信息
 	 * @param me 调度信息对象
	 */
	public void addManager(ManageEntity me);
	/**
	 * 查询调度记录信息集合根据事件排序
	 * @param type 类型
	 * @return 调度事件集合
	 */
	public List<ManageEntity> findManager(String type);
	/**
	 * 查询调度记录根据ID查询
	 * @param ManagerId 调度信息编号
	 * @return 调度信息对象
	 */
	public List<ManageEntity> findManagerByZyId(String zyId);
 /**根据资源编号和资源名称更改回归时间和状态
  * 将调度信息状态改为已处理
  * @param Managerid 调度信息id
  */
   public void updateManager(String fkZyid,String fZyname,String returntime,String zyStuse);
}
