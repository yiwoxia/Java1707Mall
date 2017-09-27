package com.situ.mall.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;
@Repository("productDao")
public interface ProductDao {

	/**
	 * 获取所有信息 
	 * @return
	 */
	public List<Product> finAll();
	/**
	 * 分页
	 * @return
	 */
	public int totalSize();
	public List<Product> pageList(PageBean<Product> pageBean);
	/**
	 * 添加
	 * @param product
	 * @return
	 */
	public int addProduct(Product product);
	/**
	 * 有条件的分页
	 * @param condition
	 * @return
	 */
	public int totalSizeByCondition(SearchCondition condition);
	public List<Product> pageListByCondition(SearchCondition condition);
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
