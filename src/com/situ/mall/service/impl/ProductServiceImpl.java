package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;

@Service("productService")
public class ProductServiceImpl implements IProductService {

	@Resource(name="productDao")
	private ProductDao productDao;
	//获取所有信息
	@Override
	public List<Product> finAll() {
		return productDao.finAll();
	}
	
}
