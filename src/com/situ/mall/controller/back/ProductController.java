package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping("/mall")
public class ProductController {
	
	@Autowired
	public IProductService productService;
	
	//查找所有信息
	@RequestMapping("/findAll")
	public String findAll(Model model){
		System.out.println("ProductController.findAll()");
		List<Product> list = productService.finAll();
		model.addAttribute("list",list);
		for (Product product : list) {
			System.out.println(product);
		}
		return "product_list";	
	}
	
}
