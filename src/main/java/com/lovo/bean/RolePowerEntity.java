package com.lovo.bean;





public class RolePowerEntity  {

     private String rolePowerId;
     private RoleEntity role;
     private PowerEntity power;



    public RolePowerEntity(RoleEntity role, PowerEntity power) {
		super();
		this.role = role;
		this.power = power;
	}

	public RolePowerEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getRolePowerId() {
        return this.rolePowerId;
    }
    
    public void setRolePowerId(String rolePowerId) {
        this.rolePowerId = rolePowerId;
    }

	public RoleEntity getRole() {
		return role;
	}

	public void setRole(RoleEntity role) {
		this.role = role;
	}

	public PowerEntity getPower() {
		return power;
	}

	public void setPower(PowerEntity power) {
		this.power = power;
	}

}