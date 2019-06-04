package com.lovo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.lovo.bean.ModelEntity;
import com.lovo.mapper.ModelEntityMapper;
import com.lovo.service.IModelService;
@Service
public class ModelServiceImpl implements IModelService{
	@Autowired
	private ModelEntityMapper mp;

	@Override
	public void savaModel(ModelEntity model) {
		// TODO Auto-generated method stub
		mp.insert(model);
	}

	@Override
	public void delModel(Integer id) {
		// TODO Auto-generated method stub
		mp.deleteByPrimaryKey(id);
		
	}

	@Override
	public List<ModelEntity> findByMBType(String type) {
		// TODO Auto-generated method stub
		return mp.findByType(type);
	}

	@Override
	public void updateModel(Integer id, Integer docterNum, Integer anbNm, Integer firNum, Integer inferNum) {
		// TODO Auto-generated method stub
		ModelEntity me=new ModelEntity(id, null, null, null, docterNum, anbNm, firNum, inferNum, null, null);
		mp.updateByPrimaryKeySelective(me);
		
	}
	public static void main(String[] args) {
		ClassPathXmlApplicationContext app=new ClassPathXmlApplicationContext("applicationContext.xml");
//		m.findByMBType(type)
		IModelService m= (IModelService) app.getBean("modelService");
//		m.savaModel(new ModelEntity(null,"模板一", "火灾", "A", 4, 4, 4, 5, "wo", "122223232"));
//		System.out.println(m.findByMBType(null));
//		m.delModel(6);
//		m.updateModel(1, 10, 10, 10, 10);
//		System.out.println(m.findModelById(2));
//		System.out.println(m.findByTypeAndRank("火灾", "1"));
	}

	@Override
	public ModelEntity findModelById(Integer id) {
		// TODO Auto-generated method stub
		return mp.selectByPrimaryKey(id);
	}

	@Override
	public List<ModelEntity> findByTypeAndRank(String type, String rank) {
		// TODO Auto-generated method stub
		return mp.findByTypeAndRank(type, rank);
	}

}
