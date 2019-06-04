package com.lovo.bean;



public class UserBean {

	private int id;

    private String userName;

    private String password;
    
    private String imgPath;
    
    
    
	public UserBean(String userName, String password, String imgPath) {
		super();
		this.userName = userName;
		this.password = password;
		this.imgPath = imgPath;
	}
	public UserBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	
	
	
}
