package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

public interface IProductService {

	/**
	 * 获取所有信息
	 * @return
	 */
	public List<Product> finAll();
	/**
	 * 分页无条件
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public PageBean<Product> pageList(Integer pageIndex, Integer pageSize);
	/**
	 * 添加
	 * @param product
	 */
	public void addProduct(Product product);
	/**
	 * 分页有条件
	 * @param pageIndex
	 * @param pageSzie
	 * @return
	 */
	public PageBean<Product> pageListByCondition(SearchCondition condition);
	/**
	 * 修改
	 * @param product
	 * @return
	 */
	public boolean update(Product product);
	/**
	 * 根据Id查询
	 * @param id
	 * @return
	 */
	public Product findById(int id);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public boolean deleteById(int id);

}
