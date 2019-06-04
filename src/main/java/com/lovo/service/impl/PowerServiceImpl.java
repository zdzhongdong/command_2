package com.lovo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lovo.bean.PowerEntity;
import com.lovo.service.IPowerService;

@Service(value="powerService")
public class PowerServiceImpl implements IPowerService {

	@Override
	public List<PowerEntity> getListPowerByRoleId(String roleId) {
		
		return null;
	}
    
}
