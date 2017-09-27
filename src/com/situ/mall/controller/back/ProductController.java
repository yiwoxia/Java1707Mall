package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Categrory;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ICategroryService;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Controller
@RequestMapping("/mall")
public class ProductController {
	
	@Autowired
	public IProductService productService;
	@Autowired
	public ICategroryService categroryService;
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
	//分页无条件
	@RequestMapping("/pageList")
	public String pageList(Integer pageIndex,Integer pageSize,Model model){
		
		if(pageIndex == null){
			pageIndex = 1 ;
		}
		 pageSize = 3;
		 PageBean<Product> pageBean = productService.pageList(pageIndex,pageSize);
		 model.addAttribute("pageBean",pageBean);
		 System.out.println("PageBean"+pageBean);
		 for (Product product : pageBean.getList()) {
			System.out.println(product);
		}
		return "product_list";	
	}
	//添加信息
	@RequestMapping("addProdutCont")
	private String addProdutCont(Product product){
		System.out.println("ProductController.addProdutCont()");
		productService.addProduct(product);
		
		return "redirect:pageList.action";
	}
	//跳转添加信息jsp
	@RequestMapping("/toaddProdutct")
	private String toaddProdutct(Model model){
		return "produtct_add";
	}
	//分页查询
	@RequestMapping("/seacherByCondition")
	private String searchByCondition(SearchCondition condition,Model model){
		if(condition.getPageIndex() == null){
			condition.setPageIndex(1);
		}
		condition.setPageSzie(3);
		//获取分类
		getByCategory(model);
		PageBean<Product> pageBean = productService.pageListByCondition(condition);
		model.addAttribute("pageBean",pageBean);
		model.addAttribute("condition",condition);
		
		return "product_list";
		
	}
	//修改
	@RequestMapping("/updateProduct")
	private String upfdateProduct(Product product){
		boolean result = productService.update(product);
		return "redirect:pageList.action";
		
	}
	//转js页面
	@RequestMapping("/toupdateProduct")
	private String toupdateProduct(int id,Model model){
		Product product = productService.findById(id);
		model.addAttribute("product",product);
		System.out.println("通过ID查询到学生信息"+product);
		return "product_update";
	}
	//删除
	@RequestMapping("/deleteById")
	private String deleteById(int id,Model model){
		boolean result = productService.deleteById(id);
		return "redirect:pageList.action";
	}
	//获取分类表
	private void getByCategory(Model model) {
		List<Categrory> CList = categroryService.finAll();
		model.addAttribute("CList",CList);
		}
}
