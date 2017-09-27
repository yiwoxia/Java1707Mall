package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Service("productService")
public class ProductServiceImpl implements IProductService {

	@Resource(name="productDao")
	private ProductDao productDao;
	//获取所有信息
	@Override
	public List<Product> finAll() {
		return productDao.finAll();
	}
	//分页无条件
	@Override
	public PageBean<Product> pageList(Integer pageIndex, Integer pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		//设置当前页
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalSize = productDao.totalSize();
		//看有多少页
		int totalpage = (int) Math.ceil(1.0 * totalSize / pageSize);
		pageBean.setTotalCount(totalpage);
		System.out.println(totalpage);
		pageBean.setTotalpage(totalpage);
		System.out.println("+++"+totalSize);
		List<Product> list = productDao.pageList(pageBean);
		System.out.println("-------"+list);
		pageBean.setList(list);
		return pageBean;
	}
	//分页有条件
	@Override
	public PageBean<Product> pageListByCondition(SearchCondition condition) {
		PageBean<Product> pageBean = new PageBean<Product>();
		//设置当前页
		pageBean.setPageIndex(condition.getPageIndex());
		condition.setPageIndex((condition.getPageIndex()-1)*condition.getPageSzie());
		//设置一页有多少数据
		pageBean.setPageSize(condition.getPageSzie());
		int totalSize = productDao.totalSizeByCondition(condition);
		//看看有多少页
		int totalPage = (int) Math.ceil(1.0 * totalSize / condition.getPageSzie());
		pageBean.setTotalCount(totalSize);
		pageBean.setTotalpage(totalPage);
		List<Product> list = productDao.pageListByCondition(condition);
		for (Product product : list) {
		  System.out.println(list);	
		}
		pageBean.setList(list);
		return pageBean;
	}
	
	//添加
	@Override
	public void addProduct(Product product) {
		int result = productDao.addProduct(product);
		if(result>0){
			System.out.println("添加成功"+result);
		}else{
			System.out.println("添加失败"+result);
		}
		
	}
	//修改
	@Override
	public boolean update(Product product) {
		
		return productDao.update(product);
	}
	//根据Id查询
	@Override
	public Product findById(int id) {
		return productDao.findById(id);
	}
	//删除
	@Override
	public boolean deleteById(int id) {
		return productDao.deleteById(id);
	}
}
