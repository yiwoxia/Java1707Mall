package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.StudentDao;
import com.situ.mall.pojo.Student;
import com.situ.mall.service.IStudentService;

@Service("studentService")
public class StudentServiceImpl implements IStudentService {

	@Resource(name="studentDao")
	private StudentDao studentDao;
	@Override
	public List<Student> finAll() {
		
		return studentDao.finAll();
	}
	

}
