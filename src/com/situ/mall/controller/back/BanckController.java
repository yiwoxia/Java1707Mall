package com.situ.mall.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/banck")
public class BanckController {

	@RequestMapping("/index")
	private String index(){
		return "index";
	}
	
}
