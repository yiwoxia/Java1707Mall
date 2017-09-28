package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Categrory;
import com.situ.mall.service.ICategroryService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private ICategroryService categoryService;
	//查询所有的分类的父类
	@RequestMapping("/categoryParent")
	@ResponseBody
	private List<Categrory> categoryParent(){
		List<Categrory> cplist = categoryService.fingAllCategoryParent();
		for(Categrory categrory : cplist){
			System.out.println(categrory);
		}
		return cplist;
	}
	//查找所有的子类
	@RequestMapping("/category")
	@ResponseBody
	private List<Categrory> category (Integer parentId){
		List<Categrory> clist = categoryService.findAllCategory(parentId);
		System.err.println(clist);
		return clist;
		
	}
}
