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
		
}
