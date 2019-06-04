package com.lovo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.lovo.bean.ManageEntity;
import com.lovo.mapper.ManageEntityMapper;
import com.lovo.service.IManagerService;
@Service("managerService")
public class ManagerServiceImpl implements IManagerService{

	@Autowired 
	private 	ManageEntityMapper manage;
	@Override
	public void addManager(ManageEntity me) {
		  manage.insert(me);
		
	}

	@Override
	public List<ManageEntity> findManager(String type) {
		
		return manage.findManagerByType(type);
	}

	@Override
	public List<ManageEntity> findManagerByZyId(String zyId) {
		// TODO Auto-generated method stub
		return manage.selectByZyId(zyId);
	}

	@Override
	public void updateManager(String fkZyid,String fZyname,String returntime,String zyStuse) {
		// TODO Auto-generated method stub
		
		manage.updateByzyidAndZyname(fkZyid,fZyname,returntime,zyStuse);
		
	}
	public static void main(String[] args) {
		ClassPathXmlApplicationContext app=new ClassPathXmlApplicationContext("applicationContext.xml");
		IManagerService ma=(IManagerService) app.getBean("managerService");
//		ma.addManager(new ManageEntity(null, "5", "j重复多个", "2018-06-06", "2018-06-06", "消防"));
//		System.out.println(ma.findManager("未回"));
//		System.out.println(ma.findManagerByZyId("1"));
		ma.updateManager("1", "张三", "2019-23-23", "yihui");
	}

}
