package com.lovo.service;

import com.lovo.bean.UserRoleEntity;

public interface IUserRoleService {
	/**
	 * 根据用户id 给用户添加角色
	 * @param roleId
	 * @return
	 */
	public void addRoleByUserid(UserRoleEntity ur);
	/**
	 * 根据用户id和角色id 删除用户的角色
	 * @param userId
	 */
	public void delRoleByUserid(int userId,int roleId);
}
