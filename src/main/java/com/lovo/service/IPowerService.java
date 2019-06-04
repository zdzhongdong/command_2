package com.lovo.service;

import java.util.List;

import com.lovo.bean.PowerEntity;


/**
 * 角色权限接口
 * @author Administrator
 *
 */
public interface IPowerService {
     /**
      *根据角色ID获取该角色拥有的权限
      * @param roleId
      * @return
      */
	public List<PowerEntity> getListPowerByRoleId(String roleId);
	
}
