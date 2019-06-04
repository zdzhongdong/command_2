package com.lovo.mapper;

import java.util.List;

import com.lovo.bean.UserBean;


 public interface UserDao {
    /**
     * 获取所用用户
     * @return
     */
	public List<UserBean> getListUser();
	/**
	 * 根据用户ID获取用户详细信息
	 * @param userId
	 * @return
	 */
	public UserBean getUserByUserId(int userId);	
	/**
	 * 登录，
	 * @param userName
	 * @param password
	 * @return 用户对象
	 */
	public UserBean login(String userName,String password);
}
