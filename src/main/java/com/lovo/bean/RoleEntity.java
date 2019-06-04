package com.lovo.bean;



public class RoleEntity {
    // Fields    
     private int roleId;
     private String roleName;





    public RoleEntity(String roleName) {
		super();
		this.roleName = roleName;
	}

	public RoleEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}


	public String getRoleName() {
        return this.roleName;
    }
    
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }


   








}