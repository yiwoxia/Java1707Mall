package com.situ.mall.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Product;
@Repository("productDao")
public interface ProductDao {

	/**
	 * 获取所有信息 
	 * @return
	 */
	public List<Product> finAll();

}
