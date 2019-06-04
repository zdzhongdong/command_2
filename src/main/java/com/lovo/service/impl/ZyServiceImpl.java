package com.lovo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lovo.bean.ZyEntity;
import com.lovo.mapper.ZyEntityMapper;
import com.lovo.service.IZyService;

@Service("zyService")
public class ZyServiceImpl implements IZyService{
@Autowired
private ZyEntityMapper zy;



@Override
public List<ZyEntity> findByArea(String area) {

	return 	zy.findByArea(area);
}

@Override
public List<ZyEntity> findByType(String type) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void add(ZyEntity zys) {
	zy.addzy(zys);
	
}


}
