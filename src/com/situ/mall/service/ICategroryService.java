package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Categrory;

public interface ICategroryService {
	/**
	 * 查询所有
	 * @return
	 */
	public List<Categrory> finAll();
	/**
	 * 查询全部的父类分类
	 * @return
	 */
	public List<Categrory> fingAllCategoryParent();
	/**
	 * 根据父类的id查询子类
	 * @param parenId
	 * @return
	 */
	public List<Categrory> findAllCategory(Integer parenId);
}
