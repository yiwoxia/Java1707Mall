package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.CategroryDao;
import com.situ.mall.pojo.Categrory;
import com.situ.mall.service.ICategroryService;

@Service("categroryService")
public class CategroryServiceImpl implements ICategroryService {

	@Resource(name="categroryDao")
	private CategroryDao categroryDao;
	//获取所有信息
	@Override
	public List<Categrory> finAll() {
		
		return categroryDao.finAll();
	}

}
