package com.situ.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.service.ICategroryService;

@Controller
@RequestMapping("/categrory")
public class CategoryController {

	@Autowired
	private ICategroryService categoryService;
	
}
