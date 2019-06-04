package com.lovo.mapper;




 public interface UserRoleDao {
	 /**
		 * 根据用户id 给用户添加角色
		 * @param roleId
		 * @return
		 */
		public void addRoleByUserid(int userid,int role);
		/**
		 * 根据用户id和角色id 删除用户的角色
		 * @param userId
		 */
		public void delRoleByUserid(int userId,int roleId);
}
