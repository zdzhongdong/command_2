package com.lovo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lovo.bean.ManageShowEntity;
import com.lovo.mapper.ManageEntityMapper;
import com.lovo.mapper.ManageShowEntityMapper;
import com.lovo.service.IManagerShowService;
@Service("manageShowService")
public class ManagerShowServiceImpl implements IManagerShowService {

	
	@Autowired 
	private 	ManageShowEntityMapper manageshow;
	@Override
	public List<ManageShowEntity> findByItem(String ManagerId) {
		// TODO Auto-generated method stub
		
		
		return manageshow.findManagerById(ManagerId);
	}

	@Override
	public void addManageShow(ManageShowEntity mse) {
		manageshow.addManageShow(mse);
		
	}

	@Override
	public ManageShowEntity findbytime(String date,String type) {
		
		return manageshow.findbytime(date,type);
	}
	
	

}
