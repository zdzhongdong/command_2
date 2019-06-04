package com.lovo.service;

import java.util.List;

import com.lovo.bean.RoleEntity;


public interface IRoleService {
     /**
      * 查询角色集合
      * @return 角色集合
      */
	public List<RoleEntity> getListRole() ;
    /**
     * 根据用户id查询角色集合
     * @param userid
     * @return
     */
	public List<RoleEntity> getListRole(int userid);
	/**
	 * 根据用户id获取用户不拥有的角色集合
	 * @param userid 用户id
	 * @return 角色集合
	 */
	public List<RoleEntity> getNotRole(int userid);
}
