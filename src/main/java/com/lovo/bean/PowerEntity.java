package com.lovo.bean;


public class PowerEntity{

     private String powerId;
     private String powerName;
     private String url;

    public PowerEntity(String powerName, String url) {
		super();
		this.powerName = powerName;
		this.url = url;
	}

	public PowerEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPowerId() {
        return this.powerId;
    }
    
    public void setPowerId(String powerId) {
        this.powerId = powerId;
    }

    public String getPowerName() {
        return this.powerName;
    }
    
    public void setPowerName(String powerName) {
        this.powerName = powerName;
    }

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}