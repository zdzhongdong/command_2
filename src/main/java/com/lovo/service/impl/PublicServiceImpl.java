package com.lovo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.lovo.bean.PublicEntity;
import com.lovo.mapper.PublicEntityMapper;
import com.lovo.service.IPublicService;
@Service
public class PublicServiceImpl implements IPublicService {
	
	@Autowired
	private PublicEntityMapper pm;

	@Override
	public void addPublic(PublicEntity pe) {
		// TODO Auto-generated method stub
		pm.insert(pe);
	}

	@Override
	public void delPublic(Integer id) {
		// TODO Auto-generated method stub
		pm.deleteByPrimaryKey(id);
	}

	@Override
	public void updatePublic(Integer id,  Integer key) {
		// TODO Auto-generated method stub
		PublicEntity pe=new PublicEntity(id, null, key, null);
		pm.updateByPrimaryKeySelective(pe);
	}

	@Override
	public PublicEntity findById(Integer id) {
		// TODO Auto-generated method stub
		return pm.selectByPrimaryKey(id);
	}

	@Override
	public List<PublicEntity> findAll() {
		// TODO Auto-generated method stub
		return pm.findAll();
	}
	public static void main(String[] args) {
		ClassPathXmlApplicationContext app=new ClassPathXmlApplicationContext("applicationContext.xml");
		IPublicService ip=(IPublicService) app.getBean("publicService");
//		ip.addPublic(new PublicEntity(null, "类型", 6, "群殴"));
//		ip.delPublic(36);
//		ip.updatePublic(35, 8);
//		System.out.println(ip.findById(35));
//		System.out.println(ip.findAll());
	}

}
