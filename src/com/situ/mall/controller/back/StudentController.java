package com.situ.mall.controller.back;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Student;
import com.situ.mall.service.IStudentService;

/*如果写AAutowired可以不用写了*/
@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private IStudentService studentService;

	//查找所有有学
	@RequestMapping("/findAll")
	private String  finAll(Model model){
		System.out.println("StudentController.finAll()");
		List<Student> list = studentService.finAll();
		model.addAttribute("list",list);
		for (Student student : list) {
			System.out.println(student);
		}
		return "show_student";
		
	}
	

}
