package com.situ.mall.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Categrory;

@Repository("categroryDao")
public interface CategroryDao {
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<Categrory> finAll();
	/**
	 * 查询全部的父类分类
	 * @return
	 */
	public List<Categrory> findAllCategoryParent();
	/**
	 * 根据父类的id查询子类
	 * @param parenId
	 * @return
	 */
	public List<Categrory> findAllCategory(Integer parentId);
		
}	
