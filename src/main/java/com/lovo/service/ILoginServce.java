package com.lovo.service;

import com.lovo.bean.UserBean;

public interface ILoginServce {
	/**
	 * @return 用户对象
	 * @param userName 用户名
	 * @param passWord 密码
	 */
  public UserBean login(String userName,String passWord);
}
