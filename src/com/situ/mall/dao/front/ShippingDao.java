package com.situ.mall.dao.front;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Shipping;

@Repository("shippingDao")
public interface ShippingDao {
	//根据用户ID查询
	 public List<Shipping> findByUserId(Integer id);


}
