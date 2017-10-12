package com.situ.mall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.service.IProductService;

@Controller
@RequestMapping("order")
public class FrontOrderController {

	
	
	@RequestMapping("/oredeS")
	private String order(){

		
		return "order";
	
	}
	
}
