package com.situ.mall.service.front;

import java.util.List;

import com.situ.mall.pojo.Shipping;

public interface IShippingService {
	/**
	 * 根据用户Id查询
	 * @param id
	 * @return
	 */

	public List<Shipping>  findByUserId(Integer id);
	/**
	 * 添加地址
	 * @param shipping
	 */
	public boolean addShipping(Shipping shipping);

}
