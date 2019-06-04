package com.lovo.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lovo.bean.UserRoleEntity;
import com.lovo.mapper.UserRoleDao;
import com.lovo.service.IUserRoleService;

@Service(value="userRoleService")
public class UserRoleServiceImpl implements IUserRoleService {
	@Autowired
    private UserRoleDao userRoleDao;

	@Override
	public void addRoleByUserid(UserRoleEntity ur) {
		userRoleDao.addRoleByUserid(ur.getUserid(), ur.getRoleid());
	}

	@Override
	public void delRoleByUserid(int userId, int roleId) {
		userRoleDao.delRoleByUserid(userId, roleId);
	}

	


}
