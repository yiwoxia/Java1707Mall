package com.situ.mall.service.impl.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.front.ShippingDao;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.front.IShippingService;

@Service
public class ShippingServiceImpl implements IShippingService{

	@Resource(name="shippingDao")
	private ShippingDao shippingDao;
	//根据用户Id查询

	@Override
	public List<Shipping> findByUserId(Integer id) {
		// TODO Auto-generated method stub
		return shippingDao.findByUserId(id);
	}

}
