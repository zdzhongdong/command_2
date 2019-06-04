package com.lovo.bean;



public class UserRoleEntity  {
    
     private String userRoleId;
     private int userid;
     private int roleid;



    public UserRoleEntity(int userid, int roleid) {
		super();
		this.userid = userid;
		this.roleid = roleid;
	}

	public UserRoleEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserRoleId() {
        return this.userRoleId;
    }
    
    public void setUserRoleId(String userRoleId) {
        this.userRoleId = userRoleId;
    }

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
   
}