package com.lovo.mapper;

import java.util.List;

import com.lovo.bean.RoleEntity;

public interface IRoleDao {
	/**
     * 根据用户id查询角色集合
     * @param userid
     * @return
     */
	public List<RoleEntity> getListRole(int userid);
	 /**
     * 查询角色集合
     * @return 角色集合
     */
	public List<RoleEntity> getAllRole() ;
	

}
