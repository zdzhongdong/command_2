package com.lovo.bean;

public class PublicEntity {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_public.pk_id
     *
     * @mbggenerated
     */
    private Integer pkId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_public.f_type
     *
     * @mbggenerated
     */
    private String fType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_public.f_key
     *
     * @mbggenerated
     */
    private Integer fKey;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_public.f_value
     *
     * @mbggenerated
     */
    private String fValue;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_public
     *
     * @mbggenerated
     */
    public PublicEntity(Integer pkId, String fType, Integer fKey, String fValue) {
        this.pkId = pkId;
        this.fType = fType;
        this.fKey = fKey;
        this.fValue = fValue;
    }
    

    public PublicEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_public.pk_id
     *
     * @return the value of t_public.pk_id
     *
     * @mbggenerated
     */
    public Integer getPkId() {
        return pkId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_public.f_type
     *
     * @return the value of t_public.f_type
     *
     * @mbggenerated
     */
    public String getfType() {
        return fType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_public.f_key
     *
     * @return the value of t_public.f_key
     *
     * @mbggenerated
     */
    public Integer getfKey() {
        return fKey;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_public.f_value
     *
     * @return the value of t_public.f_value
     *
     * @mbggenerated
     */
    public String getfValue() {
        return fValue;
    }

	public void setPkId(Integer pkId) {
		this.pkId = pkId;
	}

	public void setfType(String fType) {
		this.fType = fType;
	}

	public void setfKey(Integer fKey) {
		this.fKey = fKey;
	}

	public void setfValue(String fValue) {
		this.fValue = fValue;
	}
    
}