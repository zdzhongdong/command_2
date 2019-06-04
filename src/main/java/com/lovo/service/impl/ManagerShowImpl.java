package com.lovo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.lovo.bean.ManageShowEntity;
import com.lovo.mapper.ManageShowEntityMapper;
import com.lovo.service.ManageShowService;
@Service
public class ManagerShowImpl implements ManageShowService {

	@Autowired
	private ManageShowEntityMapper msm;
	@Override
	public List<ManageShowEntity> findAllManageshow(String zyType,String thingsId) {
		// TODO Auto-generated method stub
		return  msm.findAll(zyType,thingsId);
	}

	@Override
	public ManageShowEntity findById(String thingsid) {
		// TODO Auto-generated method stub
		return msm.selectByPrimaryKey(thingsid);
	}


	@Override
	public void updateManageShow(Integer ddId,String mainpeo, String mainpeotel) {
		// TODO Auto-generated method stub
		ManageShowEntity me=new ManageShowEntity(ddId, null, null, null, null, null, null, mainpeo, null, null, mainpeotel, "已处理", null);
		msm.updateByPrimaryKeySelective(me);
		
	}

}
