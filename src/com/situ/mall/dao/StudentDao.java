package com.situ.mall.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Student;
@Repository("studentDao")
public interface StudentDao {
	/**
	 * 查询所有
	 * @return
	 */
  public List<Student> finAll();
 

}
